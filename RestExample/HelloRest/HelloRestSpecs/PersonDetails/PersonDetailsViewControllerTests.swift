import Quick
import Nimble
import SwiftyJSON
import OHHTTPStubs
import Alamofire
@testable import HelloRest

import UIKit

class PersonDetailsViewControllerTests : QuickSpec {
    override func spec() {

        describe(".viewDidLoad") {
            it("should setup title and adapter"){
                let storyBoard = UIStoryboard(name:"PersonDetails", bundle: nil)
                let vc = storyBoard.instantiateInitialViewController() as! PersonDetailsViewController
                vc.personID = 1
                vc.peopleService = PeopleServiceMock()
                //calls viewDidLoad()
                let _ = vc.view

                expect(vc.title).to(equal("Details"))
            }
        }
    }
}