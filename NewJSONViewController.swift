//
//  NewJSONViewController.swift
//  JSONTest
//
//  Created by 沈庭鋒 on 2023/4/18.
//

import UIKit
import Kingfisher
import SDWebImage

class NewJSONViewController: UIViewController {

    @IBOutlet weak var NewJSONTableView: UITableView!
    let urlString = "https://api.themoviedb.org/3/trending/movie/day?api_key=1ae4669859f2f194f5543ecb3a3153cb"
    
    var moviesResult = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewJSONTableView.delegate = self
        NewJSONTableView.dataSource = self
        fetch()
    }
    
    func fetch(){
        if let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data,
                   let content = String(data: data, encoding: .utf8){
                    do{
                        let result = try JSONDecoder().decode(Movies.self, from: data)
                        DispatchQueue.main.async {
                            self.NewJSONTableView.reloadData()
                        }
                        self.moviesResult = result.results
                        print(content)
                    }catch{
                        print(error)
                    }
                }
            }.resume()
        }
    }
    

}

extension NewJSONViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewJSONTableView.dequeueReusableCell(withIdentifier: "JSONTableViewCell", for: indexPath) as! JSONTableViewCell
        
        cell.movieName.text = moviesResult[indexPath.row].release_date
        cell.movieInfo.text = moviesResult[indexPath.row].overview
        
//        let postURL = URL(string: "https://image.tmdb.org/t/p/w500\(moviesResult[indexPath.row].poster_path)")
//        let movieImage = moviesResult[indexPath.row].poster_pathURL
        cell.movieImageView.sd_setImage(with: moviesResult[indexPath.row].posterURL)
        
        
        
        return cell
    }
    
}
