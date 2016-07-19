import Foundation
import Alamofire
import SwiftyJSON

protocol PeopleServiceType {
    func getAllPeople(onCompletion: ([Person]) -> Void)
    func getPersonByID(withID id: Int, onCompletion: (Person) -> Void)
    func getAllPeopleWithDetails(onCompletion:([Person])-> Void)
}

class PeopleService : PeopleServiceType {

    func getAllPeople(onCompletion: ([Person]) -> Void) {
        Alamofire
            .request(.GET, "http://localhost:8000/list")
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let people = PeopleTransformer.transformListOfPeople(json)
                    onCompletion(people)
                }
        }
    }

    func getPersonByID(withID id: Int, onCompletion: (Person) -> Void) {
        Alamofire
            .request(.GET, "http://localhost:8000/personByID?id=\(id)")
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let people = PeopleTransformer.transformListOfPeople(json)
                    onCompletion(people.first ?? Person(id: -1, name: ""))
                }
        }
    }

    func getAllPeopleWithDetails(onCompletion:([Person])-> Void) {
        Alamofire
            .request(.GET, "http://localhost:8000/listAll")
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let people = PeopleTransformer.transformListOfPeople(json)
                    onCompletion(people)
                }
        }
    }

    func addNewPerson(person: Person, onCompletion:(Person) -> Void) {
        var parameters: [String:String] = [:]
        parameters["id"] = "\(person.id)"
        parameters["name"] = person.name
        parameters["age"] = "\(person.age)"
        parameters["phone"] = person.phone

        Alamofire
            .request(.POST, "http://localhost:8000/add", parameters: parameters, encoding: .JSON)
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let person = PeopleTransformer.transformListOfPeople(json)
                    onCompletion(person.first ?? Person(id: -1, name: ""))
                }
        }
    }
}