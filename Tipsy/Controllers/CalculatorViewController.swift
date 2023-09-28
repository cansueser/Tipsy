//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController{
    
    var  buttonValue = 0.10
    var numberOfPeople = 2
    var  billTotal=0.0
    var Finalresult="0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPcButton: UIButton!
    
    @IBOutlet weak var tenPcButton: UIButton!
    
    @IBOutlet weak var twentyPcButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
        sender.isSelected=true
        let buttonTitle = sender.currentTitle!
        let removeLastCharacter = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(removeLastCharacter)!
        buttonValue = buttonTitleAsANumber/100
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let chooseSplit=sender.value
        splitNumberLabel.text=String(format: "%.0f", chooseSplit)
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill=billTextField.text!
        
        if bill != ""{
            billTotal = Double(bill)!
            let result=(billTotal+(billTotal*buttonValue))/Double(numberOfPeople)
            Finalresult=String(format: "%.2f",result)            
        }
        self.performSegue(withIdentifier: "goToResult", sender:self)

    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult"{
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.sonuc = Finalresult
                destinationVC.split=numberOfPeople
                destinationVC.buttonValue=Int(buttonValue*100)
            }
       
        }
    }
