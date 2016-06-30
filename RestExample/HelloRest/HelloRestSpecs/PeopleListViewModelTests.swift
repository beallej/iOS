import Foundation
import Quick
import Nimble

@testable import HelloRest

class PeopleListViewModelTests : QuickSpec {
    override func spec() {
        var viewModel: PeopleListViewModel!
        beforeEach {
            viewModel = PeopleListViewModel(peopleService: PeopleServiceMock())
        }
        describe("People List View Model") {
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
        }
        describe("getAllPeopleWithDetails") {
            it("should return people with full detail if current people are without detail") {
                let expectedPersonWithDetail = Person(id: 1, name: "someName", age: 1, phone: "somePhoneNumber")
                viewModel.getAllPeopleWithDetails()
                expect(viewModel.people.value.first).toEventually(equal(expectedPersonWithDetail))
            }
            it("should return people without detail if current people have detail") {
                let expectedPersonWithDetail = Person(id: 1, name: "someName")
                viewModel.isShowingDetails.value = true
                viewModel.getAllPeopleWithDetails()
                expect(viewModel.people.value.first).toEventually(equal(expectedPersonWithDetail))
            }
        }
    }
}