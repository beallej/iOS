import UIKit
import SwiftyJSON
import ReactiveCocoa

struct PeopleListViewModel {
    var isShowingDetails = MutableProperty(false)
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

    func getPersonAtIndex(index: Int) -> Person {
        return people.value[index]
    }

    private func toggleIsShowingDetails() {
        isShowingDetails.value = !isShowingDetails.value
    }

    func getAllPeopleWithDetails(){
        if isShowingDetails.value {
            peopleService.getAllPeople() { people in
                self.people.value = people
            }
        } else {
            peopleService.getAllPeopleWithDetails() { people in
                self.people.value = people
            }
        }
        toggleIsShowingDetails()
    }
}