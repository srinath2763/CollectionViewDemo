//
//  ViewController.swift
//  CollectionItem
//
//  Created by IMCS2 on 2/13/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let imageArr: [String] = ["beach","css","js","download","java","cobol","html"]
    
    @IBOutlet var toDisplay: UIImageView!
    
    var cells: Int = 10
    
    @IBOutlet weak var collectionOutlet: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for:  indexPath as IndexPath) as! imageCollectionViewCell
        cell.galleryImage.image = UIImage(named: imageArr[indexPath.item % imageArr.count ])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Invoked")
        return cells
    }
   
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == cells - 1 {
            let insertIndexPath = IndexPath(item: cells, section: 0)
            cells += 1
            collectionView.insertItems(at: [insertIndexPath])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        toDisplay.image = UIImage(named: imageArr[indexPath.item % imageArr.count])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionOutlet.contentSize.height = 150
        // Do any additional setup after loading the view, typically from a nib.
    }

//Added images
}

