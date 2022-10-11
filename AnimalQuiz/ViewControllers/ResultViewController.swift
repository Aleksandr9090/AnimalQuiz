//
//  ResultViewController.swift
//  AnimalQuiz
//
//  Created by Aleksandr on 10.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answersChosen: [Answer]!
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    private let questions = Question.getQuestions()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    private func updateResult() {
        
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answersChosen.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyOfAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyOfAnimal)
    }
    
    private func updateUI(with animal: Animal?) {
        emojiLabel.text = "Вы - \(animal?.rawValue ?? ".")!"
        descriptionLabel.text = animal?.definition ?? ""
    }

}
