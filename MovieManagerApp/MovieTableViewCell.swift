//
//  MovieTableViewCell.swift
//  MovieManagerApp
//
//  Created by Mesut Aygün on 20.07.2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    private var urlString : String = ""
    func setCellWithValuesOf ( movie: Movie) {
           
           updateUI(title: movie.title)
       }
       
       private func updateUI(title: String? ) {
           
       
           self.titleLabel.text = title
       }
}
