//
//  ViewModel.swift
//  PhotoList
//
//  Created by ket on 6/1/19.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation

protocol DefaultListInputActions {
    func getPhotoList() -> DefaultList.Models.View
    func loadPhotoList()
}

protocol DefaultListOutputActions: class {
    func updateView()
}

protocol DefaultListRouting: class {
    func performSegue(withIdentifier: String)
}


class DefaultListViewModel {
    weak var outputViewModelDelegate: DefaultListOutputActions?
    weak var routingDelegate: DefaultListRouting?
    
    let getNetworkData = GetNetworkData.sharedInstance
    var defaultList = DefaultList.Models.View()
    
    init(_ outputViewModel: DefaultListCollectionViewController) {
        self.outputViewModelDelegate = outputViewModel
    }
}

extension DefaultListViewModel:  DefaultListInputActions {
    func getPhotoList() -> DefaultList.Models.View {
        return defaultList
    }
    
    func loadPhotoList() {
        guard getNetworkData.currentPage >= getNetworkData.total else { return }
        getNetworkData.currentPage += 1
        getNetworkData.getDefaultList(onPage: getNetworkData.currentPage) { result in
            switch result {
            case .none:
                break
            case .some(let photos):
                for photo in photos {
                    let small = URL(string: photo.urls.thumb)
                    let medium = URL(string: photo.urls.regular)
                    let large = URL(string: photo.urls.full)
                    let photoUrls =  DefaultList.Models.View.Photo.init(smallUrl: small, mediumUrl: medium, lardgeUrl: large)
                    self.defaultList.photosList?.append(photoUrls)
                    
                }
            }
        }
    }
   
}

private extension DefaultListViewModel {
    }
