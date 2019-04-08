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
  
  func viewDidLoad() {
    
  }
}

