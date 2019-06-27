//
//  DetailViewController.swift
//  TableView
//
//  Created by long on 16/6/2019.
//  Copyright © 2019 long. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var DetailLabel: UILabel!
    @IBOutlet weak var DetailImageView: UIImageView!
    
   
    
    var image = UIImage()
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailLabel.text = name
        DetailImageView.image = image
        
       
    }
    
    @IBAction func DetailButton(_ sender: UIButton) {
    }
    
   

}
