//
//  SearchCityTableViewController.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 17/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit


class SearchCityTableViewController: UIViewController {
    var listCommunityAndCities = [CommunityAndCities]()
   
    @IBOutlet weak var searchCities: UISearchBar!
    @IBOutlet weak var tvCities: UITableView!
    var searchCityOrCommunity = [CommunityAndCities]()
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if listCommunityAndCities.count == 0{
            getCities().readJsonHttp { (success, list) in
                
                if success {
                    self.listCommunityAndCities = list
                    DispatchQueue.main.async {
                        self.tvCities.reloadData()

                    }
                }
        }
    }
    }
    

}

extension SearchCityTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searching {
            performSegue(withIdentifier: "detail", sender: searchCityOrCommunity[indexPath.row])
        }
        else{
            performSegue(withIdentifier: "detail", sender: listCommunityAndCities[indexPath.row])
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
           return  searchCityOrCommunity.count
        }
        else{
            return listCommunityAndCities.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCities")
        
        if searching {
            cell?.textLabel?.text = searchCityOrCommunity[indexPath.row].getName()
        }
        else{
            cell?.textLabel?.text = listCommunityAndCities[indexPath.row].getName()
        }
                return cell!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let place = sender as? CommunityAndCities
        MoreAboutCityViewController.place = place
    }
}
extension SearchCityTableViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCityOrCommunity = listCommunityAndCities.filter({$0.getName().prefix(searchText.count) == searchText})
        searching = true
        tvCities.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tvCities.reloadData()
    }
}
