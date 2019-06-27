//
//  ViewController.swift
//  TableView
//
//  Created by long on 13/6/2019.
//  Copyright © 2019 long. All rights reserved.
//

import UIKit

class  ViewController: UIViewController {

    @IBOutlet weak var page1Button: UIButton!
    
    @IBOutlet weak var page2Button: UIButton!
    
    @IBOutlet weak var page3Button: UIButton!
    
    @IBOutlet weak var page4Button: UIButton!
    
    @IBOutlet weak var containerView: UIView!

    var selectedButton: UIButton!
    
    var mainViewController: ViewController!

     var pageViewController: PageViewController!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedButton = page1Button
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContainerViewSegue" {
            pageViewController = segue.destination as! PageViewController
           pageViewController.mainViewController = self
            
        }
    }
   
    func changeTab(to newButton: UIButton) {
        
        let defaultColor = selectedButton.tintColor //  = white
      
        selectedButton.backgroundColor = UIColor.black
        selectedButton.setTitleColor(defaultColor, for: .normal)
        
        newButton.backgroundColor = UIColor.lightGray
        newButton.setTitleColor(UIColor.black, for: .normal)
       
        selectedButton = newButton
    }
    
    func changeTab(byIndex index: Int) {
        switch index {
        case 0: changeTab(to: page1Button)
        case 1: changeTab(to: page2Button)
        default: return
        }
    }
    
    @IBAction func showPage1(_ sender: Any) {
        changeTab(to: page1Button)
       pageViewController.showPage(byIndex: 0)
    }
    
    @IBAction func showPage2(_ sender: Any) {
         changeTab(to: page2Button)
        pageViewController.showPage(byIndex: 1)
    }
    
    /* @IBAction func showPage3(_ sender: Any) {
       
    }
    
    
    @IBAction func showPage4(_ sender: Any) {
       
    }*/
    
    
    
}
