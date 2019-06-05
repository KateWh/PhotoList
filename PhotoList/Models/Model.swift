//
//  Model.swift
//  PhotoList
//
//  Created by ket on 6/1/19.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation

enum DefaultList {
    
    enum Models {
        
        struct Request {
            var pageNumber: Int?
            var text: String?
        }
        
        struct View {
            var photosList: [Photo]?
            
            struct Photo {
                var smallUrl: URL?
                var mediumUrl: URL?
                var lardgeUrl: URL?
                
                init(smallUrl: URL?, mediumUrl: URL?, lardgeUrl: URL?) {
                    self.smallUrl = smallUrl
                    self.mediumUrl = mediumUrl
                    self.lardgeUrl = lardgeUrl
                }
            }
        }
    }
}
