//
//  ViewController.swift
//  GuessingGame
//
//  Created by Cody Dubree on 10/9/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Instruction: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var guessbutton: UIButton!
    @IBOutlet weak var feedback: UILabel!
    @IBOutlet weak var remaining: UILabel!
    
    @IBOutlet weak var PlayAgain: UIButton!
    
    @IBAction func PlayAgainbuttontapped(_ sender: Any){
       restart()
    }
    @IBAction func guessbuttontapped(_ sender: Any) {
        feedback.text = "You guessed \(textfield.text!)"
        let userInput = textfield.text!
        guard let guess = Int(userInput) else {
            feedback.text = "you didnt give me a number"
            return
        }
        guard guess >= 1 && guess <= 100 else{
            feedback.text = "Your number wasnt between 1 and 100"
            return
        }
        if guess == randomNumber {
            feedback.text = "You win"
        }
        guard guessesRemaining > 0 else {
            feedback.text = "You lose"
            return
        }
        if guess < randomNumber {
            feedback.text = "Guess Higher"
        } else {
            feedback.text = "Guess Lower"
        }
        
    }
    
    var minimum = 1
    var maximum = 100
    var numberOfGuesses = 5
    var randomNumber = 0
    var guessesRemaining = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        restart()
        
        
        
    }
    func makeAGuess(_ guess: Int){
        guard guess >= minimum && guess <= maximum else{
            feedback.text = "Your number wasnt between \(minimum) and \(maximum)"
            return
        }
        if guess == randomNumber {
            feedback.text = "You win"
        }
        guard guessesRemaining > 0 else {
            feedback.text = "You lose"
            return
        }
        if guess < randomNumber {
            feedback.text = "Guess Higher"
        } else {
            feedback.text = "Guess Lower"
        }
        guessesRemaining -= 1
        remaining.text = "\(guessesRemaining) guesses remaining"
        
    }
        func restart() {
       
            randomNumber =  Int.random(in: minimum...maximum)
            
            guessesRemaining = numberOfGuesses
            
            textfield.text = ""
            
            textfield.isEnabled = true
            
            PlayAgain.isHidden = true
            
            guessbutton.isHidden = false
            
            feedback.text = ""
            
            remaining.text = "\(numberOfGuesses) guesses remaining"
            
            Instruction.text = "Please select a number between \(minimum) and \(maximum)"
            
        }
    
}
