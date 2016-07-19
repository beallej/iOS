import Foundation
import SwiftyJSON

struct PeopleTransformer {
    static func transformListOfPeople(response: JSON) -> [Person] {
        let jsonArray = response.arrayValue
        return jsonArray.map { json in
            Person(id: json["id"].intValue, name: json["name"].stringValue, age: json["age"].int, phone: json["phone"].string)
        }
    }

    static func transformPersonToParameterDictionary(person: Person) -> [String : String] {
        return ["" : ""]
    }
}