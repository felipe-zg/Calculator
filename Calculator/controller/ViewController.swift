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
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            calculator.setNumber(displayvalue)
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("Result of calculation is nil")
            }
            displayvalue = result
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

