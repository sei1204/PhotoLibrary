//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by 三城聖 on 2017/07/09.
//  Copyright © 2017年 三城聖. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var photoAssets: Array! = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func setup() {
        collectionView.dataSource = self as? UICollectionViewDataSource
        
        let flowLayout: UICollectionViewFlowLayout! = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 4, height: UIScreen.main.bounds.width / 3 - 4)
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 6
        
        collectionView.collectionViewLayout = flowLayout
    }

    fileprivate func libraryRequestAuthorization() {
        PHPhotoLibrary.requestAuthorization({[weak self] status in
            guard let wself = self else {
               return
            }
            wself.photoAssets.append(asset as PHAsset)
        })
        collectionView.reloadData()
    }
}

