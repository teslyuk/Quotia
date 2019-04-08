//
//  ShareCardController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import UIKit

class ShareCardController: NSObject, Lifecycable {
  
  weak var viewController: ShareCardViewController?
  
  let quoteDataRequest = DataRequest<Quote>(dataSource: "Quotes")
  
  func set(viewController: ShareCardViewController) {
    self.viewController = viewController
  }
  
  func viewDidLoad() {
    
  }
}
