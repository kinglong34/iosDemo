//
//  HomePageViewController.swift
//  TableView
//
//  Created by long on 11/6/2019.
//  Copyright © 2019 long. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

   
    @IBOutlet weak var pageCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    
    
    var poster = ["12","13","14"] 
    
    let film = ["漫威解禁！首曝光Disney+影集《洛基》湯姆希德斯頓概念照","《秘境探險》真人電影定檔明年聖誕，蜘蛛人將飾演年輕版奈森","【本週新片】《哥吉拉》怪獸大亂鬥　《出發》見證陳彥博10年超馬血淚" ,"新海誠導演最新作 網友跪著等看！《天氣之子》又一神作來襲"]
    
    var newsMovies = ["0", "1", "2", "3"]
    
    let trailer = ["獅子王","X戰警:黑鳳凰","追龍II賊王","蜘蛛人:離家日"]
    
    var trailerMovies = ["4", "5", "6", "7"]
    
    let filmComment = ["【影評】《X戰警：黑鳳凰》　帥氣又感傷的變種人告別之旅", "【影評】《哥吉拉：怪獸之王》：療傷的最好方式，是勇於面對傷口的惡魔","【影評】《阿拉丁》重現經典　歌舞更有迪士尼味", "【影評】《捍衛任務3：全面開戰》　無極限！亢奮又炫目"]
    
    var commentMovies = ["8", "9", "10", "11"]
    
    
 
    var timer = Timer() //pageController timer
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        
        thirdCollectionView.delegate = self
        thirdCollectionView.dataSource = self
        
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        
        pageView.numberOfPages = poster.count
        pageView.currentPage = 0
        
        DispatchQueue.main.async{       //time interval to switch to next photo
            
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector:#selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc func changeImage(){       // function to implement the photo switching action timely
        
        if counter < poster.count{
            let index = IndexPath.init(item: counter, section: 0)
            self.pageCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        } else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.pageCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
            
        }
        
    }
    
    
   /* func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1 
    }*/
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {   //each collectionView return how many data
        
        if collectionView == self.pageCollectionView{
            return poster.count
        } else {
            
            return newsMovies.count
        }
            }
        
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {   //each collectionView return what data
        
        
            if collectionView == self.firstCollectionView{
                
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
        
            
            cell.firstLabel.text = film[indexPath.item]
            cell.imageView.image = UIImage(named: newsMovies[indexPath.row])
            
            return cell
        
            }
                
            else if collectionView == self.secondCollectionView {
                
                let cell = secondCollectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
                
                cell.secondLabel.text = trailer[indexPath.item]
                cell.imageView.image = UIImage(named: trailerMovies[indexPath.row])
                
                return cell
        }
                
            else if collectionView == self.pageCollectionView {
                
                let cell = pageCollectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell", for: indexPath) as! PageCollectionViewCell

                cell.imageView.image = UIImage(named: poster[indexPath.row])
                
                return cell
            }
        
            else{
                
                let cell = thirdCollectionView.dequeueReusableCell(withReuseIdentifier: "ThirdCollectionViewCell", for: indexPath) as! ThirdCollectionViewCell
                
                cell.thirdLabel.text = filmComment[indexPath.item]
                cell.imageView.image = UIImage(named: commentMovies[indexPath.row])
                
                return cell
              
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as!DetailViewController
        
        if collectionView == self.firstCollectionView{
            
        vc.name = film[indexPath.row]
        vc.image = UIImage(named: newsMovies[indexPath.row])!
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        }
        if collectionView == self.secondCollectionView{
            
            vc.name = trailer[indexPath.row]
            vc.image = UIImage(named: trailerMovies[indexPath.row])!
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
      if  collectionView == self.thirdCollectionView{
            
            vc.name = filmComment[indexPath.row]
            vc.image = UIImage(named: commentMovies[indexPath.row])!
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}


