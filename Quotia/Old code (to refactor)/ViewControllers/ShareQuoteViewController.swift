//
//  ShareQuoteViewController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/12/2018.
//  Copyright © 2018 Nikita Teslyuk. All rights reserved.
//

import UIKit

class ShareQuoteViewController: UIViewController {
  @IBOutlet weak var quoteLabel: UILabel!
  @IBOutlet weak var authorNameLabel: UILabel!
  @IBOutlet weak var textContainerView: UIView!
  @IBOutlet weak var backgroundImageView: UIImageView!
  
  var backgroundImage: UIImage?
  let quoteDataRequest = DataRequest<Quote>(dataSource: "Quotes")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let image = backgroundImage else {
      return
    }
    
    backgroundImageView.image = image
    loadData()
  }
  
  func loadData() {
    quoteDataRequest.getData { [weak self] (dataResult) in
      
      switch dataResult {
      case .failure:
        let alertController = UIAlertController(title: "Error", message: "Cannot load quotes", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        self?.present(alertController, animated: true, completion: nil)
        
      case .success(let quotes):
        let randomQuoteNumber = Int.random(in: 0 ..< quotes.count)
        DispatchQueue.main.async {
          self?.authorNameLabel.text = quotes[randomQuoteNumber].author
          self?.quoteLabel.text = quotes[randomQuoteNumber].quote
        }
      }
    }
  }
  
  @IBAction func shareAction(_ sender: UIButton) {
    _ = textContainerView.subviews.filter({ $0 is UIButton }).map({ $0.isHidden = true })
    let image = self.view.performScreenshot()
    _ = textContainerView.subviews.filter({ $0 is UIButton }).map({ $0.isHidden = false })
    let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    self.present(activityVC, animated: true, completion: nil)
  }
  
  @IBAction func dismissAction(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
}
