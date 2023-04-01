//
//  File.swift
//  MyStoryBoard
//
//  Created by 이동연 on 2023/04/01.
//

import Foundation
import Alamofire

struct MyApi {
    static let shared = MyApi()
    
    private let photoUrl = "https://jsonplaceholder.typicode.com/photos"
    
    func callService() {
        AF.request(
            photoUrl, method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: ["Content-Type" : "application/json", "Accept":"application/json"]
        ).validate(statusCode: 200 ..< 300).responseJSON { response in
            print("데이타 !! : \(response)")
        }
    }
}
