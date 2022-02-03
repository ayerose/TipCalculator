//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rey on 01.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    // allocate btns
    @IBOutlet weak var AmountTextField: UITextField!
    @IBOutlet weak var AmountOfPerson: UITextField!
    @IBOutlet weak var PercentLabel: UILabel!
    
    @IBOutlet weak var PercentSlider: UISlider!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalCostsLabel: UILabel!
    @IBOutlet weak var CostsPerPerson: UILabel!
    
    var foodCosts : Double = 0.0
    var tipPercent : Double = 0.0
    var tipSum : Double = 0.0
    var totalCosts : Double = 0.0
    var costsPerPerson : Double = 0.0
    
    
    
 override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // remove keyboard if user finished typing numbers
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // add funtionality to percent btns
    
    // return = leave this block after user clicked on a btn and go to next block
    @IBAction func PercentBtnAction(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "3%" {
            PercentLabel.text = "3%"
            PercentSlider.value = 3.0
            calculateCosts()
            return
        }
        if sender.titleLabel?.text == "5%" {
            PercentLabel.text = "5%"
            PercentSlider.value = 5.0
            calculateCosts()
            return
        }
        if sender.titleLabel?.text == "7%" {
            PercentLabel.text = "7%"
            PercentSlider.value = 7.0
            calculateCosts()
            return
        }
    }
    
    // sender is the UI slider, %.0f = null nachkommastellen
    @IBAction func PercentSliderAction(_ sender: UISlider) {
        let percentToString = String(format: "%.0f", sender.value)
        // add %
        PercentLabel.text = percentToString + "%"
        
         calculateCosts()
    }
    
    func calculateCosts() {
        // alert check before calculating
        
        if (AmountTextField.text!.isEmpty)  || (AmountOfPerson.text!.isEmpty) {
            createAlert(message: "Please provide the necessary information!")
        } else {
            foodCosts  = Double(AmountTextField.text!)!
            tipPercent = Double(PercentSlider.value)
            
            tipSum = (foodCosts * tipPercent) / 100
            totalCosts = foodCosts + tipSum
            
            costsPerPerson = totalCosts / Double(AmountOfPerson.text!)!
            
            printUIElements()
            
        }
            
       
    }
    
    // render calculated costs on iphone
    func printUIElements(){
        // takes the value of tipSum and formates it to text which has 2 nachkommastellen
        let stringTip = String(format: "%.2f", tipSum)
        let stringTotalCost = String(format: "%.2f", totalCosts)
        let stringCostsPerson = String(format: "%.2f", costsPerPerson)
        
        TipLabel.text = "Tip: " + stringTip + "€"
        TotalCostsLabel.text = "Total Costs: " + stringTotalCost + "€"
        CostsPerPerson.text = "Costs Per person: " +  stringCostsPerson + "€"
    }
    
    
    // create alert, otherwise app will crash if slider is activated without text input
    func createAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "OK", style: .default) { (action) in }
        alert.addAction(action1)
        
        self.present(alert, animated: true, completion: nil)
    }

}

