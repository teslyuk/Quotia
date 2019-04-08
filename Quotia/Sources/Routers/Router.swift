//
//  Router.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import UIKit

class Router {
  func root(_ window: inout UIWindow?, rootViewController: UIViewController) {
    let frame = UIScreen.main.bounds
    window = UIWindow(frame: frame)
    window?.makeKeyAndVisible()
    window?.rootViewController = UINavigationController(rootViewController: rootViewController)
  }
}
