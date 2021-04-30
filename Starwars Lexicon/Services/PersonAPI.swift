//
//  PersonAPI.swift
//  Starwars Lexicon
//
//  Created by Özgün Yildiz on 22.04.21.
//


import Foundation
import Alamofire
import SwiftyJSON

// class responsible for handling the person data

class PersonApi {
    
    // Web request with AlamoFire and Codable
    func getRandomPersonAlamo(id: Int, completion: @escaping (Person?) -> Void) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
            // once the url request is completed, we have access to the data, response and error
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                // we are telling it what type we want to get out of the data we put in
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
    
    
    
    // Web request with Alamofire and SwiftyJSON
//    func getRandomPersonAlamo(id: Int, completion: @escaping (Person?) -> Void) {
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
//            // once the url request is completed, we have access to the data, response and error
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let data = response.data else { return completion(nil) }
//            do {
//                let json = try JSON(data: data)
//                let person = self.parsePersonSwifty(json: json)
//                completion(person)
//            } catch {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//            }
//        }
//
//    }
    
    
    
    
    // Web request with Alamofire
    
    
//    func getRandomPersonAlamo(id: Int, completion: @escaping (Person?) -> Void) {
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
//            // once the url request is completed, we have access to the data, response and error
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let json = response.result.value as? [String: Any] else { return completion(nil) }
//            let person = self.parsePersonManual(json: json)
//            completion(person)
//
//        }
//
//    }
    
    
        // web request with URLSession
    func getRandomPersonUrlSession(id: Int, completion: @escaping (Person?) -> Void) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
            // once the url request is completed, we have access to the data, response and error
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error!.localizedDescription)
                completion(nil)
                return
            }

            guard let data = data else { return }

            do {
                // we get jSON of type any object
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                // we need it to be of type dictionary
                // the key of json Data are ALWAYS Strings, while their values may be of many different types
                guard let json = jsonAny as? [String:Any] else { return }
                let person = self.parsePersonManual(json: json)
                DispatchQueue.main.async {
                    completion(person)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
    
    func parsePersonManual(json:[String:Any]) -> Person {
      let name = json["name"] as? String ?? ""
      let height = json["height"] as? String ?? ""
      let mass = json["mass"] as? String ?? ""
      let hair = json["hair_color"] as? String ?? ""
      let birthYear = json["birth_year"] as? String ?? ""
      let gender = json["gender"] as? String ?? ""
      let homeworldUrl = json["homeworld"] as? String ?? ""
      let filmUrls = json["films"] as? [String] ?? [String]()
      let vehicleUrls = json["films"] as? [String] ?? [String]()
      let starshipUrls = json["starships"] as? [String] ?? [String]()


      let person = Person(name: name, gender: gender, birthYear: birthYear, mass: mass, height: height, hair: hair, homeWorld: homeworldUrl, films: filmUrls, vehicles: vehicleUrls, starships: starshipUrls)
      return person

  }
    
    // parsing with swiftyJSON
    
    private func parsePersonSwifty(json: JSON) -> Person {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworldUrl = json["homeworld"].stringValue
        let filmUrls = json["films"].arrayValue.map ({ $0.stringValue })
        let vehicleUrls = json["films"].arrayValue.map ({ $0.stringValue })
        let starshipUrls = json["starships"].arrayValue.map ({ $0.stringValue })


        let person = Person(name: name, gender: gender, birthYear: birthYear, mass: mass, height: height, hair: hair, homeWorld: homeworldUrl, films: filmUrls, vehicles: vehicleUrls, starships: starshipUrls)
        return person
    
    
    // parsing function using manual methods

      
    
}
}
