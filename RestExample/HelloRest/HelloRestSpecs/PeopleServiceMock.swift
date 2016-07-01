import Foundation

@testable import HelloRest

class PeopleServiceMock: PeopleServiceType {
    var getAllPeopleCalled = false
    var getPersonByIDCalled = false
    var didCallPersonByIDWithID: Int?
    var getAllPeopleWithDetailsCalled = false
    var stubbedPeopleWithoutDetail = [Person(id: 1, name: "someName")]
    var stubbedPerson = Person(id: 0, name: "someName", age: 10, phone: "somePhone")

    func getAllPeople(onCompletion: ([Person]) -> Void){
        getAllPeopleCalled = true
        onCompletion(stubbedPeopleWithoutDetail)
    }

    func getPersonByID(withID id: Int, onCompletion: (Person) -> Void) {
        getPersonByIDCalled = true
        didCallPersonByIDWithID = id
        onCompletion(stubbedPerson)
    }
    
    func getAllPeopleWithDetails(onCompletion:([Person])-> Void) {
        getAllPeopleWithDetailsCalled = true
        onCompletion(stubbedPeopleWithoutDetail)
    }
}