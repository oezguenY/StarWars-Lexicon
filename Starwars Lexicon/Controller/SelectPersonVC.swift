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
    
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personApi.getRandomPersonUrlSession { person in
            if let person = person {
                print(person.name)
            }
        }
    }
    
    // the closure is derived from this:
    //    func makeSomethingWithPerson(person: Person?) -> Void {
    //        if let person = person {
    //            print(person.name)
    //        }
    //    }
    
    // and that's how we called the function
    // personApi.getRandomPersonUrlSession(completion: makeSomethingWithPerson)
    
    
}

