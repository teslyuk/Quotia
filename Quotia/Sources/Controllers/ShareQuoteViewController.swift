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
        
    }

}
