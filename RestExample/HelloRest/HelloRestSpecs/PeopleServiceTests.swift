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

        describe(".getAllPeople") {
            it("should get people with limited detail from list endpoint") {
                let peopleService = PeopleService()
                var completionCalled = false
                var actualPeople:[Person] = []

                peopleService.getAllPeople { people in
                    completionCalled = true
                    actualPeople = people
                }

                expect(completionCalled).toEventually(beTrue())
                expect(actualPeople).toEventually(haveCount(2))

                let firstPerson = actualPeople.first

                expect(firstPerson?.id).toNot(beNil())
                expect(firstPerson?.name).toNot(beNil())
                expect(firstPerson?.phone).to(beNil())
            }

        }

    }
}