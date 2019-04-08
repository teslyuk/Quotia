//
//  DataRequest.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 08/12/2018.
//  Copyright © 2018 Nikita Teslyuk. All rights reserved.
//

import Foundation

enum GetDataRequest<Type> {
  case success([Type])
  case failure
}


struct DataRequest<Type> where Type: Decodable {
  let dataURL: URL
  
  init(dataSource: String) {
    guard let dataPathString = Bundle.main.path(forResource: dataSource, ofType: "plist") else {
      fatalError()
    }
    
    let dataURL = URL(fileURLWithPath: dataPathString)
    self.dataURL = dataURL
  }
  
  func getData(completion: @escaping (GetDataRequest<Type>) -> Void) {
    do {
      let data = try Data(contentsOf: dataURL)
      let resources = try PropertyListDecoder().decode([Type].self, from: data)
      completion(.success(resources))
    } catch {
      print(error.localizedDescription)
      completion(.failure)
    }
  }
}
