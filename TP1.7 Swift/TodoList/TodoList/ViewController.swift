//
//  ViewController.swift
//  TodoList
//
//  Created by Anisse Outssakki on 09/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell
              
        cell.myLabel.text = filteredData[indexPath.row].nom
        
        let row = indexPath.row
        
        if filteredData[row].state {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        else{
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        return cell
    }
    
    var myData = [MyTodo]()
    var filteredData: [MyTodo]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...5{
            let nom  = "Tache " + String(i)
            let desc = "Description " + String(i)
            let state = true
            let date = Date()
            let priority = "Faible"
            let tache = MyTodo(nom: nom, desc: desc, state: state, myDate: date, priorite: priority)
            myData.append(tache)
        }
        
        filteredData = myData
               
        myTableView.dataSource = self
        myTableView.delegate = self
        searchBar.delegate = self
        
    }

    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController{
            let row = myTableView.indexPathForSelectedRow!.row
            vc.myData = filteredData[row]
        }
        
    }

    @IBAction func save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddViewController {
            print("test")
            if let updatedTask = vc.myData {
                
                let newTask = MyTodo(nom: updatedTask.nom, desc: updatedTask.desc, state:false, myDate: updatedTask.myDate, priorite: updatedTask.priorite)
                myData.append(newTask)
                myTableView.reloadData()
                
                filteredData = myData
                print("save")
            }
            else{
                print("erreur")
            }
        }
        //let sourceViewController = unwindSegue.source
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let config = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.filteredData.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
        })
        ])
        return config
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == ""
        {
            filteredData = myData
        }
        
        for word in myData
        {
            if word.nom.uppercased().contains(searchText.uppercased())
            {
                filteredData.append(word)
            }
        }
        
        self.myTableView.reloadData()
    }
    
}
