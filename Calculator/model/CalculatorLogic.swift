import Foundation

struct CalculatorLogic {
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        switch symbol {
        case "AC":
            return 0
        case "+/-":
            return number * -1
        case "%":
            return number * 0.01
        default:
            return nil
        }
    }
}
