//
//  VehiclesApi.swift
//  Starwars Lexicon
//
//  Created by Özgün Yildiz on 25.04.21.
//

import Foundation
import Alamofire

class VehiclesApi {
    
    func getVehicle(url: String, completion: @escaping (Vehicle?) -> ()) {
        
    guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            
            do {
                let homeworld = try jsonDecoder.decode(Vehicle.self, from: data)
                DispatchQueue.main.async {
                    completion(homeworld)
                }
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
        }
    
    }
}
