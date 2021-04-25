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
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var person: Person!
    var vehiclesApi = VehiclesApi()
    var vehicles = [String]()
    var currentVehicle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // we made sure that there is a vehicle; You are only able to click on the button in the SelectPersonVC if there is at least one vehicle, allowing you to segue to the VehiclesVC
        vehicles = person.vehicles
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        // we are getting the url of the first vehicle in the vehicles array
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
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    
    func setButtonState() {
        
        if currentVehicle == 0 {
            previousBtn.isEnabled = false
        } else {
            previousBtn.isEnabled = true
        }
        
        if currentVehicle == vehicles.count - 1 {
            nextBtn.isEnabled = false
        } else {
            nextBtn.isEnabled = true
        }
        
        getVehicle(url: vehicles[currentVehicle])
        
    }
    
    
    

}
