//
//  ViewController.swift
//  Calculator
//
//  Created by Tukhfatov Margulan on 12/3/15.
//  Copyright © 2015 Tukhfatov Margulan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    var nextOperand:String = ""
    var operandArray = Array<Double>()

    @IBAction func appendDigit(sender: UIButton)
    {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            storeDisplayValue()
        }
        if operandArray.count >= 2 || operation == "="{
            switch nextOperand{
                case "+": performOperation { $0 + $1 }
                case "−": performOperation { $0 - $1 }
                case "×": performOperation { $0 * $1 }
                case "÷": performOperation { $1 / $0 }
                default: break
            }
        }
        nextOperand = operation
       
    }
    
    @IBAction func clearAll() {
        operandArray.removeAll()
        userIsInTheMiddleOfTypingANumber = false
        displayValue = 0
    }
    func performOperation ( operation: (Double, Double)-> Double){
        var result: Double = 0.0
        if operandArray.count >= 2 {
            result =  operation( operandArray.removeLast(), operandArray.removeLast())
            displayValue = result
            operandArray.append(result)
        }
    }
    func storeDisplayValue () {
        
        userIsInTheMiddleOfTypingANumber = false
        operandArray.append(displayValue)
    }
    
    var displayValue:Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
}

