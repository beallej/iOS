import UIKit
import ReactiveCocoa
import PureLayout

class PersonDetailsViewController : UIViewController {
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
        guard let detailsView = view as? PersonDetailsView else { return }
        detailsView.updateLabels(viewModel.name, phone: viewModel.phone, age: viewModel.age)
    }
}
