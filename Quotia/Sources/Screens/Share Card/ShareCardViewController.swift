//
//  ShareCardViewController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import UIKit

class ShareCardViewController: UIViewController {
  
  private var controller: ShareCardController?
  private var backgroundImage: UIImage?

  convenience init(controller: ShareCardController) {
    self.init()
    self.controller = controller
  }
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var quoteLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var textContainerView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    controller?.viewDidLoad()
  }
  
}

private extension ShareCardViewController {
  final class Decorator {
    private init() {}
    
    static func decorate(_ vc: ShareCardViewController) {
      
    }
  }
}
