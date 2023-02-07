//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Kailash Chivhe on 07/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldHeightFeet: UITextField!
    @IBOutlet weak var textFieldfHeightInch: UITextField!
    
    @IBOutlet weak var textFieldWeight: UITextField!
    @IBOutlet weak var labelBMI: UILabel!
    @IBOutlet weak var labelBMIResult: UILabel!
    
    @IBOutlet weak var imageViewBMIResult: UIImageView!
    @IBAction func onCalculateClicked(_ sender: UIButton) {
        if textFieldWeight.hasText && textFieldHeightFeet.hasText && textFieldfHeightInch.hasText
        {
            var weight: Float = Float(textFieldWeight.text!) ?? 0.0
            var heightFeet = Int(textFieldHeightFeet.text!) ?? 0
            var heightInch = Int(textFieldfHeightInch.text!) ?? 0
            if weight > 0 && heightFeet > 0 && heightInch > 0{
                calculateBMI(weight: weight, heightFeet: heightFeet, heightInch: heightInch)
            }
            else{
                showAlert("Please enter positive data")
            }
        }
        else{
            showAlert("Please enter valid data")
        }
    }
    
    @IBAction func onClearClicked(_ sender: UIButton) {
        labelBMI.text = "BMI : 0.0"
        labelBMIResult.text = "BMI Category"
        imageViewBMIResult.isHidden = true
        textFieldWeight.text = "0.0"
        textFieldHeightFeet.text = "0"
        textFieldfHeightInch.text = "0"
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Invalid Data", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "clear", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func calculateBMI(weight: Float, heightFeet: Int, heightInch: Int ){
        var feetToInches = heightFeet * 12
        var totalHeight = feetToInches + heightInch
        var bmiResult: Float = (weight/pow(Float(totalHeight),2 ) ) * 703
        var category = "Normal"
        if bmiResult < Float(18.5) {
            category = "Underweight"
        }
        else if bmiResult >= Float(18.5) && bmiResult < 25{
            category = "Normal"
        }
        else if bmiResult >= 25 && bmiResult < 30{
            category = "Overweight"
        }
        else{
            category = "Obese"
        }
        
        labelBMI.text = "BMI : \(bmiResult)"
        labelBMIResult.text = category
        
        switch category{
        case "Underweight":
            imageViewBMIResult.image = UIImage(named: "underweight")
        case "Overweight":
            imageViewBMIResult.image = UIImage(named: "overweight")
        case "Obese":
            imageViewBMIResult.image = UIImage(named: "obese")
        default:
            imageViewBMIResult.image = UIImage(named: "normal")
        }
        imageViewBMIResult.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewBMIResult.isHidden = true
    }
}

