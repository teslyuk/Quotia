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
    collectionView?.delegate = self
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 150, height: 200)
  }
}

extension CategoryController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    cell.layer.cornerRadius = 14
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
}

extension CategoryController: UICollectionViewDelegateFlowLayout  {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let screenRect = UIScreen.main.nativeBounds
    
    if (screenRect.size.height == 1136) {
      return UIEdgeInsets(top: 6, left: 5, bottom: 6, right: 5)
    } else if (screenRect.size.height == 2688) {
      return UIEdgeInsets(top: 25, left: 36, bottom: 25, right: 36)
    } else {
      return UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
    }
  }
}

