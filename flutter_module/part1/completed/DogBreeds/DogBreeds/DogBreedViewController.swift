//
//  DogBreedViewController.swift
//  DogBreeds
//

import UIKit

class DogBreedViewController: UIViewController {
    var breedId: Int?
    var breedName: String?
    private var dogBreed: DogBreed?
    @IBOutlet private weak var textView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = breedName
        if let breedId = breedId {
            DogBreedService.shared.fetchDogBreed(id: String(breedId)) { [weak self] breed in
                self?.dogBreed = breed
                self?.configureView()
            }
        }
    }
    
    private func configureView() {
        guard let breed = dogBreed else { return }
        
        let breedDetails = """
        Name: \(breed.name) \n\n
        Weight: \(breed.weight.metric) kg (\(breed.weight.imperial) lbs) \n\n
        Height: \(breed.height.metric) cm (\(breed.height.imperial) in) \n\n
        Description: \(breed.description ?? "N/A") \n\n
        Bred For: \(breed.bred_for ?? "N/A")  \n\n
        Breed Group: \(breed.breed_group  ?? "N/A") \n\n
        Life Span: \(breed.life_span)  \n\n
        Temperament: \(breed.temperament ?? "N/A") \n\n
        """
        self.textView?.text = breedDetails
    }
}
