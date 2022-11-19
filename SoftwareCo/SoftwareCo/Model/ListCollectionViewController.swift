//
//  ListCollectionViewController.swift
//  SoftwareCo
//
//  Created by Cumali Atalan on 18.11.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class ListCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
                
        return cell
    }
    
}
