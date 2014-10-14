//
//  ViewController.swift
//  The Guess
//
//  Created by Ranjith Nagella on 10/13/14.
//  Copyright (c) 2014 Ranjith Nagella. All rights reserved.
//
// Number guessing game - Guess a number and if it's right you win or you needed to guess again.
// You can take as many changes as you want.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var userInputLabel: UITextField!
    var guessNumber: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // register textfiled delegates
        self.userInputLabel.delegate = self
        
        // Give a number to guess - Let it be random numer b/w 1-50
        
        guessNumber = Int(generateRandomNumber())
        println("Guess Number :: \(guessNumber)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func guessResult(sender: AnyObject) {
        
        userInputLabel.resignFirstResponder()
        println(userInputLabel.text)
        println("user input is \(userInputLabel.text) and Guess number is \(guessNumber)")
        
        let userGuessValue: Int? = userInputLabel.text.toInt()
        
        println(userGuessValue)
        
        if  userGuessValue >= 0 && userGuessValue < guessNumber {
            
            println("Lower, guess again!")
            resultLabel.text = "Lower, guess again!"
        } else if userGuessValue > guessNumber{
            println("Higher, guess again!")
            resultLabel.text = "Higher, guess again!"
        } else if userGuessValue == guessNumber{
            println("Correct, Congrats!")
            resultLabel.text = "Correct, Congrats!"
        } else {
            println("Not a valid input")
            resultLabel.text = "Please, enter a valid input"
        }
        
    }
    
    func generateRandomNumber() -> Int{
        
        return Int(arc4random_uniform(50))
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        userInputLabel.resignFirstResponder()
        return true
    }

    @IBAction func resetData(sender: AnyObject) {
        
        userInputLabel.text = ""
        // reset the guess number.
        guessNumber = generateRandomNumber()
        
    }
}

