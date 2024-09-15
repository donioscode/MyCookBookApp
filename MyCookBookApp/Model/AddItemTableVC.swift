//
//  AddItemTableVC.swift
//  MyCookBookApp
//
//  Created by doniyor normuxammedov on 10/09/24.
//

import UIKit

class AddItemTableVC: UITableViewController {

    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    // Array of header titles for different sections
       let headerTitles = ["Header 1", "Header 2", "Header 3", "Header 4","Header 5"]

       override func numberOfSections(in tableView: UITableView) -> Int {
           return headerTitles.count // Number of sections based on header titles
       }

       override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return headerTitles[section] // Return the corresponding header title for the section
       }

       override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
           guard let headerView = view as? UITableViewHeaderFooterView else { return }

           // Customize header appearance based on the section
           switch section {
           case 0:
               headerView.textLabel?.textColor = UIColor.red
               headerView.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
           case 1:
               headerView.textLabel?.textColor = UIColor.blue
               headerView.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
           case 2:
               headerView.textLabel?.textColor = UIColor.green
               headerView.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
           case 3:
               headerView.textLabel?.textColor = UIColor.purple
               headerView.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
           default:
               headerView.textLabel?.textColor = UIColor.black
               headerView.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           }
       }

       override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40 // Set the height for each header
       }
 

  

}


