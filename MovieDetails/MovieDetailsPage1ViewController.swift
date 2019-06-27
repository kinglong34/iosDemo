//
//  Page1ViewController.swift
//  TableView
//
//  Created by long on 13/6/2019.
//  Copyright © 2019 long. All rights reserved.
//

import UIKit

class Page1ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var poster = ["21","22","23","24","25","26"]
    
    let name = ["水行俠", "掃毒2:天地對決","狂野時速:雙雄聯盟", "蜘蛛俠:決戰千里", "黑超特警組：反轉世界", "九龍不敗"]
    
    let rate = ["4.5", "4.0", "4.5", "4.3", "3.8" , "3.5"]
    
    let time = ["124分鐘 | IIA級", "100分鐘 | IIA級" , "125分鐘 | IIA級",  "108分鐘 | IIA級", "112分鐘 | IIA級", "96分鐘 | IIA級" ]
    

    @IBOutlet weak var firstPageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstPageCollectionView.delegate = self
        firstPageCollectionView.dataSource = self

       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return poster.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = firstPageCollectionView.dequeueReusableCell(withReuseIdentifier: "FirstPageCollectionViewCell", for: indexPath) as! FirstPageCollectionViewCell
        
        
        cell.nameLabel.text =  name[indexPath.item]
        cell.rateLabel.text =  rate[indexPath.item]
        cell.timeLabel.text =  time[indexPath.item]
        cell.imageView.image = UIImage(named: poster[indexPath.row])
        
       
        
        return cell
        
    }



}
