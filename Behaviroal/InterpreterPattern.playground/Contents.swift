import Foundation

protocol Expression {
    func evaluate() -> Int
}

class Number: Expression {
    private let number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    func evaluate() -> Int {
        return number
    }
}

class Addition: Expression {
    private let leftOperand: Expression
    private let rightOperand: Expression
    
    init(leftOp: Expression, rightOp: Expression) {
        self.leftOperand = leftOp
        self.rightOperand = rightOp
    }
    
    func evaluate() -> Int {
        return leftOperand.evaluate() + rightOperand.evaluate()
    }
}

class Interpreter {
    func evaluate(problem: String) -> Int {
        var tokens: [Expression] = []
        let tokenList = problem.components(separatedBy: " ")
        
        for token in tokenList {
            if token == "+" {
                let leftOp = tokens.remove(at: 0)
                let rightOp = tokens.remove(at: 0)
                let op = Addition(leftOp: leftOp, rightOp: rightOp)
                let result = op.evaluate()
                tokens.insert(Number(number: result), at: 0)
            } else {
                let num = Number(number: Int(token)!)
                tokens.insert(num, at: 0)
            }
        }
        
        let result = tokens.remove(at: 0)
        return result.evaluate()
    }
}

let calculator = Interpreter()
let result = calculator.evaluate(problem: "4 4 + 5 10 + +")

// 4 4 + 5 10 + +
// 8 15 +
// 23