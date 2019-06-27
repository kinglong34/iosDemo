//
//  Page2ViewController.swift
//  TableView
//
//  Created by long on 13/6/2019.
//  Copyright © 2019 long. All rights reserved.
//

import UIKit

class Page2ViewController:  UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var poster = ["15","16","17", "18", "19","20"]

    let name = ["猛毒", "復仇者聯盟","哈利波特:死神的聖物", "哈利波特：火盃的考驗", "復仇者聯盟4：終局之戰", "分裂"]
    
    let rate = ["4.5", "4.0", "4.5", "4.3", "3.8" , "3.5"]
    
    let time = ["124分鐘 | IIA級", "100分鐘 | IIA級" , "125分鐘 | IIA級",  "108分鐘 | IIA級", "112分鐘 | IIA級", "96分鐘 | IIA級" ]
    
    
    
    
    @IBOutlet weak var secondPageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        secondPageCollectionView.delegate = self
        secondPageCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return poster.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = secondPageCollectionView.dequeueReusableCell(withReuseIdentifier: "SecondPageCollectionViewCell", for: indexPath) as! SecondPageCollectionViewCell
        
        
        
        cell.nameLabel.text =  name[indexPath.item]
        cell.rateLabel.text =  rate[indexPath.item]
        cell.timeLabel.text =  time[indexPath.item]
        cell.imageView.image = UIImage(named: poster[indexPath.row])
        
        return cell
        
        
        
    }
}
