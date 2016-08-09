import UIKit
import PureLayout

class PersonDetailsView : UIView {
    var nameFieldLabel: UILabel?
    var ageFieldLabel: UILabel?
    var phoneFieldLabel: UILabel?

    override func drawRect(rect: CGRect) {
        let nameFieldLabel = UILabel(forAutoLayout: ())
        addSubview(nameFieldLabel)
        nameFieldLabel.autoPinEdgeToSuperviewEdge(.Trailing,withInset: 20.0)
        nameFieldLabel.autoPinEdgeToSuperviewEdge(.Leading, withInset: 20.0)
        nameFieldLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: 80.0)
        nameFieldLabel.text = "Name:"
        self.nameFieldLabel = nameFieldLabel

        let ageFieldLabel = UILabel(forAutoLayout: ())
        addSubview(ageFieldLabel)
        ageFieldLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameFieldLabel, withOffset: 20.0)
        ageFieldLabel.autoPinEdgeToSuperviewEdge(.Leading, withInset: 20.0)
        ageFieldLabel.autoPinEdgeToSuperviewEdge(.Trailing,withInset: 20.0)
        ageFieldLabel.text = "Age:"
        self.ageFieldLabel = ageFieldLabel

        let phoneFieldLabel = UILabel(forAutoLayout: ())
        addSubview(phoneFieldLabel)
        phoneFieldLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: ageFieldLabel, withOffset: 20.0)
        phoneFieldLabel.autoPinEdgeToSuperviewEdge(.Leading, withInset: 20.0)
        phoneFieldLabel.autoPinEdgeToSuperviewEdge(.Trailing,withInset: 20.0)
        phoneFieldLabel.text = "Phone:"
        self.phoneFieldLabel = phoneFieldLabel
    }

    func updateLabels(name: String, phone: String, age: String) {
        if let nameFieldLabel = nameFieldLabel,
            ageFieldLabel = ageFieldLabel,
            phoneFieldLabel = phoneFieldLabel {
            nameFieldLabel.text = "Name: \(name)"
            ageFieldLabel.text = "Age: \(age)"
            phoneFieldLabel.text = "Phone: \(phone)"
        }
    }
}
