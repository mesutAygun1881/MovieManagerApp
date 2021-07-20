//
//  WatchTableViewCell.swift
//  MovieManagerApp
//
//  Created by Mesut Aygün on 20.07.2021.
//

import UIKit

class WatchTableViewCell: UITableViewCell {
    private var urlString : String = ""
    
    @IBOutlet weak var imageWatch: UIImageView!
    
    @IBOutlet weak var labelWatch: UILabel!
    func setCellWithValuesOf ( movie: Movie) {
           
        updateUI(title: movie.title , poster : movie.posterImage)
       }
       
    private func updateUI(title: String? , poster : String?) {
           
       
           self.labelWatch.text = title
        
        guard let posterString = poster else {return}
               urlString = "https://image.tmdb.org/t/p/w300" + posterString
                
                guard let posterImageUrl  = URL(string: urlString) else {
                    self.imageWatch.image = UIImage ( named: "no_image")
                    return
                }
                self.imageWatch.image = nil
                getImageDataFrom(url: posterImageUrl)
       }
    func getImageDataFrom(url : URL) {
           URLSession.shared.dataTask(with: url) { (data , response , error) in
               if let error = error {
                   
                   print("DataTask error : \(error.localizedDescription)")
                   return
               }
               
               guard let data = data  else {
                   print("Empty Response")
                   return
               }
               
               DispatchQueue.main.async {
                   if let image = UIImage(data: data) {
                       self.imageWatch.image = image
                   }
               }
           
           }.resume()
           
       }
}
