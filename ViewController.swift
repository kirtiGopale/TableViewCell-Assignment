//
//  ViewController.swift
//  Ios-Assignment-7-10-26
//
//  Created by Apple on 07/10/26.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var students1 = ["Rahul", "Amit", "Sneha", "Priya"]
    var students2 =  ["Rohan", "Neha", "Akshay", "Pooja"]
    var students3 = ["Aditya", "Kiran", "Sakshi", "Om"]
   
    var colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemGreen,
        .systemOrange,
        .systemPurple,
        .systemPink,
        .systemTeal,
        .systemYellow,
        .systemIndigo,
        .systemMint,
        .systemCyan,
        .systemBrown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    func initViews(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Batch A"
        }else if section == 1{
            return "Batch B"
        }else{
            return "Batch c"
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return students1.count
        } else if section == 1 {
            return students2.count
        } else {
            return students3.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basicCell = self.tableView.dequeueReusableCell(withIdentifier: "Basic Cell")
        
        if (indexPath.section == 0){
            basicCell?.textLabel?.text = students1[indexPath.row]
            basicCell?.backgroundColor = colors[indexPath.row]
            return basicCell ?? UITableViewCell()
        } else if (indexPath.section == 1){
            basicCell?.textLabel?.text = students2[indexPath.row]
            basicCell?.backgroundColor = colors[4 + indexPath.row]
            return basicCell ?? UITableViewCell()
        }else{
            basicCell?.textLabel?.text = students3[indexPath.row]
            basicCell?.backgroundColor = colors[8 + indexPath.row]
            return basicCell ?? UITableViewCell()
        }
    }
  
    // MARK: - Swipe Delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction( style: .destructive, title: "Delete" ) {
            
            [weak self] _, _, completionHandler in
            guard let self = self else {
                completionHandler(false)
                return
                
            }
            if indexPath.section == 0 {
                self.students1.remove(at: indexPath.row)
                
            } else if indexPath.section == 1 {
                self.students2.remove(at: indexPath.row)
                
            } else {
                self.students3.remove(at: indexPath.row)
                
            }
            tableView.deleteRows( at: [indexPath], with: .automatic )
              completionHandler(true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
}

