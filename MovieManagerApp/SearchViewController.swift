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
    private var viewModel = MovieViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        apiService.getPopularMoviesData { (result) in
            print(result)
            
            loadPopularMoviesData()
        }
         func loadPopularMoviesData() {
             
             
             viewModel.fetchPopularMoviesData {
                 [weak self] in
                 
                 self?.tableView.dataSource = self
                 self?.tableView.reloadData()
             }
         }
        
    }
    

}

extension SearchViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section : section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! MovieTableViewCell
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie: movie)
        return cell
    }
}
