import Foundation
import ReactiveCocoa

struct AddContactViewModel {
    let peopleService: PeopleServiceType
    let didGetResponse = MutableProperty<Bool>(false)

    init(peopleService: PeopleServiceType) {
        self.peopleService = peopleService
    }

    func addPerson(personToAdd: Person) {
        self.peopleService.addNewPerson(personToAdd) { _ in
            self.didGetResponse.value = true
        }
    }

}