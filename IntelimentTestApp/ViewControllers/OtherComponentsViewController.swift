//
//  OtherComponentsViewController.swift
//  IntelimentTestApp
//
//  Created by Pradeep Singh on 23/02/17.
//  Copyright © 2017 Pradeep Singh. All rights reserved.
//

import UIKit

class OtherComponentsViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var containerScrollView: CustomScrollView!
    @IBOutlet weak var pageControl: UIPageControl!{
        didSet{
            pageControl.currentPage = 0
        }
    }
    
    var lastIndex = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        containerScrollView.contentSize = CGSize(width: (3 * UIScreen.main.bounds.width), height: containerScrollView.bounds.height - 50)
        
        var imageArray : Array <UIImage> = []
        imageArray.append(UIImage(named: "pic1.jpg")!)
        imageArray.append(UIImage(named: "pic2.jpg")!)
        imageArray.append(UIImage(named: "pic3.jpg")!)
        
        lastIndex = imageArray.count
        containerScrollView.addImageWithArray(array: imageArray)
    }
    
    // Mark: - Actions
    @IBAction func previousButtonAction(_ sender: UIButton) {
        
        let selectedIndex = containerScrollView.selectedPageIndex()
        if  selectedIndex != 0 {
            pageControl.currentPage = (selectedIndex - 1)
            containerScrollView.moveToPageIndex(index: (selectedIndex - 1))
        }
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        let selectedIndex = containerScrollView.selectedPageIndex()
        if  selectedIndex != (lastIndex-1) {
            pageControl.currentPage = (selectedIndex + 1)
            containerScrollView.moveToPageIndex(index: (selectedIndex + 1))
        }
    }
    
    @IBAction func pageControlAction(_ sender: UIPageControl) {
        containerScrollView.moveToPageIndex(index: sender.currentPage)
    }
    
    // Mark: - ScrollView Delegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let selectedIndex = containerScrollView.selectedPageIndex()
        pageControl.currentPage = selectedIndex
    }
    
}
