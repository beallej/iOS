import Foundation
import SwiftyJSON

struct PeopleTransformer {
    static func transformListOfPeople(response: JSON) -> [Person] {
        let jsonArray = response.arrayValue
        return jsonArray.map { json in
            Person(id: json["id"].intValue, name: json["name"].stringValue, age: json["age"].int, phone: json["phone"].string)
        }
    }

    static func transformPersonToParameterDictionary(person: Person) -> [String : AnyObject] {
        return ["id": person.id, "name": person.name, "age": person.age ?? -1, "phone": person.phone ?? ""]
    }
}