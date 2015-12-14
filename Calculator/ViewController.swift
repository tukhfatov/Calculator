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

    var calculatorModel = Calculator()
    
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
        
        if userIsInTheMiddleOfTypingANumber {
            calculatorModel.pushOperand(displayValue)
            userIsInTheMiddleOfTypingANumber = false
        }
       
        if let operation = sender.currentTitle {
                if let result = calculatorModel.operate(operation){
                    displayValue = result
                }
        }
    }
    
    @IBAction func clearAll() {
        userIsInTheMiddleOfTypingANumber = false
        calculatorModel.clearAll()
        displayValue = 0.0
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

