//
//  NewJSONMoel.swift
//  JSONTest
//
//  Created by 沈庭鋒 on 2023/4/18.
//

import Foundation

struct Movies : Codable{
    let page : Int
    let results : [Result]
}

struct Result : Codable{
    
    let original_title : String
    let overview : String
    let release_date : String
    let poster_path : String
    
    var posterURL: URL? {
          let path = poster_path 
          return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
      }
    
}
