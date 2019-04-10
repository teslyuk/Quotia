//
//  ImageViewController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 10/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
  
  private var controller: ImageController?
  
  convenience init(controller: ImageController) {
    self.init()
    self.controller = controller
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    controller?.viewDidLoad()
    Decorator.decorate(self)
  }
  
}

private extension ImageViewController {
  final class Decorator {
    private init() {}
    
    static func decorate(_ vc: ImageViewController) {
      
    }
  }
}
