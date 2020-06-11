//
//  HomeViewModel.swift
//  TestVenturus
//
//  Created by Guilherme Duarte on 10/06/20.
//  Copyright © 2020 Guilherme Duarte. All rights reserved.
//

import Foundation

class HomeViewModel {
    private var imgUrlInfos: [ImgUrlData] = [] {
        didSet {
            imgUrlInfosLoaded?()
        }
    }
    var imgUrlInfosLoaded: (()->Void)?
    
    var count: Int{
        return imgUrlInfos.count
    }
    
    func loadImgurl() {
        DataService.shared.getInfo { infos in
            if let infos = infos{
                self.imgUrlInfos = infos.data
            }
        }
    }
    
    func getImgurat(indexPath: IndexPath) -> ImgUrlData {
        return imgUrlInfos[indexPath.row]
    }
    
    func viewModelFor(indexPath: IndexPath) -> HomeCollectionViewModel {
        let imgUrlInfo = getImgurat(indexPath: indexPath)
        return HomeCollectionViewModel(imgUrlInfo: imgUrlInfo)
    }
}
