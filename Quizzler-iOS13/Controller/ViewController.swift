//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sender.backgroundColor = UIColor.clear
            }
        } else {
            sender.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sender.backgroundColor = UIColor.clear
            }
        }
        
        quizBrain.nextQuestion()
        
        updateView()
        
    }
    
    func updateView() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        firstButton.setTitle (quizBrain.getFirstAlternative(), for: .normal)
        secondButton.setTitle (quizBrain.getSecondAlternative(), for: .normal)
        thirdButton.setTitle (quizBrain.getThirdAlternative(), for: .normal)
        progressBar.progress = quizBrain.getProgressBarStatus()
    }
    
}

