//
//  PersonAPI.swift
//  Starwars Lexicon
//
//  Created by Özgün Yildiz on 22.04.21.
//


import Foundation

// class responsible for handling the person data

class PersonApi {
    
    func getRandomPersonUrlSession(completion: @escaping (Person?) -> Void) {
  
        guard let url = URL(string: PERSON_URL) else { return }
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
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
    private func parsePersonManual(json:[String:Any]) -> Person {
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
    
}
