//
//  ProductTableViewCell.swift
//  TableView
//
//  Created by long on 2/6/2019.
//  Copyright © 2019 long. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var catLabel: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //@IBAction func Alertaction(_ sender: Any) {
    //setupalert()
    //}
    
    func setupalert(){
        let alertcontroller = UIAlertController(title: "", message: "Added In Favourite", preferredStyle:. alert)
        
        let alertaction = UIAlertAction(title: "CLOSE", style: .cancel, handler: nil)
        
        alertcontroller.addAction(alertaction)
        self.window?.rootViewController?.present(alertcontroller, animated:  true, completion: nil)
        
        
     }
    
    
}
