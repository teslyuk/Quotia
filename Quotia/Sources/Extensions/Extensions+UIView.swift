//
//  Extensions+UIView.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import UIKit

extension UIView {
  func performScreenshot() -> UIImage {
    return UIGraphicsImageRenderer(size: bounds.size).image(actions: { _ in
      drawHierarchy(in: CGRect(origin: .zero, size: bounds.size), afterScreenUpdates: true)
    })
  }
}
