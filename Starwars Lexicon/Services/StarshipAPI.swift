//
//  StarshipAPI.swift
//  Starwars Lexicon
//
//  Created by Özgün Yildiz on 27.04.21.
//

import Foundation
import Alamofire

class StarshipApi {
    
    
    func getStarship(url: String, completion: @escaping (Starship?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let model = try jsonDecoder.decode(Starship.self, from: data)
                DispatchQueue.main.async {
                    completion(model)
                }
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
        }
    }
    
}
