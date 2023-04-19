//
//  JSONModel.swift
//  JSONTest
//
//  Created by 沈庭鋒 on 2023/4/15.
//

import UIKit

/*
 {"id":1,"name":{"en":"Bulbasaur","zh":"妙蛙種子"},"types":{"en":["grass","poison"],"zh":["草","毒"]},"genera":{"en":"Seed Pokémon","zh":"種子寶可夢"},"entries":{"en":["A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.","It can go for days without eating a single morsel. In the bulb on its back, it stores energy.","The seed on its back is filled with nutrients. The seed grows steadily larger as its body grows."],"zh":["背上的種子裡存著很多營養，所以就算好幾天不吃東西也能活得好好的！","從出生的時候開始背上就有一顆植物種子。這顆種子會漸漸地長大。","在出生後的一段時間內，牠會吸收背上種子裡儲存著的營養成長。"]}}
 */

/* 錯誤範例，不能共用struct
struct Pokemon: Decodable {
    let id: String
    let name: Language
    let types: LanguageArray
    let genera : Language
    let entries : LanguageArray
}

struct Language: Decodable {
    let en: String
    let zh: String
}

struct LanguageArray: Decodable {
    let en: [String]
    let zh: [String]
}
*/

//目前是否為 Decodable 並不影響執行

struct Pokemon: Decodable {
    let id: Int
    let name: Name
    let types: Types
    let genera: Genera
    let entries: Entries
}

struct Name: Decodable {
    let en: String
    let zh: String
}

struct Types: Decodable {
    let en: [String]
    let zh: [String]
}

struct Genera: Decodable {
    let en: String
    let zh: String
}

struct Entries: Decodable {
    let en: [String]
    let zh: [String]
}

//extension Pokemon {
//    static var data: [Self] {
//        guard let data = NSDataAsset(name: "PokeApi")?.data else {
//            return []
//        }
//        return (try? JSONDecoder().decode([Self].self, from: data)) ?? []
//    }
//}

extension Pokemon {
    static var data: [Self] {
        var districtData = [Self]()
        if let data = NSDataAsset(name: "PokeApi")?.data {
            do {
                districtData = try JSONDecoder().decode([Self].self, from: data)
            } catch {
                print(error)
            }
            
        }
        return districtData
    }
}
