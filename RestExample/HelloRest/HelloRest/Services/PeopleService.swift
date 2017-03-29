import Foundation
import Alamofire
import SwiftyJSON

protocol PeopleServiceType {
    func getAllPeople(_ onCompletion:  @escaping ([Person]) -> Void)
    func getAllPeopleWithCell(_ onCompletion:  @escaping ([Person]) -> Void)
}

class PeopleService : PeopleServiceType {
  

    func getAllPeople(_ onCompletion: @escaping ([Person]) -> Void) {
        Alamofire
            .request("http://localhost:8000/list")
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let people = PeopleTransformer.transformListOfPeople(json)
                    onCompletion(people)
                }
        }

    }
    func getAllPeopleWithCell(_ onCompletion: @escaping ([Person]) -> Void) {
        Alamofire
            .request("http://localhost:8000/listAll")
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let people = PeopleTransformer.transformListOfPeople(json)
                    onCompletion(people)
                }
        }
        
    }
}
