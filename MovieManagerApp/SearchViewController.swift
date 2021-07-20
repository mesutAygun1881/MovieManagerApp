//
//  MovieViewController.swift
//  MovieManagerApp
//
//  Created by Mesut Aygün on 20.07.2021.
//

import UIKit

class SearchViewController: UIViewController {
var apiService = ApiService()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        apiService.getPopularMoviesData { (result) in
            print(result)
        }
        
    }
    

}
