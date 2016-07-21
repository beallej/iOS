import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import HelloRest

class PeopleTransformerTests: QuickSpec {
    override func spec() {
        describe("TransformListOfPeople") {
            it("should transform a json object of people without detail") {
                let expectedPerson = Person(id: 1, name: "someName")
                let jsonResponse = JSON([["id": 1, "name":"someName"]])
                let _ = PeopleTransformer.transformListOfPeople(jsonResponse).map {
                    expect($0) == expectedPerson
                }
            }

            it("should transform a json object of people with detail") {
                let expectedPerson = Person(id: 1, name: "someName", age: 10, phone: "somePhone")
                let jsonResponse = JSON([["id": 1, "name":"someName", "age":10, "phone":"somePhone"]])
                let _ = PeopleTransformer.transformListOfPeople(jsonResponse).map {
                    expect($0) == expectedPerson
                }
            }
        }

        describe("transform person"){
            it("should transform person into paramter dictionary") {
                let id = 1
                let name = "someName"
                let age = 10
                let phone = "somePhone"

                let person = Person(id: id, name: name, age: age, phone: phone)

                let actualParameters = PeopleTransformer.transformPersonToParameterDictionary(person)

                //FIX THIS PLZ
                let actualID = actualParameters["id"] as! Int
                let actualName = actualParameters["name"] as! String
                let actualAge = actualParameters["age"] as! Int
                let actualPhone = actualParameters["phone"] as! String


                expect(id).to(equal(actualID))
                expect(name).to(equal(actualName))
                expect(age).to(equal(actualAge))
                expect(phone).to(equal(actualPhone))
            }
        }
    }
}