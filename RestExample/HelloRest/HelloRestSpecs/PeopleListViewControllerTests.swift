import Quick
import Nimble
import SwiftyJSON
import OHHTTPStubs
import Alamofire
@testable import HelloRest

import UIKit

class PeopleListViewControllerTests : QuickSpec {
    var vc : PeopleListViewController!
    
    override func spec() {
        
        beforeEach {
            let storyBoard = UIStoryboard(name:"PeopleListView", bundle: nil)
            self.vc = storyBoard.instantiateInitialViewController() as! PeopleListViewController
            
        }
                
        describe(".viewDidLoad") {
            it("should setup title and adapter and delegate"){
                

                //calls viewDidLoad()
                let _ = self.vc.view

                expect(self.vc.title).to(equal("Contacts"))
                expect(self.vc.tableView.delegate).toNot(beNil())

            }
        }

        
    }
}
