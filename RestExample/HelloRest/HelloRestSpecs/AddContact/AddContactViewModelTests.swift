import Foundation
import Quick
import Nimble

@testable import HelloRest

class AddContactViewModelTests : QuickSpec {
    override func spec() {
        describe("the add contact view model") {
            var peopleService: PeopleServiceMock!
            var viewModel: AddContactViewModel!

            beforeEach {
                peopleService = PeopleServiceMock()
                viewModel = AddContactViewModel(peopleService: peopleService)
            }

            it("should call add new person with correct person") {
                let personToAdd = Person(id: 0, name: "someName", age: 0, phone: "somePhone")
                viewModel.addPerson(personToAdd)

                expect(peopleService.addNewPersonCalled).to(beTrue())
                expect(peopleService.didAddPerson) == personToAdd
            }
        }
    }
}