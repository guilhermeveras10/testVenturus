//
//  ImgurCollectionViewCell.swift
//  TestVenturus
//
//  Created by Guilherme Duarte on 11/06/20.
//  Copyright © 2020 Guilherme Duarte. All rights reserved.
//

import UIKit
import SDWebImage

class ImgurCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func configure(with viewModel: HomeCollectionViewModel) {
        image.sd_setImage(with: viewModel
            .cover, completed: nil)
        title.text = viewModel.title
    }
}
