//
//  Model.swift
//  iosdev
//
//  Created by Khizer Younas on 25/07/2018.
//  Copyright © 2018 Khizer Younas. All rights reserved.
//

import Foundation

struct JsonModel : Codable {
    
    let data : DataFirst?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataFirst.self, forKey: .data)
    }
    
}

struct DataFirst : Codable {
    
    let children : [Children]?
    
    enum CodingKeys: String, CodingKey {
        
        case children = "children"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        children = try values.decodeIfPresent([Children].self, forKey: .children)
    }
    
}

struct Children : Codable {
    
    let data : DataInner?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataInner.self, forKey: .data)
    }
    
}


struct DataInner : Codable {
    
    let author : String?
    let numComments : Int?
    let selftext : String?
    let title : String?
   
    
    enum CodingKeys: String, CodingKey {
   
        case author = "author"
        case numComments = "num_comments"
        case selftext = "selftext"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        numComments = try values.decodeIfPresent(Int.self, forKey: .numComments)
        selftext = try values.decodeIfPresent(String.self, forKey: .selftext)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
    
}



