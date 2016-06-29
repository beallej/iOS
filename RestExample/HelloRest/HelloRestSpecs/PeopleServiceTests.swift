import Foundation
import Quick
import Nimble
import OHHTTPStubs
import SwiftyJSON

@testable import HelloRest

class PeopleServiceTests: QuickSpec {
    override func spec() {
        beforeEach {
            stub(isHost("localhost") && isPath("/list") && isMethodGET()) { request in

                let obj = [[
                    "id": 7,
                    "name": "Ballard Craig",
                ],
                [
                    "id": 8,
                    "name": "Brown Holt",
                ]]

                return OHHTTPStubsResponse(JSONObject: obj, statusCode: 200, headers: nil).responseTime(OHHTTPStubsDownloadSpeed3G)

            }
        }

        afterEach {
            OHHTTPStubs.removeAllStubs()
        }

        describe(".getAllPeopleJSON") {
            it("should get data from list all") {
                let peopleService = PeopleService()
                var completionCalled = false
                var actualResponse:[Person] = []

                peopleService.getAllPeopleJSON { response in
                    completionCalled = true
                    actualResponse = response
                }

                expect(completionCalled).toEventually(beTrue())
                expect(actualResponse).toEventually(haveCount(2))
            }

        }

    }
}