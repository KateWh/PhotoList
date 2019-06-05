//
//  NetworkModel.swift
//  PhotoList
//
//  Created by ket on 6/1/19.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation

// Data for decoding JSON.
struct PhotosArray: Decodable {
    let results: [PhotoUrls]
}

struct PhotoUrls: Decodable {
    let urls: ImageSizes
}

struct ImageSizes: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
