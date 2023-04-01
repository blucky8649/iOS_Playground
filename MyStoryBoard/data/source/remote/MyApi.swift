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
    
    func callService(completion: @escaping ([Photo]) -> Void) {
        AF.request(
            photoUrl, method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: ["Content-Type" : "application/json", "Accept":"application/json"]
        ).responseDecodable(of: [Photo].self) { response in
            switch response.result {
            case .success(let obj) : print("성공") ; completion(obj)
            case .failure : print("실패")
            }
        }
    }
}
