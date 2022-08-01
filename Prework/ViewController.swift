//
//  ViewController.swift
//  Prework
//
//  Created by Aastha Sood on 7/31/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var modeChanger: UISwitch!
    @IBOutlet weak var labelForSlider: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator";
    }

    override func viewDidAppear(_ animated: Bool) {
            billAmountTextField.becomeFirstResponder();
            tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "tipPercent");
        }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
    }
    
    
    
//    @IBAction func sliderNumber(_ sender: Any) {
//        tipSlider.value = 50
//        tipSlider.minimumValue = 0
//        tipSlider.maximumValue = 100
//        labelForSlider.text = String(Int(tipSlider.value))
//    }
    
    @IBAction func modeTapped(_ sender: Any) {
        if #available(ios 12.0, *) {
            let appDelegate  = UIApplication.shared.windows.first
            if (sender as AnyObject).isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
        } else {
            
        }
    }
}

