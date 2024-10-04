//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!

    @IBAction func tipChanged(_ sender: UIButton) {
        self.unselectAllTips()
        
        sender.isSelected.toggle()
        print(sender.titleLabel?.text ?? "")
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabel.text = String(Int(stepper.value))
    }
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "splitResults", sender: self)
    }
    
    private func unselectAllTips() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    private func getSelectedTipPercentage() -> Float {
        if zeroPctButton.isSelected {
            return 1.0
        } else if tenPctButton.isSelected {
            return 1.1
        } else if twentyPctButton.isSelected {
            return 1.2
        } else {
            return 0.0
        }
    }
    
    private func calculateTip() -> Float {
        let bill = billTextField.text ?? "0.0"
        let value = tryParseFloat(bill)
        if value.success{
            return (value.value! * getSelectedTipPercentage())/(Float(splitLabel.text!) ?? 1.0)
        }
        else {
            return 0.0
        }
    }
    
    private func tryParseFloat(_ input: String) -> (success: Bool, value: Float?) {
        if let value = Float(input) {
                return (true, value)
            } else {
                return (false, nil)
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "splitResults" {
                var settingsText: String = "Split between \(splitLabel.text!) people with "
                if zeroPctButton.isSelected {
                    settingsText += "0% tip"
                }
                if tenPctButton.isSelected {
                    settingsText += "10% tip"
                }
                if twentyPctButton.isSelected {
                    settingsText += "20% tip"
                }
                let splitValue = String(calculateTip())
                
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.totalText = splitValue
                destinationVC.settingsText = settingsText
            }
        }
}

