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

        //desc labels:
        let nameIcon = UIImageView(forAutoLayout: ())
        view.addSubview(nameIcon)
        nameIcon.autoSetDimension(.Width, toSize: 20.0)
        nameIcon.autoSetDimension(.Height, toSize: 20.0)
        nameIcon.autoPinEdgeToSuperviewEdge(.Leading, withInset: 20.0)
        nameIcon.autoPinEdgeToSuperviewEdge(.Top, withInset: 80.0)
        nameIcon.image = UIImage(named: "NameIcon")

        let nameFieldLabel = UILabel(forAutoLayout: ())
        view.addSubview(nameFieldLabel)
        nameFieldLabel.autoSetDimension(.Height, toSize: 20.0)
        nameFieldLabel.autoSetDimension(.Width, toSize: 100.0)
        nameFieldLabel.autoPinEdge(.Leading, toEdge: .Trailing, ofView: nameIcon, withOffset: 10.0)
        nameFieldLabel.autoPinEdge(.Top, toEdge: .Top, ofView: nameIcon)
        nameFieldLabel.text = "Name:"




        let ageFieldLabel = UILabel(forAutoLayout: ())
        view.addSubview(ageFieldLabel)
        ageFieldLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameFieldLabel)
        ageFieldLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameFieldLabel, withOffset: 20.0)
        ageFieldLabel.autoSetDimension(.Height, toSize: 20.0)
        ageFieldLabel.autoSetDimension(.Width, toSize: 100.0)
        ageFieldLabel.text = "Age:"

        let phoneFieldLabel = UILabel(forAutoLayout: ())
        view.addSubview(phoneFieldLabel)
        phoneFieldLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: ageFieldLabel)
        phoneFieldLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: ageFieldLabel, withOffset: 20.0)
        phoneFieldLabel.autoSetDimension(.Height, toSize: 20.0)
        phoneFieldLabel.autoSetDimension(.Width, toSize: 100.0)
        phoneFieldLabel.text = "Phone:"

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
//        nameLabel.text = viewModel.name
//        phoneLabel.text = viewModel.phone
//        ageLabel.text = viewModel.age
    }
}
