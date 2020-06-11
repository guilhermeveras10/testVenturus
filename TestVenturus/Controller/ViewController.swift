//
//  ViewController.swift
//  TestVenturus
//
//  Created by Guilherme Duarte on 10/06/20.
//  Copyright © 2020 Guilherme Duarte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Propreties
    
    lazy var viewModel = HomeViewModel()
    
    @IBOutlet weak var imgurCollection: UICollectionView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader(true)
        viewModel.loadImgurl()
        viewModel.imgUrlInfosLoaded = imgUrlInfosLoaded
    }
    
    //MARK: - Helpers
    
    func imgUrlInfosLoaded(){
        DispatchQueue.main.async {
            self.imgurCollection.reloadData()
            self.showLoader(false)
        }
    }
}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imgurCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImgurCollectionViewCell
        cell.configure(with: viewModel.viewModelFor(indexPath: indexPath))
        return cell
    }
}
