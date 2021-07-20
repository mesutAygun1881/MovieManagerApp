//
//  WatchViewController.swift
//  MovieManagerApp
//
//  Created by Mesut Aygün on 20.07.2021.
//

import UIKit

class WatchViewController: UIViewController {

    @IBOutlet weak var tableVieww: UITableView!
   var viewModels = MovieViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPopularMoviesData()
    }
     func loadPopularMoviesData() {
         
         
         viewModels.fetchPopularMoviesData {
             [weak self] in
             
             self?.tableVieww.dataSource = self
             self?.tableVieww.reloadData()
         }
     }
    
     
    }
extension WatchViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.numberOfRowsInSection(section : section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cello", for: indexPath) as! WatchTableViewCell
        let movie = viewModels.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie: movie)
        return cell
    }
    
   
    
    
    
    }
    



