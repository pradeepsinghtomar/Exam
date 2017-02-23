//
//  ImageCollectionViewController.swift
//  IntelimentTestApp
//
//  Created by Pradeep Singh on 23/02/17.
//  Copyright © 2017 Pradeep Singh. All rights reserved.
//

import UIKit

class ImageCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let reuseIdentifier = "ImageCollectionViewCellIdentifier"
    var imagesArray:Array<String>? = [
        "https://source.unsplash.com/WLUHO9A_xik/160x160",
        "https://source.unsplash.com/BYId1ZNXW7Q/160x160",
        "https://source.unsplash.com/xnKJ1mJ9-_w/160x160",
        "https://source.unsplash.com/T-G9PVLOfOY/160x160",
        "https://source.unsplash.com/IOCN-gwfwEU/160x160",
        "https://source.unsplash.com/Vk5lEHcWHjA/160x160",
        "https://source.unsplash.com/x7ZYqs9ipRE/160x160",
        "https://source.unsplash.com/jPdrBhczUY0/160x160",
        "https://source.unsplash.com/2fgvaQX-FXs/160x160",
        "https://source.unsplash.com/1G2V5m_tPs8/160x160",
        
        "https://source.unsplash.com/vL4ARRCFyg4/160x160",
        "https://source.unsplash.com/Pb1bWTGe46Q/160x160",
        "https://source.unsplash.com/Qe_dS4-jO6E/160x160",
        "https://source.unsplash.com/eJx43ng-fTU/160x160",
        "https://source.unsplash.com/u3ajSXhZM_U/160x160",
        "https://source.unsplash.com/2gk6BDXSxlQ/160x160",
        "https://source.unsplash.com/b-yEdfrvQ50/160x160",
        "https://source.unsplash.com/m5VCMFMW1mM/160x160",
        "https://source.unsplash.com/PdnseHuDFZU/160x160",
        "https://source.unsplash.com/uwQlgl4NbSg/160x160",
        
        "https://source.unsplash.com/EKIyHUrUHWU/160x160",
        "https://source.unsplash.com/BsWgMBfb208/160x160",
        "https://source.unsplash.com/h3jarbNzlOg/160x160",
        "https://source.unsplash.com/TLMfkChQ9Sk/160x160",
        "https://source.unsplash.com/IE_sifhay7o/160x160",
        "https://source.unsplash.com/8MbdD0pHXGY/160x160",
        "https://source.unsplash.com/eHpYD4U5830/160x160",
        "https://source.unsplash.com/LNOJuUSJZqM/160x160",
        "https://source.unsplash.com/xI_-wFJhCiM/160x160",
        "https://source.unsplash.com/ixHfyjA49M8/160x160"
    ]
    
    var isImageCacheCleared:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesArray!.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ImageCollectionViewCell
        let imageURLString:String = imagesArray![indexPath.item]
        if !isImageCacheCleared {
            cell.cellImageView.clearImageCache()
            isImageCacheCleared = true
        }
        cell.cellImageView.asyncDownload(urlString: imageURLString, cell: cell, index: indexPath)
        cell.cellImageView.tag = indexPath.item
        cell.backgroundColor = UIColor.black
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 18
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let kSize = 160
        let size = CGSize(width: collectionView.bounds.size.width/3, height: CGFloat(kSize))
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
