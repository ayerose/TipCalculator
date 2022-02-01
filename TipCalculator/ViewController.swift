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
        foodCosts  = Double(AmountTextField.text!)!
        tipPercent = Double(PercentSlider.value)
        
        tipSum = (foodCosts * tipPercent) / 100
        totalCosts = foodCosts + tipSum
        
        costsPerPerson = totalCosts / Double(AmountOfPerson.text!)!
        
        printUIElements()
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

}

