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
    loadData()
  }
  
  func loadData() {
    quoteDataRequest.getData { [weak self] (dataResult) in
      
      switch dataResult {
      case .failure:
        let alertController = UIAlertController(title: "Error", message: "Cannot load quotes", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        self?.viewController?.present(alertController, animated: true, completion: nil)
        
      case .success(let quotes):
        let randomQuoteNumber = Int.random(in: 0 ..< quotes.count)
        DispatchQueue.main.async {
          self?.viewController?.authorLabel.text = quotes[randomQuoteNumber].author
          self?.viewController?.quoteLabel.text = quotes[randomQuoteNumber].quote
        }
      }
    }
  }
}
