//
//  JSONTestViewController.swift
//  JSONTest
//
//  Created by 沈庭鋒 on 2023/4/15.
//

import UIKit

class JSONTestViewController: UIViewController {

    let pokemon = Pokemon.data

    @IBOutlet weak var pokemonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        title = "神奇寶貝圖鑑"

    }
    

}

extension JSONTestViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = pokemonTableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as! PokemonTableViewCell
        
        cell.pokemonID.text = "編號：\(pokemon[indexPath.row].id)"
        cell.pokemonName.text = pokemon[indexPath.row].name.zh
        
        
        
        
//        let point = cell.pokemonType.convert(CGPoint.zero, to: tableView)
//               if let indexPath = tableView.indexPathForRow(at: point) {
//
//                   }
    let typesCount = pokemon[indexPath.row].types.zh.count
        var indexTypeRow = ""
        for i in 0...typesCount-1{
            
            indexTypeRow += pokemon[indexPath.row].types.zh[i]
        }
        cell.pokemonType.text! = indexTypeRow

        cell.pokemonGenera.text = pokemon[indexPath.row].genera.zh
        

        // 說明的 Label 設定
        
        let entriesCount = pokemon[indexPath.row].entries.zh.count
        var indexEntriesRow = ""
        for j in 0...entriesCount-1{
            
           indexEntriesRow += pokemon[indexPath.row].entries.zh[j]
        }
        
        cell.pokemonInfo.text! = indexEntriesRow
        
        
        
        return cell
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "神奇寶貝圖鑑"
    }

    
}
