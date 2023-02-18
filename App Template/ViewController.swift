//
//  ViewController.swift
//  App Template
//
//  Created by Stephen Byron on 2/15/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var billAmountTextField: UITextField!

    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.delegate = self
        billAmountTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: billAmountTextField.frame.height))
          billAmountTextField.leftViewMode = .always
          billAmountTextField.text = "$"
        initalSetup()
      
    }


    @IBAction func submitButtonTapped(_ sender: Any) {
        
//        billAmountTextField.resignFirstResponder()
        
        let tipAmount = calculateTwentyPercentTip()
        
        if resultLabel.text == nil {
            
            resultLabel.text = ""
            
        } else {
            
            resultLabel.text = String(format: "20 Percent Tip is: $%.2f", tipAmount)
            
        }
       
           print("Submit Button Tapped")
    }
    
    func initalSetup() {
        submitButton.layer.cornerRadius = 15
    }
    
    func calculateTwentyPercentTip() -> Double {
        // Get the text value of the billAmountTextField and remove the $ symbol from the beginning
        guard let billAmountText = billAmountTextField.text,
              let totalAmountOfBill = Double(billAmountText.replacingOccurrences(of: "$", with: "")) else {
            // Return 0.0 if the text field is empty or cannot be converted to an integer
            return 0.0
        }
        
        let tip = Double(totalAmountOfBill) * 0.20
        return tip
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         // Dismiss the keyboard when the user taps the "Return" key
         textField.resignFirstResponder()
         return true
     }
}

