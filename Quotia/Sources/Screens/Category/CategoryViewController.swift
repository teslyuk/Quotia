//
//  CategoryViewController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

  private var controller: CategoryController?
  
  convenience init(controller: CategoryController) {
    self.init()
    self.controller = controller
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  
  
}