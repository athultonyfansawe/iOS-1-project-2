//
//  SearchedWeatherViewController.swift
//  Project 2 ios-1
//
//  Created by Andrew Ananda on 30/11/2023.
//

import UIKit

class SearchedWeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //Mark: properties
    private var searchedArr: [WeatherResponse] = []
    private var isCelsius: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search History"
        
        setupTableView()
    }
    
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "WeatherDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchHistoryCell")
        tableView.reloadData()
    }
    
    public func setupData(items: [WeatherResponse], isCelsius: Bool) {
        searchedArr.removeAll()
        if items.count > 0 {
            searchedArr.append(contentsOf: items)
            self.isCelsius = isCelsius
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchHistoryCell", for: indexPath) as! WeatherDetailTableViewCell
        cell.setUpCell(item: searchedArr[indexPath.row], isCelsius: isCelsius)
        return cell
    }
    

}
