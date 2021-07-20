//
//  MovieViewController.swift
//  MovieManagerApp
//
//  Created by Mesut Aygün on 20.07.2021.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    //searchBar
    var dataArray = [String]()
    var filteredArray = [String]()
    var shouldShowSearchResults = false
    var searchController = UISearchController()
    //apicall
    var apiService = ApiService()
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = MovieViewModel()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: "arrowshape.turn.up.backward"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        title = "Search"
        //api test
        apiService.getPopularMoviesData { (result) in
            print(result)
            self.configureSearchController()
            loadPopularMoviesData()
        }
        //tableview guncelleme
         func loadPopularMoviesData() {
             viewModel.fetchPopularMoviesData {
                 [weak self] in
                 
                 self?.tableView.dataSource = self
                 self?.tableView.reloadData()
             }
         }
        
    }
    
    //searchbar ayarlari
    func configureSearchController() {
            searchController = UISearchController(searchResultsController: nil)
            searchController.dimsBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Search here..."
            searchController.searchBar.delegate = self
            searchController.searchResultsUpdater = self
            searchController.searchBar.sizeToFit()
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text

                filteredArray = dataArray.filter({ (country) -> Bool in
                            let countryText: NSString = country as NSString
                            return (countryText.range(of: searchString!, options: .caseInsensitive).location) != NSNotFound
    })
    

}
}
                                                 

extension SearchViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults{
            return filteredArray.count
        }else{
        return viewModel.numberOfRowsInSection(section : section)
        }
    }
    
    //tableview and searchBar
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! MovieTableViewCell
        if shouldShowSearchResults {
            cell.titleLabel.text = filteredArray[indexPath.row]
        }else{
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie: movie)
        }
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        
    }
    }



