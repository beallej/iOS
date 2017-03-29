import Foundation

@testable import HelloRest

class PeopleServiceMock: PeopleServiceType {
    var getAllPeopleCalled = false
    var getAllPeopleWithCellCalled = false
    var stubbedPeopleWithoutDetail = [Person(id: 1, name: "someName")]
    var stubbedPeopleWithCellDetail = [Person(id: 1, name: "someName", phone: "someCell")]

    func getAllPeople(_ onCompletion: @escaping ([Person]) -> Void){
        getAllPeopleCalled = true
        onCompletion(stubbedPeopleWithoutDetail)
    }
    func getAllPeopleWithCell(_ onCompletion: @escaping ([Person]) -> Void){
        getAllPeopleWithCellCalled = true
        onCompletion(stubbedPeopleWithCellDetail)
    }
}
