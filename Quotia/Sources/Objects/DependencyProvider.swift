//
//  DependencyProvider.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/04/2019.
//  Copyright © 2019 Nikita Teslyuk. All rights reserved.
//

import Foundation

class DependencyProvider {
  func fetchRouter() -> Router {
    let router = Router()
    return router
  }
  
  func mainRouter(router: Router) -> MainRouter {
    let mainRouter = MainRouter(router: router)
    return mainRouter
  }
}
