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
        describe(".showDetails") {
            it("should toggle label to hide details on first button press") {
                let storyBoard = UIStoryboard(name:"PeopleListView", bundle: nil)
                let vc = storyBoard.instantiateInitialViewController() as! PeopleListViewController

                //calls viewDidLoad()
                let _ = vc.view

                vc.showDetailsButton.sendActionsForControlEvents(
                    UIControlEvents.TouchUpInside)
                expect(vc.showDetailsButton.titleLabel?.text).to(equal("Hide Details"))
            }
            it("should toggle label to show details if details were showing") {
                let storyBoard = UIStoryboard(name:"PeopleListView", bundle: nil)
                let vc = storyBoard.instantiateInitialViewController() as! PeopleListViewController

                //calls viewDidLoad()
                let _ = vc.view
                vc.viewModel.isShowingDetails.value = true

                vc.showDetailsButton.sendActionsForControlEvents(
                    UIControlEvents.TouchUpInside)
                expect(vc.showDetailsButton.titleLabel?.text).to(equal("Show Details"))
            }
        }
    }
}
