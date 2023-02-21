//
//  OtherGroupsViewController.swift
//  VKApp
//
//  Created by Олеся Бабич on 29.11.22..
//

import UIKit

class OtherGroupsViewController: UITableViewController {
    let session = Session.sharedInstance
    let service = Service()
    var otherGroups = [MyGroup]()
    
    var filtredGroups = [MyGroup]()
    var searchBar  = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        filtredGroups = otherGroups
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtredGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherGroupsCell", for: indexPath) as! OtherGroupsCell
        
        let group = filtredGroups[indexPath.row]
        cell.groupNameLabel.text = group.name
        
        if let photo = group.photoGroup {
            cell.groupImageView?.sd_setImage(with: URL(string: photo))
        }
        
        cell.groupImageView.contentMode = .scaleAspectFill
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return searchBar
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OtherGroupsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        service.getGroupsBySearch(token: session.token, q: searchText) { [self] groups in
            self.otherGroups = groups
            
            self.tableView.reloadData()
            
            if searchText.isEmpty {
                filtredGroups = otherGroups
                tableView.reloadData()
            } else {
                
                
                func filterTableView(text: String) {
                    let search = text.lowercased()
                    filtredGroups = otherGroups.filter({ (mod) -> Bool in
                        return mod.name.lowercased().contains(search)
                    })
                    self.tableView.reloadData()
                }
                
                filterTableView(text: searchText)
            }
        }
        
    }
    
}



