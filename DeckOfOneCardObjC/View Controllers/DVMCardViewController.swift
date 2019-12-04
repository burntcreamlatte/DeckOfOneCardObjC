//
//  DVMCardViewController.swift
//  DeckOfOneCardObjC
//
//  Created by Aaron Shackelford on 12/3/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import UIKit

class DVMCardViewController: UIViewController {
    
    @IBOutlet weak var cardSuitLabel: UILabel!
    @IBOutlet weak var cardValueLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func drawCardButtonTapped(_ sender: UIButton) {
        DVMCardController.shared().drawANewCard(1) { (cards) in
            guard let card = cards?.first else { return }
            
            DVMCardController.shared().fetchCardImage(from: card) { (cardImage) in
                guard let image = cardImage else { return }
                
                DispatchQueue.main.async {
                    self.cardSuitLabel.text = card.suit
                    self.cardValueLabel.text = card.value
                    self.cardImageView.image = image
                }
            }
        }
    }
}
