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
  var backgroundImage: UIImage?

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
    Decorator.decorate(self)
    controller?.viewDidLoad()
    setBackgroundImage()
  }
  
  private func setBackgroundImage() {
    guard let image = backgroundImage else {
      return
    }
    backgroundImageView.image = image
  }
  
  @IBAction func shareButtonAction(_ sender: UIButton) {
    _ = textContainerView.subviews.filter({ $0 is UIButton }).map({ $0.isHidden = true })
    let image = self.view.performScreenshot()
    _ = textContainerView.subviews.filter({ $0 is UIButton }).map({ $0.isHidden = false })
    let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    self.present(activityVC, animated: true, completion: nil)
  }
  
  @IBAction func closeCardButtonAction(_ sender: UIButton) {
    //self.dismiss(animated: true, completion: nil)
    self.navigationController?.popViewController(animated: true)
  }
}

private extension ShareCardViewController {
  final class Decorator {
    private init() {}
    
    static func decorate(_ vc: ShareCardViewController) {
      vc.backgroundImageView.contentMode = .scaleAspectFill
    }
  }
}
