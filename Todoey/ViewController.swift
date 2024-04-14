//
//  ViewController.swift
//  Todoey
//
//  Created by olivier geiger on 14/04/2024.
//

import UIKit
import SnapKit

class ViewController: UITableViewController {
    
    let reuseID = "CELL_ID"
    let itemArray = ["Find Mike", "Buy eggs", "Destory Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupTableView()
        title = "Todoey"
    }
    
}

// MARK: - Helpers
extension ViewController {
    
    private func layout() {
        view.backgroundColor = .systemBackground
        title = "Todoey"
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseID)
        tableView.rowHeight = 60
        self.tableView = tableView
    }
}

// MARK: - DataSource and Delegate
extension ViewController {
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.accessoryType = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
