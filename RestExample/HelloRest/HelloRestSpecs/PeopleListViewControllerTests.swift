import Quick
import Nimble
import SwiftyJSON
import OHHTTPStubs
import Alamofire
@testable import HelloRest

import UIKit

class PeopleListViewControllerTests : QuickSpec {
    override func spec() {
                
        describe(".viewDidLoad") {
            it("should setup title and adapter"){
                let storyBoard = UIStoryboard(name:"PeopleListView", bundle: nil)
                let vc = storyBoard.instantiateInitialViewController() as! PeopleListViewController

                //calls viewDidLoad()
                let _ = vc.view

                expect(vc.title).to(equal("Contacts"))
            }
        }

        describe("go to person details") {
            var testableVC: TestablePeopleListViewController!
            let id = 0

            beforeEach {
                testableVC = TestablePeopleListViewController()
            }

            it("should push personDetailsViewController") {
                testableVC.goToPersonDetailsView(withID: id)
                expect(testableVC.didPresentViewController).to(beAKindOf(PersonDetailsViewController.self))
            }

            it("should have the proper productID set") {
                testableVC.goToPersonDetailsView(withID: id)

                let detailsVC = testableVC.didPresentViewController as! PersonDetailsViewController

                expect(detailsVC.personID).to(equal(id))
            }
        }
    }
}

class TestablePeopleListViewController: PeopleListViewController {
    var didPresentViewController: UIViewController?

    override func pushViewControllerOntoNavigationController(withViewController viewController: UIViewController, animated: Bool) {
        didPresentViewController = viewController
    }
}
