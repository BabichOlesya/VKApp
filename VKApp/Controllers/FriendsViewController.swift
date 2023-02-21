//
//  FriendsViewController.swift
//  VKApp
//
//  Created by Олеся Бабич on 16.11.22..
//

import UIKit
import SDWebImage
import RealmSwift

class FriendsViewController: UITableViewController {

    let session = Session.sharedInstance
    let service = Service()
    var userFriends = [User]()
    let realm = try! Realm()
    

    var sortedFriends = [Character: [User]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Друзья"

//        service.getFriends(token: session.token) { [self] users in
//            self.userFriends = users
//        
//            self.sortedFriends = self.sort(userFriends: userFriends)
//
//            self.tableView.reloadData()
//            
//        }
        
        func getFriends() {
            let friends = realm.objects(User.self)
            self.userFriends = Array(friends)
            self.sortedFriends = self.sort(userFriends: userFriends)
            self.tableView.reloadData()
        }
    }



    private func sort(userFriends: [User]) -> [Character: [User]] {
        var friendsDict = [Character: [User]]()
        userFriends.forEach() { friend in
            guard let firstChar = friend.lastName.first else {return}
            if var thisCharMyFriends = friendsDict[firstChar] {
                thisCharMyFriends.append(friend)
                friendsDict[firstChar] = thisCharMyFriends
            } else {
                friendsDict[firstChar] = [friend]
            }
        }

        return friendsDict
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keySorted = sortedFriends.keys.sorted()
        let friends = sortedFriends[keySorted[section]]?.count ?? 0

        return friends
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell

        let firstChar = sortedFriends.keys.sorted()[indexPath.section]
        let friends = sortedFriends[firstChar]!
        let friend = friends[indexPath.row]

        cell.userNameLabel.text = friend.lastName + " " + friend.firstName

        if let photo = friend.photoUser {
            cell.userImageView?.sd_setImage(with: URL(string: photo))
        }

        cell.userImageView.contentMode = .scaleAspectFill

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedFriends.keys.sorted()[section])
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueUserFriends",
           let destination = segue.destination as? FriendPhotoViewController,
           let indexPath = tableView.indexPathForSelectedRow {

            destination.ownerId = userFriends[indexPath.row].id
        }
    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "segueUserFriends", sender: indexPath)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueUserFriends",
//           let indexPath = sender as? IndexPath,
//           let controller = segue.destination as? FriendPhotoViewController {
//            controller.ownerId = userFriends[indexPath.row].id
//        }
//    }

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
