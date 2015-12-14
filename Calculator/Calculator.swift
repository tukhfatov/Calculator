//
//  Calculator.swift
//  Calculator
//
//  Created by Tukhfatov Margulan on 12/12/15.
//  Copyright © 2015 Tukhfatov Margulan. All rights reserved.
//

import Foundation


class Calculator {
    
    private var operandStack =  Array<Double>()
    private var prevOperation:String = ""
    
    
    func pushOperand(operand:Double) ->Double? {
        operandStack.append(operand)
        return operand
    }
    
    func operate(operation: String)->Double? {
        if operandStack.count >= 2 || operation == "="{
            switch prevOperation{
            case "+": return performOperation { $0 + $1 }
            case "−": return performOperation { $1 - $0 }
            case "×": return performOperation { $0 * $1 }
            case "÷": return performOperation { $1 / $0 }
            default: break
            }
        }else{
            prevOperation = operation
        }
        return nil
    }
    
    
    func performOperation ( operation: (Double, Double)-> Double)->Double{
        var result: Double = 0.0
        if operandStack.count >= 2 {
            result =  operation( operandStack.removeLast(), operandStack.removeLast())
            operandStack.append(result)
        }
        return result
    }
    func clearAll(){
        operandStack.removeAll()
    }
    
    
}