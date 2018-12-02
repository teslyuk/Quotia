//
//  OverviewCollectionViewController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 01/12/2018.
//  Copyright © 2018 Nikita Teslyuk. All rights reserved.
//

import UIKit

class OverviewCollectionViewController: UICollectionViewController {
    
    let categoryDataRequest = DataRequest<Category>(dataSource: "Categories")
    var categoryData = [Category]()
    
    // MARK: - ViewController's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func loadData() {
        categoryDataRequest.getData { [weak self] dataResult in
            switch dataResult {
            case .failure:
                print("Could not load categories")
                
                let errorAlertController = UIAlertController(title: "Error", message: "Cannot load categories", preferredStyle: .alert)
                
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                errorAlertController.addAction(alertAction)
                
                self?.present(errorAlertController, animated: true, completion: nil)
                
            case .success(let categories):
                self?.categoryData = categories
                self?.collectionView.reloadData()
            }
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension OverviewCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension OverviewCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OverviewCollectionViewController: UICollectionViewDelegateFlowLayout  {
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
     
     }*/
    
}
