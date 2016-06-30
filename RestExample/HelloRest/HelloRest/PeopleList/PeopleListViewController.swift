import UIKit
import Alamofire
import SwiftyJSON
import ReactiveCocoa

class PeopleListViewController: UIViewController{
    let peopleSignal = MutableProperty<[Person]>([])
    let isShowingDetails = MutableProperty(false)

    @IBOutlet weak var showDetailsButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    var viewModel: PeopleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        
        viewModel = PeopleListViewModel(peopleService: PeopleService())
        peopleSignal <~ viewModel.people.producer
        isShowingDetails <~ viewModel.isShowingDetails


        peopleSignal.producer.startWithNext { _ in
            self.tableView.reloadData()
        }
    }

    @IBAction func showDetails(sender: UIButton) {
        viewModel.getAllPeopleWithDetails()
        let label = isShowingDetails.value ? "Hide Details" : "Show Details"
        sender.setTitle(label, forState: .Normal)
    }
}

extension PeopleListViewController : UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPeople
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let personForIndex = viewModel.getPersonAtIndex(indexPath.row)
        let cellIdentifier = "\(personForIndex.id)"
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) ?? UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)

        cell.textLabel?.text = "\(personForIndex.name)  \(personForIndex.phone ?? "")"
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}



