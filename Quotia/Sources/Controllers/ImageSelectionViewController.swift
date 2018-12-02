//
//  ImageSelectionViewController.swift
//  Quotia
//
//  Created by Nikita Teslyuk on 02/12/2018.
//  Copyright © 2018 Nikita Teslyuk. All rights reserved.
//

import UIKit

class ImageSelectionViewController: UIViewController {

    var image: UIImage?
    var category: Category?
    
    @IBOutlet weak var initialImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let availableImage = image, let availableCategory = category {
            
            initialImageView.image = availableImage
            categoryLabel.text = availableCategory.categoryName
            
        }
        
    }

}
