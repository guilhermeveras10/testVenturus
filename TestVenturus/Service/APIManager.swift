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
    /*
     A API passada estava com instabilidades hora respondia hora não, optei por copiar a response e colocar numa URL estática, por isso o endpoint está diferente.
     */
//    static var url = "https://api.imgur.com/3/gallery/search/?q=cats"
    static var url = "https://demo1255337.mockable.io/cats"
//    static var private_key = "63775118a9f912fd91ed99574becf3b375d9eeca"
//    static var public_key = "Client-ID 1ceddedc03a5d71"
    
}
struct DataService {

    // MARK: - Singleton
    
    static var shared = DataService()
    
    //MARK: - Get Images
    
    func getInfo(completion: @escaping (ImgUrlInfo?) -> Void) {
        
//        let headers: HTTPHeaders = [
//            "Authorization": URLTest.public_key,
//            "Content-type": "application/json"
//        ]
        
        Alamofire.request(URLTest.url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
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
