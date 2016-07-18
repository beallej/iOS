import UIKit
import ReactiveCocoa

class PersonDetailsViewController : UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    var viewModel: PersonDetailsViewModel!
    let personSignal = MutableProperty<Person?>(nil)
    var peopleService:PeopleServiceType = PeopleService()

    var personID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        setUpViewModel()
    }
    func setUpViewModel() {
        viewModel = PersonDetailsViewModel(withID: personID!, peopleService: peopleService)
        personSignal <~ viewModel.person.producer

        personSignal.producer.startWithNext {[weak self] _ in
            self?.updateLabels()
        }
    }

    func updateLabels() {
        nameLabel.text = viewModel.name
        phoneLabel.text = viewModel.phone
        ageLabel.text = viewModel.age
    }
}
