import UIKit
import Alamofire
import SwiftyJSON
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

        peopleSignal.producer.startWithNext { _ in
            self.tableView.reloadData()
        }
    }

    func goToPersonDetailsView(withID id: Int) {
        let targetStoryboard = UIStoryboard(name: "PersonDetails", bundle: nil)
        let viewController = targetStoryboard.instantiateInitialViewController() as! PersonDetailsViewController
        viewController.modalPresentationStyle = .OverCurrentContext
        viewController.modalTransitionStyle =  .CrossDissolve
        viewController.personID = id
        pushViewControllerOntoNavigationController(withViewController: viewController, animated: true)
    }

    //allows the above logic to be tested by abstracting the untestable part
    func pushViewControllerOntoNavigationController(withViewController viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
}

extension PeopleListViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPeople
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let personForIndex = viewModel.getPersonAtIndex(indexPath.row)
        let cellIdentifier =  "cell"
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) ?? UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)

        cell.textLabel?.text = personForIndex.name
        cell.detailTextLabel?.text = personForIndex.phone ?? ""
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let personID = viewModel.getPersonAtIndex(indexPath.row).id
        goToPersonDetailsView(withID: personID)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}



