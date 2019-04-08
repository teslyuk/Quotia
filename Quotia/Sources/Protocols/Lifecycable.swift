//
//  Lifecycable.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import Foundation

protocol Lifecycable {
  func viewDidLoad()
  func viewWillAppear()
  func viewDidAppear()
}

extension Lifecycable {
  func viewDidLoad() {}
  func viewWillAppear() {}
  func viewDidAppear() {}
}
