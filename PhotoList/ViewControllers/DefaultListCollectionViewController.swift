//
//  CollectionViewController.swift
//  PhotoList
//
//  Created by ket on 6/1/19.
//  Copyright © 2019 ket. All rights reserved.
//

import UIKit
class DefaultListCollectionViewController: UICollectionViewController {
    
    var viewModelDelegate: DefaultListInputActions?
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
}

extension DefaultListCollectionViewController {
    
    // Mark: Collection View Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       _ = self.viewModelDelegate?.getPhotoList()
    }
    
    // Mark: Collection View Data Source
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModelDelegate?.getPhotoList().photosList?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DefaultListCollectionViewCell
        return cell
    }
}

private extension DefaultListCollectionViewController {
    
    // MARK: Setup
    
    func setup(){
        let viewModel = DefaultListViewModel(self)
        self.viewModelDelegate = viewModel
    }
}

// MARK: Bind to ViewModel

extension DefaultListCollectionViewController: DefaultListOutputActions {
    func updateView() {
        collectionView.reloadData()
    }
}

// MARK: Routing

extension DefaultListCollectionViewController: DefaultListRouting {
    func performSegue(withIdentifier: String) {
    }
    
}
