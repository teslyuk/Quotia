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
  
  //DELETE THIS
  let categoryDataRequest = DataRequest<Category>(dataSource: "Categories")
  var categoryData = [Category]()
  
  var selectedIndexPath: IndexPath?
  
  func loadData() {
    categoryDataRequest.getData { [weak self] dataResult in
      switch dataResult {
      case .failure:
        print("Could not load categories")
        
        let errorAlertController = UIAlertController(title: "Error", message: "Cannot load categories", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        errorAlertController.addAction(alertAction)
        
        //self?.present(errorAlertController, animated: true, completion: nil)
        
      case .success(let categories):
        self?.categoryData = categories
        self?.collectionView?.reloadData()
      }
    }
  }
  //
  
  var collectionView: UICollectionView? {
    return viewController?.collectionView
  }
  
  func viewDidLoad() {
    delegating()
    registerCells()
    loadData()
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
    return categoryData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.name, for: indexPath) as? CategoryCollectionViewCell {
      let category = categoryData[indexPath.item]
      guard let image = UIImage(named: category.categoryImageName) else {
        fatalError("Cannot load image for cell")
      }
      
      cell.categoryNameLabel.text = category.categoryName
      cell.categoryImageView.image = image
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
      return UIEdgeInsets(top: 25, left: 35, bottom: 25, right: 35)
    }
  }
}

//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "showImage" {
//      if let category = sender as? Category {
//        guard let image = UIImage(named: category.categoryImageName) else {
//          return
//        }
//
//        if let imageSelectionVC = segue.destination as? ImageSelectionViewController {
//          imageSelectionVC.image = image
//          imageSelectionVC.category = category
//        }
//      }
//    }
//  }
//}


// MARK: - UICollectionViewDelegate
//extension OverviewCollectionViewController {
//  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//    cell.layer.cornerRadius = 14
//  }
//
//  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    let category = categoryData[indexPath.item]
//    selectedIndexPath = indexPath
//    self.performSegue(withIdentifier: "showImage", sender: category)
//  }
//}



//MARK: - Transitioning Animation Delegate
//extension OverviewCollectionViewController: ScalingProtocol {
//  func scalingImageView(transition: ScaleTransitioningDelegate) -> UIImageView? {
//    if let indexPath = selectedIndexPath {
//      guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryOldCollectionViewCell else {
//        return nil
//      }
//      return cell.categoryImage
//    }
//    return nil
//  }
//}
