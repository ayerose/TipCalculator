//
//  ViewController.swift
//  TipCalculator
//
//  Created by Soreya Koura on 01.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var AmountTextField: UITextField!
    @IBOutlet weak var AmountOfPerson: UITextField!
    @IBOutlet weak var PercentLabel: UILabel!
    
    @IBOutlet weak var PercentSlider: UISlider!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalCostsLabel: UILabel!
    @IBOutlet weak var CostsPerPerson: UILabel!
    
    
 override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func PercentBtnAction(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "3%" {
            PercentLabel.text = "3%"
            PercentSlider.value = 3.0
        }
        if sender.titleLabel?.text == "5%" {
            PercentLabel.text = "5%"
            PercentSlider.value = 5.0
        }
        if sender.titleLabel?.text == "7%" {
            PercentLabel.text = "7%"
            PercentSlider.value = 7.0
        }
    }
    
    // sender is the UI slider, %.0f = null nachkommastellen
    @IBAction func PercentSliderAction(_ sender: UISlider) {
        let percentToString = String(format: "%.0f", sender.value)
        // add %
        PercentLabel.text = percentToString + "%"
    }
    

}

