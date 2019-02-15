//
//  ViewController.swift
//  CollectionItem
//
//  Created by IMCS2 on 2/13/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let imageArr: [String] = ["pexels-photo-104516","pexels-photo-243243","pexels-photo-426893","pexels-photo-567451","pexels-photo-929282","pexels-photo-952630","pexels-photo-956724","pexels-photo-1154861","pexels-photo-1161745","pexels-photo-1892512"]
    
    @IBOutlet var mainImage: UIImageView!
    
    var totalCell: Int = 10
    
    @IBOutlet weak var collectionOutlet: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Invoked")
        return totalCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for:  indexPath as IndexPath) as! imageCollectionViewCell
        cell.galleryImage.image = UIImage(named: imageArr[indexPath.item % imageArr.count ])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainImage.image = UIImage(named: imageArr[indexPath.item % imageArr.count])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == totalCell - 1 {
            let insertIndexPath = IndexPath(item: totalCell, section: 0)
            totalCell += 1
            collectionView.insertItems(at: [insertIndexPath])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 150)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionOutlet.contentSize.height = 150
        // Do any additional setup after loading the view, typically from a nib.
    }


}

