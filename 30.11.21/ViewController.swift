//
//  ViewController.swift
//  30.11.21
//
//  Created by APPLE on 30.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    


    var table = UITableView()
    let identifire = "identifire"
    let search = UISearchController(searchResultsController: nil)
    
    var arrayWorker: [Worker] = [Worker(name: "Anna", statusWorker: "junior"), Worker(name: "Anatolii", statusWorker: "master"), Worker(name: "Pavel", statusWorker: "junior"), Worker(name: "Sergei", statusWorker: "master"), Worker(name: "Slava", statusWorker: "midlle"), Worker(name: "Yaroslav", statusWorker: "junior")]
    
    
    var filterArrayWorker : [Worker] = []
    var searchBarisEmpty: Bool {
         guard let text =  search.searchBar.text
         else {return false }
        return text.isEmpty}
    
    var isFitering : Bool {
        if filterArrayWorker.isEmpty{
            return false }
        else { return true }
        
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Работники"
        createTable()
        createSearch()
        createButtonBar()
        }
    
    func createTable() {
        table = UITableView(frame: view.bounds, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        table.dataSource = self
        table.delegate = self
        view.addSubview(table)
    }
    
    func createSearch() {
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = search
    }
    
    func createButtonBar() {
        let buttonBar = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarItem))
        navigationItem.leftBarButtonItem = buttonBar
    }
    
   @objc func addBarItem () {
    let secondVC = SecondViewController()
    navigationController?.pushViewController(secondVC, animated: true)
    secondVC.delegate1 = self
    
    }
}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFitering {
            return filterArrayWorker.count
        }
        
            return arrayWorker.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifire)
        var worker1 : Worker
            if isFitering {
                worker1 = filterArrayWorker [indexPath.row]            }
        else {
            worker1 = arrayWorker [indexPath.row]
        }
        
        
        
        cell.textLabel?.text = worker1.name
        cell.detailTextLabel?.text = worker1.statusWorker
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let firstVC = FirstViewController()
        navigationController?.pushViewController(firstVC, animated: true)
        firstVC.work = arrayWorker [indexPath.row]
        
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        sortedArrayWorker(search.searchBar.text!)
    }
    
    func sortedArrayWorker (_ searchText: String) {
        filterArrayWorker = arrayWorker.filter({( i: Worker) in
            i.name.lowercased().contains(searchText.lowercased())
        })
        table.reloadData()
    }
    
}

extension ViewController: Delegate {
    func appendArrayWorker(parametr1: String, parametr2: String) {
        arrayWorker.append(Worker(name: parametr1, statusWorker: parametr2))
        table.reloadData()
        print("2")

        
    }
    
    
}
