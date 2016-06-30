import Foundation

@testable import HelloRest

class PeopleServiceMock: PeopleServiceType {
    var getAllPeopleCalled = false
    var stubbedPeopleWithoutDetail = [Person(id: 1, name: "someName")]
    var stubbedPeopleWithDetail = [Person(id: 1, name: "someName", age: 1, phone: "somePhoneNumber")]

    func getAllPeople(onCompletion: ([Person]) -> Void){
        getAllPeopleCalled = true
        onCompletion(stubbedPeopleWithoutDetail)
    }

    func getAllPeopleWithDetails(onCompletion: ([Person]) -> Void){
        getAllPeopleCalled = true
        onCompletion(stubbedPeopleWithDetail)
    }
}