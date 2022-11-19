//
//  EmployeeListViewController.swift
//  SoftwareCo
//
//  Created by Cumali Atalan on 18.11.2022.
//

import UIKit

class EmployeeListViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var employeeList: [EmployeeModel] = []
    var employees : [EmployeeModel] = []
    
    @IBOutlet weak var searcBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        employees = employeeList
        
        let searchBar = UISearchController(searchResultsController: nil)
        searchBar.searchBar.placeholder = "Type something to search"
        navigationItem.searchController = searchBar
    }
}

extension EmployeeListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        employeeList = employees.filter({ $0.name == text })
        if text == "" {
            employeeList = employees
        }
        tableView.reloadData()
    }
}

extension EmployeeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell pressed")
    }
}

extension EmployeeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employeeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.nameLabel.text = employeeList[indexPath.row].name
        cell.salaryLabel.text = String(employeeList[indexPath.row].salaryBase)
        return cell
    }
}
