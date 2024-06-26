//
//  DogBreed.swift
//  DogBreeds
//

import Foundation

struct DogBreed: Codable, Identifiable {
    struct Weight: Codable {
        let imperial: String
        let metric: String
    }

    struct Height: Codable {
        let imperial: String
        let metric: String
    }

    let id: Int
    let name: String
    let weight: Weight
    let height: Height
    let description: String?
    let bred_for: String?
    let breed_group: String?
    let life_span: String
    let temperament: String?
    let reference_image_id: String?
}
