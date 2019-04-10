//
//  ImageController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 10/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import UIKit

class ImageController: Lifecycable {
  
  weak var viewController: ImageViewController?
  
  func set(viewController: ImageViewController) {
    self.viewController = viewController
  }
  
  func viewDidLoad() {
    
  }
}
