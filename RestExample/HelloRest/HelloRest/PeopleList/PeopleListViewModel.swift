import UIKit
import SwiftyJSON
import ReactiveCocoa

struct PeopleListViewModel {
    let people = MutableProperty<[Person]>([])
    let peopleService: PeopleServiceType

    init(peopleService: PeopleServiceType) {
        self.peopleService = peopleService
        peopleService.getAllPeopleWithDetails { people in
            self.people.value = people
        }
    }

    var numberOfPeople: Int {
        return people.value.count
    }

    func getPersonAtIndex(index: Int) -> Person {
        return people.value[index]
    }
}