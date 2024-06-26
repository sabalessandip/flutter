//
//  DogBreedsViewController.swift
//  DogBreeds
//

import UIKit
import Flutter

class DogBreedsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView?
    private var dogBreeds: [DogBreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dog Breeds"
        
        tableView?.register(UITableViewCell.self,
                            forCellReuseIdentifier: "Cell")
        
        DogBreedService.shared.fetchDogBreeds { [weak self] breeds in
            self?.dogBreeds = breeds
            self?.tableView?.reloadData()
        }
    }
    
    func showDetailOfDogBreed(_ breed: DogBreed) {
        let storyboard = UIStoryboard(name: "DogBreedViewController",
                                    bundle: nil)
        let detailVC = storyboard.instantiateInitialViewController() as? DogBreedViewController
        detailVC?.breedName = breed.name
        detailVC?.breedId = breed.id
        navigationController?.show(detailVC!,
                                   sender: nil)
    }
    
    func showFlutterScreen() {
    let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
    let flutterViewController = FlutterViewController(engine: flutterEngine,
                                                      nibName: nil,
                                                      bundle: nil)
        self.navigationController?.show(flutterViewController,
                                        sender: nil)

    }
}

extension DogBreedsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dogBreeds.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        let breed = dogBreeds[indexPath.row]
        cell.textLabel?.text = breed.name
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
//        self.showDetailOfDogBreed(self.dogBreeds[indexPath.row])
        self.showFlutterScreen()
    }
}
