//
//  FriendsCollectionViewController.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class FriendsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = collectionView
            .collectionViewLayout as? UICollectionViewFlowLayout

        layout?.minimumInteritemSpacing = 0
        layout?.minimumLineSpacing = 0
    }

    // MARK: - Navigation

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendPhotoCell", for: indexPath) as! FriendsCollectionViewCell
        let photoName = "photo" + String(indexPath.item + 1)
        cell.friendPhoto.image = UIImage(named: photoName)
        return cell
    }

    // MARK: UICollectionViewDelegate

}
