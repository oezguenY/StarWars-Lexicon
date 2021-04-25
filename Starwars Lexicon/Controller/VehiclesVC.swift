//
//  VehiclesVC.swift
//  Starwars Lexicon
//
//  Created by Özgün Yildiz on 25.04.21.
//

import UIKit

class VehiclesVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    
    var person: Person!
    var vehiclesApi = VehiclesApi()
    var vehicles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicles
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url: String) {
        vehiclesApi.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setUpView(vehicle: vehicle)
            }
        }
    }
    
    func setUpView(vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        manufacturerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
    }
    
    @IBAction func previousBtnClicked(_ sender: Any) {
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
    }
    
    

}
