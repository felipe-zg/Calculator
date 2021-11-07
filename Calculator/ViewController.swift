//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishTypingNumber = true
    private var displayvalue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert current display value String to Bouble")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "AC":
                displayLabel.text = "0"
            case "+/-":
                displayvalue *= -1
            case "%":
                displayvalue *= 0.01
            default:
                print("default")
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishTypingNumber {
                displayLabel.text = numValue
                isFinishTypingNumber = false
            } else {
                if numValue == "." && displayLabel.text!.contains("."){
                    return
                }
                displayLabel.text = displayLabel.text?.appending(numValue)
            }
        }
    
    }

}

