//
//  QuizQuestions.swift
//  Quizzler-iOS13
//
//  Created by Gabriel Castillo Serafim on 22/8/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    var text:String
    var answer:[String]
    var correctAnswer:String
 
    init (q:String, a:[String], correctAnswer:String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
    
}
