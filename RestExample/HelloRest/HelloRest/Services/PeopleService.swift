import Foundation
import Alamofire
import SwiftyJSON

protocol PeopleServiceType {
    func getAllPeopleJSON(onCompletion: ([Person]) -> Void)
}

class PeopleService : PeopleServiceType {

    func getAllPeopleJSON(onCompletion: ([Person]) -> Void) {
        Alamofire
            .request(.GET, "http://localhost:8000/list")
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let people = PeopleTransformer.transformListOfPeopleWithoutDetail(json)
                    onCompletion(people)
                }
        }

    }
}