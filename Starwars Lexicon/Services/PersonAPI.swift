//
//  PersonAPI.swift
//  Starwars Lexicon
//
//  Created by Özgün Yildiz on 22.04.21.
//


import Foundation

// class responsible for handling the person data

class PersonApi {
    
    func getRandomPersonUrlSession() {
  
        guard let url = URL(string: PERSON_URL) else { return }
            // once the url request is completed, we have access to the data, response and error
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error!.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                // we get jSON of type any object
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                // we need it to be of type dictionary
                // the key of json Data are ALWAYS Strings, while their values may be of many different types
                guard let json = jsonAny as? [String:Any] else { return }
                
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
}
