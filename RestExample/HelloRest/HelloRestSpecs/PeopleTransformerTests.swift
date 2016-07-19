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
                let expectedParameters: [String:AnyObject] = ["id": 1, "name":"someName", "age":10, "phone":"somePhone"]
                let person = Person(id: 1, name: "someName", age: 10, phone: "somePhone")

                let actualParameters = PeopleTransformer.transformPersonToParameterDictionary(person)

                //FIX THIS PLZ
                expect(true).to(beFalse())
            }
        }
    }
}