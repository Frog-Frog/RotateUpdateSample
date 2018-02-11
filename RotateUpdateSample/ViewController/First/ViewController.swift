//
//  ViewController.swift
//  RotateUpdateSample
//
//  Created by Tomosuke Okada on 2018/02/11.
//  Copyright © 2018年 TomosukeOkada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: cellName, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: cellName)
        }
    }
    
    let cellName = String(describing: CollectionViewCell.self)
    let cellCount = 40
}

// MARK: - LifeCycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.frame.size = UIScreen.main.bounds.size
        view.layoutIfNeeded()
    }
}


// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! CollectionViewCell
        cell.colorView.backgroundColor = UIColor.random
        cell.countLabel.text = String(indexPath.row)
        
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width/10, height: collectionView.frame.height/4)
        return size
    }
}


// MARK: - Notification
extension ViewController {
    private func registerNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didChangeOrientation(_:)),
                                               name: .UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    @objc private func didChangeOrientation(_ notification: Notification) {
        collectionView.reloadData()
    }
}


// MARK: - IBAction
extension ViewController {
    @IBAction private func tappedModalSecondButton(_ sender: Any) {
        performSegue(withIdentifier: "modalSecond", sender: nil)
    }
}



