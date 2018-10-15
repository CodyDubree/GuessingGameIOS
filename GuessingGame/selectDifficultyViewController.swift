//
//  selectDifficultyViewController.swift
//  GuessingGame
//
//  Created by Cody Dubree on 10/10/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import UIKit

class selectDifficultyViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let guessingGameViewController = segue.destination as? ViewController else { return }
      
        switch segue.identifier {
        case "EasyToGuessingGame":
            guessingGameViewController.guessesRemaining = 3
            guessingGameViewController.minimum = 1
            guessingGameViewController.maximum = 15
        case "MediumToGuessingGame":
          guessingGameViewController.numberOfGuesses = 5
          guessingGameViewController.minimum = 1
          guessingGameViewController.maximum = 100
        case "HardToGuessingGame":
           guessingGameViewController.numberOfGuesses = 7
           guessingGameViewController.minimum = 1
           guessingGameViewController.maximum = 500
        default:
            break
        }
    }
}
