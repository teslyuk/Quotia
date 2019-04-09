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
  
  var selectedIndexPath: IndexPath?
  
  // MARK: - ViewController's lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadData()
  }
  
  // MARK: - Functions
  
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
  
  // MARK: - Segues
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showImage" {
      if let category = sender as? Category {
        guard let image = UIImage(named: category.categoryImageName) else {
          return
        }
        
        if let imageSelectionVC = segue.destination as? ImageSelectionViewController {
          imageSelectionVC.image = image
          imageSelectionVC.category = category
        }
      }
    }
  }
}

// MARK: - UICollectionViewDataSource
extension OverviewCollectionViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryData.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CategoryOldCollectionViewCell else {
      
      fatalError("Cannot create proper category cell for collection view")
    }
    
    let category = categoryData[indexPath.item]
    guard let image = UIImage(named: category.categoryImageName) else {
      fatalError("Cannot load image for cell")
    }
    
    cell.categoryName.text = category.categoryName
    cell.categoryImage.image = image
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension OverviewCollectionViewController {
  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    cell.layer.cornerRadius = 14
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let category = categoryData[indexPath.item]
    selectedIndexPath = indexPath
    self.performSegue(withIdentifier: "showImage", sender: category)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OverviewCollectionViewController: UICollectionViewDelegateFlowLayout  {
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

// MARK: - Transitioning Animation Delegate
extension OverviewCollectionViewController: ScalingProtocol {
  func scalingImageView(transition: ScaleTransitioningDelegate) -> UIImageView? {
    if let indexPath = selectedIndexPath {
      guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryOldCollectionViewCell else {
        return nil
      }
      return cell.categoryImage
    }
    return nil
  }
}
