//
//  DetailViewController.swift
//  SpotlightController_Example
//
//  Copyright (c) 2019 dashdevs.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var contentTextView: UITextView!
    
    var model: AppModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = model.title
        contentTextView.text = model.content
    }
}
