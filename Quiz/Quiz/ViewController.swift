//
//  ViewController.swift
//  Quiz
//
//  Created by Fiori III, Anthony J on 1/25/17.
//  Copyright © 2017 Fiori III, Anthony J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is congnac made from?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "grapes"
    ]
    var currentQuestionIndex: Int = 0;
    
    @IBAction func showNextQuestion(_ sender: UIButton){
        currentQuestionIndex += 1;
        
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0;
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question;
        
        answerLabel.text = "???";
    }
    
    @IBAction func showAnswer(_ sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        questionLabel.text = questions[currentQuestionIndex]
    }
}

