//
//  imgUrlClasses.swift
//  TestVenturus
//
//  Created by Guilherme Duarte on 10/06/20.
//  Copyright © 2020 Guilherme Duarte. All rights reserved.
//

import Foundation

struct ImgUrlInfo: Codable {
    let data: [ImgUrlData]
}
struct ImgUrlData: Codable {
    let title: String
    let cover: String
}
