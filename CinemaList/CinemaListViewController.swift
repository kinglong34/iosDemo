//
//  ViewController.swift
//  TableView
//
//  Created by long on 1/6/2019.
//  Copyright © 2019 long. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblAppleProducts:UITableView!

    
    @IBOutlet weak var allButton: UIButton!
    
    @IBOutlet weak var hkButton: UIButton!
    
    @IBOutlet weak var klButton: UIButton!
    
    @IBOutlet weak var ntButton: UIButton!
    
    var allRegion = ["英皇戲院 - 娛樂行","百老匯戲院 - 數碼港","MOViE MOViE Cityplaza","百老匯電影中心","百老匯戲院 - 旺角","百老匯戲院 - The ONE","英皇戲院 - 屯門新都商場","百老匯戲院 - 葵芳" ,"百老匯戲院 - 荃灣"]
    var allAddress = ["香港中環皇后大道中30號娛樂行3樓","香港數碼港道100號數碼港商場地面層3號鋪","香港太古城道18號太古城中心1期5樓","九龍油麻地眾坊街3號駿發花園","九龍西洋菜街6-12號",
                     "九龍尖沙咀彌敦道100號The ONE6-11樓","新界屯門屯利街2號新都商場3樓" ,"新界葵芳興芳路223號新都會廣場L1-L4","新界荃灣大壩街4-30號荃灣"]

    var hKRegion = ["英皇戲院 - 娛樂行","百老匯戲院 - 數碼港","MOViE MOViE Cityplaza"]
    var hkAddress = ["香港中環皇后大道中30號娛樂行3樓","香港數碼港道100號數碼港商場地面層3號鋪","香港太古城道18號太古城中心1期5樓"]
    
    var klRegion = ["百老匯電影中心","百老匯戲院 - 旺角","百老匯戲院 - The ONE"]
    var klAddress = ["九龍油麻地眾坊街3號駿發花園","九龍西洋菜街6-12號","九龍尖沙咀彌敦道100號The ONE 6-11樓" ]
    
    var ntRegion = ["英皇戲院 - 屯門新都商場","百老匯戲院 - 葵芳" ,"百老匯戲院 - 荃灣"]
    var ntAddress = ["新界屯門屯利街2號新都商場3樓" ,"新界葵芳興芳路223號新都會廣場L1-L4","新界荃灣大壩街4-30號荃灣"]
    
    var selectedButton: UIButton! // initalize botton variable
    
    var tag = 0
   
    var searchRegion = [String]()   //for searching
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.hidesSearchBarWhenScrolling = false
        allButton.tag = 0
        hkButton.tag = 1
        klButton.tag = 2
        ntButton.tag = 3
        
       selectedButton = allButton //delcare the default pressed button is allButton
    
        
        self.tblAppleProducts.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")// register tableView xib on this tableView
        
        tblAppleProducts.dataSource = self  //
        tblAppleProducts.delegate = self    //
    }
    
    @objc func setupalert(){    // function to add in favourite
        let alertcontroller = UIAlertController(title: "", message: "Added In Favourite", preferredStyle:. alert)
        
        let alertaction = UIAlertAction(title: "CLOSE", style: .cancel, handler: nil)
        
        alertcontroller.addAction(alertaction)
        self.present(alertcontroller, animated: true)
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {   //function that return how many row on tablebview
       
        
      if self.tag == 0{
            return allRegion.count
            
        }
        
        else{ return hKRegion.count }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {    //function to return what value on tableview
     
        let cell = self.tblAppleProducts.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        if self.tag == 0   {
            
            cell.productNameLabel.text = allRegion[indexPath.row]
            cell.catLabel.text = allAddress[indexPath.row]
            cell.favButton.addTarget(self, action: #selector(setupalert), for: .touchUpInside)
            return cell
        }
            
       else if self.tag == 1 {
            
            cell.productNameLabel.text = hKRegion[indexPath.row]
            cell.catLabel.text = hkAddress[indexPath.row]
            cell.favButton.addTarget(self, action: #selector(setupalert), for: .touchUpInside)
            return cell
            
        }else if self.tag == 2   {
            
            cell.productNameLabel.text = klRegion[indexPath.row]
            cell.catLabel.text = klAddress[indexPath.row]
            cell.favButton.addTarget(self, action: #selector(setupalert), for: .touchUpInside)
            return cell
            
        } else if self.tag == 3   {
            
            cell.productNameLabel.text = ntRegion[indexPath.row]
            cell.catLabel.text = ntAddress[indexPath.row]
            
            cell.favButton.addTarget(self, action: #selector(setupalert), for: .touchUpInside)
            return cell
           
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {     // detect do user press on the button action
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func changeTab(to newButton: UIButton) {
        
        let defaultColor = selectedButton.tintColor //  = white
        
        selectedButton.backgroundColor = UIColor.black
        selectedButton.setTitleColor(defaultColor, for: .normal)
        newButton.backgroundColor = UIColor.lightGray
        newButton.setTitleColor(UIColor.black, for: .normal)
        
        selectedButton = newButton
    }
    
    @IBAction func allregion(_ sender: UIButton) {
        
        self.tag = sender.tag
        
        tblAppleProducts.reloadData()
        
        changeTab(to: allButton)
    }
    
    @IBAction func hkregion(_ sender: UIButton) {
        
        self.tag = sender.tag
        
        tblAppleProducts.reloadData()
        
        changeTab(to: hkButton)
    }
    
    @IBAction func klregion(_ sender: UIButton) {
        self.tag = sender.tag
        
        tblAppleProducts.reloadData()
        changeTab(to: klButton)
    }
    
    @IBAction func ntregion(_ sender: UIButton) {
        
        self.tag = sender.tag
        
        tblAppleProducts.reloadData()
        
        changeTab(to: ntButton)
    }
   
}


