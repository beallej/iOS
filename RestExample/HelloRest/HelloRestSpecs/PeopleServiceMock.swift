import Foundation

@testable import HelloRest

class PeopleServiceMock: PeopleServiceType {
    var getAllPeopleCalled = false
    var getAllPeopleWithDetailsCalled = false
    var stubbedPeopleWithoutDetail = [Person(id: 1, name: "someName")]

    func getAllPeople(onCompletion: ([Person]) -> Void){
        getAllPeopleCalled = true
        onCompletion(stubbedPeopleWithoutDetail)
    }

    func getAllPeopleWithDetails(onCompletion:([Person])-> Void) {
        getAllPeopleWithDetailsCalled = true
        onCompletion(stubbedPeopleWithoutDetail)
    }
}