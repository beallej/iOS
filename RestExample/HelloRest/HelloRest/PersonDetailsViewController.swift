import UIKit
import ReactiveCocoa

class PersonDetailsViewController : UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    var viewModel: PersonDetailsViewModel!
    let personSignal = MutableProperty<Person?>(nil)

    var personID: Int? {
        didSet {
            viewModel = PersonDetailsViewModel(withID: personID!, peopleService: PeopleService())
            personSignal <~ viewModel.person.producer
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"

        personSignal.producer.startWithNext { _ in
            self.updateLabels()
        }
    }

    func updateLabels() {
        nameLabel.text = viewModel.name
        phoneLabel.text = viewModel.phone
        ageLabel.text = viewModel.age
    }
}
