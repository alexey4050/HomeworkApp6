//
//  PhotosModel.swift
//  HomeworkApp6
//
//  Created by testing on 17.07.2023.
//

struct PhotosModel: Decodable {
    var response: Photos
}

struct Photos: Decodable {
    var items: [Photo]
}

struct Photo: Decodable {
    var id: Int
    var text: String?
    var sizes: [Sizes]
}
struct Sizes: Codable {
    var url: String
}


