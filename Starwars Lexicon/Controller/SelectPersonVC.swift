//
//  ViewController.swift
//  Starwars Lexicon
//
//  Created by Özgün Yildiz on 21.04.21.
//

import UIKit

class SelectPersonVC: UIViewController {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeworldButton: UIButton!
    @IBOutlet weak var vehiclesButton: UIButton!
    @IBOutlet weak var starshipsButton: UIButton!
    @IBOutlet weak var filmsButton: UIButton!
    
    var personApi = PersonApi()
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomClicked(_ sender: Any) {
        
        // the closure is derived from this:
        //    func makeSomethingWithPerson(person: Person?) -> Void {
        //        if let person = person {
        //            print(person.name)
        //        }
        //    }
        
        // and that's how we called the function
        // personApi.getRandomPersonUrlSession(completion: makeSomethingWithPerson)
        
        let random = Int.random(in: 1...87)
        
    
            self.personApi.getRandomPersonAlamo(id: random) { person in
                    if let person = person {
                        self.setUpView(person: person)
                        self.person = person
                    }
        }
       
    }
    
    
    func setUpView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYear.text = person.birthYear
        genderLbl.text = person.gender
        
        // we have a property observer for these buttons. Everytime they get enabled, we run code on them
        
        homeworldButton.isEnabled = !person.homeWorld.isEmpty
        starshipsButton.isEnabled = !person.starships.isEmpty
        vehiclesButton.isEnabled = !person.vehicles.isEmpty
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toHomeworld" {
            if let destination = segue.destination as? HomeworldVC {
                destination.person = person
            }
        } else if segue.identifier == "toVehicles" {
            if let destination = segue.destination as? VehiclesVC {
                destination.person = person
            }
            
        } else if segue.identifier == "toStarships" {
            if let destination = segue.destination as? StarshipsVC {
                destination.person = person
            }
        }
    }
    
    
    }
    
    

    

