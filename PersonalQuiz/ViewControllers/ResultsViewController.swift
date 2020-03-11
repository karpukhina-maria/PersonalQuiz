//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 09.03.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соответсвии с этим животным

    var answersChoosen: [Answer] = []
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let winnerType = processResult(answersChoosen)
        titleLabel.text = "Вы - \(winnerType.rawValue)"
        resultLabel.text = winnerType.definition
        

    }
    
    
}
 
extension ResultsViewController {
    
    func processResult(_ answersChoosen: [Answer]) -> AnimalType {
        var scoreDog = 0
        var scoreCat = 0
        var scoreTurtle = 0
        var scoreRabbit = 0
        var allScore:[Int]
        var winnerType:AnimalType?
       
        for answer in answersChoosen {
            switch answer.type {
            case .dog:
                scoreDog += 1
            case .cat:
                scoreCat += 1
            case .rabbit:
                scoreRabbit += 1
            case .turtle:
                scoreTurtle += 1
            }
        }
        
        allScore = [scoreDog, scoreCat, scoreRabbit, scoreTurtle]
        
        if let max = allScore.sorted(by: >).first {
            if max == scoreDog {
                winnerType = AnimalType.dog
            } else if max == scoreCat {
                winnerType = AnimalType.cat
            } else if max == scoreRabbit {
                winnerType = AnimalType.rabbit
            } else if max == scoreTurtle {
                winnerType = AnimalType.turtle
                
            }
        }
        return winnerType!
    }
}
