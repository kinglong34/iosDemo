//
//  PageViewController.swift
//  TableView
//
//  Created by long on 13/6/2019.
//  Copyright © 2019 long. All rights reserved.
//

import UIKit

class PageViewController:  UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageViewController: PageViewController!
    
    var mainViewController: ViewController!
    
    var willTransitionTo: ViewController!
    
    lazy var page1ViewController: Page1ViewController = {
        self.storyboard!.instantiateViewController(withIdentifier: "Page1") as! Page1ViewController
    }()
    lazy var page2ViewController: Page2ViewController = {
        self.storyboard!.instantiateViewController(withIdentifier: "Page2") as! Page2ViewController
    }()
    
    
    lazy var orderedViewControllers: [UIViewController] = {         // let 2 viewController insert into orderedViewControllers array
        [self.page1ViewController, self.page2ViewController]
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.delegate = self
        
        self.dataSource = self
        
        setViewControllers([page1ViewController], direction: .forward, animated: false, completion: nil)
 
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {   //swipe to 	previous page
        
        guard let index = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = index - 1
        guard previousIndex >= 0 && previousIndex < orderedViewControllers.count else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {    //swipe to next page
        
        guard let index = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let nextIndex = index + 1
        guard nextIndex >= 0 && nextIndex < orderedViewControllers.count else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    
    
    func showPage(byIndex index: Int) {
        let viewController = orderedViewControllers[index]
        setViewControllers([viewController], direction: .forward, animated: false, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContainerViewSegue" {
            pageViewController = segue.destination as? PageViewController
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.willTransitionTo = pendingViewControllers.first as! ViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guard let index = orderedViewControllers.firstIndex(of: self.willTransitionTo) else { return }
            let previousViewController = previousViewControllers.first!
            let previousIndex = orderedViewControllers.firstIndex(of: previousViewController)
            if index != previousIndex {
                mainViewController.changeTab(byIndex: index)
            }
        }
    }
}
