//
//  CategoryController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import UIKit

class CategoryController: NSObject, Lifecycable {
  
  weak var viewController: CategoryViewController?
  
  func set(viewController: CategoryViewController) {
    self.viewController = viewController
  }
  
  var collectionView: UICollectionView? {
    return viewController?.collectionView
  }
  
  func viewDidLoad() {
    delegating()
    registerCells()
  }
  
  private func delegating() {
    collectionView?.dataSource = self
  }
  
  private func registerCells() {
    collectionView?.register(CategoryCollectionViewCell.nib, forCellWithReuseIdentifier: CategoryCollectionViewCell.name)
  }
}

extension CategoryController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.name, for: indexPath) as? CategoryCollectionViewCell {
      return cell
    }
    
    return UICollectionViewCell()
  }
}

