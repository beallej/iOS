import Foundation
import SwiftyJSON

struct PeopleTransformer {
    static func transformListOfPeopleWithoutDetail(response: JSON) -> [Person] {
        let jsonArray = response.arrayValue
        return jsonArray.map { json in
            Person(id: json["id"].intValue, name: json["name"].stringValue)
        }
    }
}