//
//  ViewController.swift
//  Tip Prework
//
//  Created by Kossamak Thit on 1/13/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        billAmountTextField.becomeFirstResponder()
        billAmountTextField.delegate = self
        
    }
    
    @IBAction func onTap(_ sender: Any) {
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        // Calculate tip and total
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipPercentageLabel.text =
            String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // Resetting values to initial state
        func clear() {
            billAmountTextField.text = nil
            tipAmountSegmentedControl.selectedSegmentIndex = 0
            tipPercentageLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
        clear()
    }
    
    // UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        billAmountTextField.resignFirstResponder()
    }
    
    // Locale-specific currency attempt
   /* func convertCurrencyToDouble(input: String) -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.number(from: input)?.doubleValue
    }
    
    func convertDoubleToCurrency(amount: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.string(from: NSNumber(value: amount))!
    } */
}
