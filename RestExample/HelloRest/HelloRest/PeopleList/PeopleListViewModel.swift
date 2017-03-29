import UIKit
import SwiftyJSON
import ReactiveCocoa
import ReactiveSwift

class PeopleListViewModel {
    let people = MutableProperty<[Person]>([])
    let peopleService: PeopleServiceType

    init(peopleService: PeopleServiceType) {
        self.peopleService = peopleService
        peopleService.getAllPeople() { people in
            self.people.value = people
        }
    }
    

    var numberOfPeople: Int {
        return people.value.count
    }

    func getPersonAtIndex(_ index: Int) -> Person {
        return people.value[index]
    }
}
