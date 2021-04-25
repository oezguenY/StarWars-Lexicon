//
//  FadeEnabledButton.swift
//  Starwars Lexicon
//
//  Created by Özgün Yildiz on 25.04.21.
//

import UIKit

class FadeEnabledButton: UIButton {
    
    //whenever the isEnabled property is set, we can do something with it in the didSet. This is a property observer
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
