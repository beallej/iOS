import Foundation
import Quick
import Nimble

@testable import HelloRest

class PeopleListViewModelTests : QuickSpec {
    override func spec() {
        describe("People List View Model") {
            var viewModel: PeopleListViewModel!
            var peopleServiceMock: PeopleServiceMock!
            
            beforeEach {
                peopleServiceMock = PeopleServiceMock()
                viewModel = PeopleListViewModel(peopleService: peopleServiceMock)
            }
            it("should initialize with a list of people") {
                expect(viewModel.people.value.count).toEventually(equal(1))
            }

            it("should return the number of people in the people list") {
                expect(viewModel.numberOfPeople).to(equal(1))
            }

            it("should return the person at an index") {
                let expectedPersonWithoutDetail = Person(id: 1, name: "someName")
                expect(viewModel.getPersonAtIndex(0)).to(equal(expectedPersonWithoutDetail))
            }

            it("reloadData() should call get all people") {
                viewModel.reloadData()

                expect(peopleServiceMock.getAllPeopleWithDetailsCalled).to(beTrue())
            }
        }
    }
}