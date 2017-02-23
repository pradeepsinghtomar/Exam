//
//  CustomScrollView.swift
//  IntelimentTestApp
//
//  Created by Pradeep Singh on 23/02/17.
//  Copyright © 2017 Pradeep Singh. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width

class CustomScrollView: UIScrollView {

    func addImageWithArray(array : Array <UIImage>) {
        var xCoordinate : CGFloat = 0.0
        for counter in 0...(array.count-1) {
            let frame = CGRect(x: xCoordinate, y: 0, width: SCREEN_WIDTH, height: self.bounds.height - 50)
            
            let imageView = UIImageView(frame: frame)
            
            let currentImage = array[counter]
            imageView.image = currentImage
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            
            imageView.backgroundColor = UIColor.gray
            self.addSubview(imageView)
            xCoordinate = xCoordinate + SCREEN_WIDTH
        }
    }
    
    func selectedPageIndex() -> Int {
        let pageNumber = round(self.contentOffset.x / SCREEN_WIDTH)
        return Int(pageNumber)
    }
    
    func moveToPageIndex( index : Int) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5 , delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.contentOffset = CGPoint(x: (Double(index) * Double(SCREEN_WIDTH)), y: 0)
            }, completion: nil)
        }
    }
}
