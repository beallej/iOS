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
    }
}
