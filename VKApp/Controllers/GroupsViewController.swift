//
//  GroupsViewController.swift
//  VKApp
//
//  Created by Олеся Бабич on 29.11.22..
//

import UIKit
import SDWebImage

class GroupsViewController: UITableViewController {
    let session = Session.sharedInstance
    let service = Service()
    var myGroups = [MyGroup]()


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Группы"
        
        service.getGroups(token: session.token) { groups in
            self.myGroups = groups

            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! GroupsCell

        let group = myGroups[indexPath.row]
        cell.groupNameLabel.text = group.name
        
        if let photo = group.photoGroup {
            cell.groupImageView?.sd_setImage(with: URL(string: photo))
        }
        
        cell.groupImageView.contentMode = .scaleAspectFill
        
        return cell

    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? OtherGroupsViewController,
           let indexPaht = sourceVC.tableView.indexPathForSelectedRow {
            let group = sourceVC.otherGroups[indexPaht.row]
            
            if !myGroups.contains(where: {$0.name == group.name}) {
                myGroups.append(group)
                
                tableView.reloadData()
                
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

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
