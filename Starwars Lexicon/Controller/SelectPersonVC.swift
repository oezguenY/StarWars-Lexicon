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
        
        homeworldButton.isEnabled = !person.homeWorld.isEmpty
        starshipsButton.isEnabled = !person.starships.isEmpty
        filmsButton.isEnabled = !person.films.isEmpty
        vehiclesButton.isEnabled = !person.vehicles.isEmpty
        
        
    }
    
    
    @IBAction func homeworldClicked(_ sender: Any) {
    }
    
    
    @IBAction func vehiclesClicked(_ sender: Any) {
    }
    
    
    
    @IBAction func starshipsClicked(_ sender: Any) {
    }
    
    
    
    @IBAction func filmsClicked(_ sender: Any) {
    }
    
    
    }
    
    

    

