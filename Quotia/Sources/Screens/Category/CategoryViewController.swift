//
//  CategoryViewController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  
  private var controller: CategoryController?
  
  convenience init(controller: CategoryController) {
    self.init()
    self.controller = controller
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    controller?.viewDidLoad()
    Decorator.decorate(self)
  }
  
}

private extension CategoryViewController {
  final class Decorator {
    private init() {}
    
    static func decorate(_ vc: CategoryViewController) {
      vc.navigationController?.navigationBar.prefersLargeTitles = true
      vc.navigationItem.title = "Quotia"
    }
  }
}
