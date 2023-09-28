//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by CANSU on 13.09.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    var sonuc="0.0"
    var buttonValue=10
    var split=2
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text=sonuc
        settingsLabel.text="Split between \(split) people, with \(buttonValue)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil)

    }
    
    

}
