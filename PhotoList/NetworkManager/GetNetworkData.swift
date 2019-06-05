//
//  GetNetworkData.swift
//  PhotoList
//
//  Created by ket on 6/1/19.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation
import Alamofire

class GetNetworkData {
    static let sharedInstance: GetNetworkData = GetNetworkData()
    
    var total: Int = 10
    var currentPage: Int = 1
    
     func getDefaultList(onPage page: Int, completionHandler: @escaping ([PhotoUrls]?) -> Void) {
        Alamofire.request(RequestConvertible.getDefaultListPhotos(onPage: page)).responseJSON { response in
            guard let data = response.data else { return completionHandler(nil) }
            
            do {
                let receivedData = try JSONDecoder().decode([PhotoUrls].self, from: data)
                completionHandler(receivedData)
            } catch {
                completionHandler(nil)
            }
        }
        
    }
    
    func getSearchList(text: String, completionHandler: @escaping (PhotosArray?) -> Void) {
        Alamofire.request(RequestConvertible.getSearchListPhotos(text: text)).responseJSON { response in
            guard let data = response.data else { return completionHandler(nil) }
            
            do {
                let receivedData = try JSONDecoder().decode(PhotosArray.self, from: data)
                completionHandler(receivedData)
            } catch {
                completionHandler(nil)
            }
        }
        
    }
    
}
