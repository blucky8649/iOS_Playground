//
//  Photo.swift
//  MyStoryBoard
//
//  Created by 이동연 on 2023/04/01.
//

import Foundation
import Alamofire

struct Photo: Codable {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}


extension Photo {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Photo.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    

    init(fromuRL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func fromJson() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func toJson(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.fromJson(), encoding: encoding)
    }
}

