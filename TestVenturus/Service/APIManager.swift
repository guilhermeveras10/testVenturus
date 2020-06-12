//
//  APIManager.swift
//  TestVenturus
//
//  Created by Guilherme Duarte on 10/06/20.
//  Copyright © 2020 Guilherme Duarte. All rights reserved.
//

import Foundation
import Alamofire

struct URLTest {
    static var url = "https://api.imgur.com/3/gallery/search/?q=cats"
    static var public_key = "Client-ID f7d0b41cdaa41a9"
    
}
struct DataService {

    // MARK: - Singleton
    
    static var shared = DataService()
    
    //MARK: - Get Images
    
    func getInfo(completion: @escaping (ImgUrlInfo?) -> Void) {
        
        let headers: HTTPHeaders = [
            "Authorization": URLTest.public_key,
            "Content-type": "application/json"
        ]
        
        Alamofire.request(URLTest.url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            guard let data = response.data else {
                completion(nil)
                return
            }
            do{
                let imgUrlInfo = try? JSONDecoder().decode(ImgUrlInfo.self, from: data)
                completion(imgUrlInfo)
            } catch {
                completion(nil)
            }
    
        }
        
    }

}
