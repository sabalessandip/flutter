//
//  DogBreedService.swift
//  DogBreeds
//

import Foundation

class DogBreedService {
    static let shared = DogBreedService()
    private init() {}

    private let apiURL = "https://api.thedogapi.com/v1/breeds"
    
    func fetchDogBreeds(completion: @escaping ([DogBreed]) -> Void) {
        guard let url = URL(string: apiURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let breeds = try JSONDecoder().decode([DogBreed].self, from: data)
                    DispatchQueue.main.async {
                        completion(breeds)
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
    
    func fetchDogBreed(id: String,
                       completion: @escaping (DogBreed) -> Void) {
        guard var url = URL(string: apiURL) else { return }
        url.append(path: id)
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let breed = try JSONDecoder().decode(DogBreed.self, from: data)
                    DispatchQueue.main.async {
                        completion(breed)
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
}

extension DogBreedService: ServiceApi {
    func fetchDogBreed(breedId: String,
                       completion: @escaping (Result<DogBreedResponse, Error>) -> Void) {
        guard var url = URL(string: apiURL) else { return }
        url.append(path: breedId)
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let breedData = String(data: data, encoding: .utf8)
                let result = DogBreedResponse(data: breedData ?? "")
                completion(.success(result))
            }
        }.resume()
    }
}
