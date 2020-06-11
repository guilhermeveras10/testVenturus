//
//  HomeCollectionViewModel.swift
//  TestVenturus
//
//  Created by Guilherme Duarte on 11/06/20.
//  Copyright © 2020 Guilherme Duarte. All rights reserved.
//

import Foundation

struct HomeCollectionViewModel {
    
    private var imgUrlInfo: ImgUrlData
    
    init(imgUrlInfo: ImgUrlData) {
        self.imgUrlInfo = imgUrlInfo
    }
    
    var link: URL? {
        return imgUrlInfo.link
    }
}
