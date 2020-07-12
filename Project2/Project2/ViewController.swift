//
//  ViewController.swift
//  Project2
//
//  Created by SANDEEP BANDARU on 11/07/20.
//  Copyright © 2020 SANDEEP BANDARU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia","france","nigeria","monaco","italy","poland","russia","us","uk","spain","germany","ireland"]
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "country: " + countries[correctAnswer].uppercased() + ", score: \(score) "
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }
            
        else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        if count == 10 && sender.tag == correctAnswer  {
            ac.addAction(UIAlertAction(title: "Hey! you have attempted 10 questions.", style: .default))
            count = 0
        }
            
        else if count == 10 && sender.tag != correctAnswer {
            ac.addAction(UIAlertAction(title: "you attempted 10 questions and it's  \(countries[sender.tag]) flag.", style: .default))
            count = 0
        }
        else if sender.tag == correctAnswer {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
            
        else{
            ac.addAction(UIAlertAction(title: "Wrong! That’s the flag of \(countries[sender.tag])", style: .default, handler: askQuestion))
        }
        
        present(ac,animated: true)
        
        count += 1
    }
    
}
