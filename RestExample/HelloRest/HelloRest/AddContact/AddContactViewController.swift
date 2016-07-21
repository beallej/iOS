import UIKit

class AddContactViewController : UIViewController {


    @IBOutlet weak var NameField: AddContactTextField!


    @IBOutlet weak var phoneField: AddContactTextField!


    @IBOutlet weak var ageField: AddContactTextField!


    @IBOutlet weak var continueButton: UIButton! {
        didSet {
            continueButton?.layer.borderWidth = 1.0
            continueButton?.layer.borderColor = UIColor.lightGrayColor().CGColor
            continueButton?.layer.cornerRadius = 23.0
        }
    }

    var peopleService: PeopleServiceType = PeopleService()

    @IBAction func continueButtonPressed(sender: UIButton) {
        if let name = NameField.text,
            phone = phoneField.text,
            age = ageField.text {
            let person = Person(id: 0, name: name, age: Int(age) , phone: phone)
            peopleService.addNewPerson(person) {_ in 
                print("yay!")

            }
        }
    }

}

class AddContactTextField : UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }

    func setUpUI(){
        alpha = 0.5
        textColor = UIColor.whiteColor()
        backgroundColor = UIColor.lightGrayColor()
        layer.cornerRadius = 15.0
        let paddingView = UIView(frame:CGRectMake(0, 0, 30, 30))
        leftView = paddingView;
        leftViewMode = UITextFieldViewMode.Always

    }

}