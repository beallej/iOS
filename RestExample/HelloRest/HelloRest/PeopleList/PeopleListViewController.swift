import UIKit
import Alamofire
import SwiftyJSON
import ReactiveSwift
import ReactiveCocoa

class PeopleListViewController: UIViewController{
    let peopleSignal = MutableProperty<[Person]>([])

    @IBOutlet weak var tableView: UITableView!

    var viewModel: PeopleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        
        viewModel = PeopleListViewModel(peopleService: PeopleService())
        peopleSignal <~ viewModel.people.producer

        peopleSignal.producer.startWithValues { _ in
            self.tableView.reloadData()
        }
    }
}

extension PeopleListViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPeople
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personForIndex = viewModel.getPersonAtIndex(indexPath.row)
        let cellIdentifier = "cell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)

        cell.textLabel?.text = personForIndex.name
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}



