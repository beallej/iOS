import Foundation
import Quick
import Nimble

@testable import HelloRest

class PersonDetailsViewModelTests : QuickSpec {
    override func spec() {
        var viewModel: PersonDetailsViewModel!
        var peopleServiceMock: PeopleServiceMock!

        beforeEach {
            peopleServiceMock = PeopleServiceMock()
            viewModel = PersonDetailsViewModel(withID: 0, peopleService: peopleServiceMock)
        }

        describe("Person Details View Model") {
            it("shoukd initialize with a single person") {
                let expectedPerson = Person(id: 0, name: "someName", age: 10, phone: "somePhone")
                expect(viewModel.person.value).toEventually(equal(expectedPerson))
            }

            it("should call getPersonByID with the correct ID") {
                expect(peopleServiceMock.didCallPersonByIDWithID) == 0
            }

            it("should return a person name when they have one") {
                expect(viewModel.name).toEventually(equal("someName"))
            }

            it("should return an empty string for name when the person is nil") {
                viewModel.person.value = nil
                expect(viewModel.name) == ""
            }

            it("should return a person's age as a string when they have one") {
                expect(viewModel.age).toEventually(equal("10"))
            }

            it("should return an empty string for age when the person is nil") {
                viewModel.person.value = nil
                expect(viewModel.age) == ""
            }

            it("should return a person's phone as a string when they have one") {
                expect(viewModel.phone).toEventually(equal("somePhone"))
            }

            it("should return an empty string for phone when the person is nil") {
                viewModel.person.value = nil
                expect(viewModel.phone) == ""
            }
        }
    }
}