//
//  ChatScreenExtensions.swift
//  Flash Chat iOS13
//
//  Created by Macbook on 12/07/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

extension ChatViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell",for: indexPath) as! MessageCellTableViewCell
        cell.bodyLabel?.text = messages[indexPath.row].body
        if let userEmail = Auth.auth().currentUser?.email {
            if userEmail == messages[indexPath.row].sender{
                cell.avatarImage.isHidden = false
                cell.yourAvatar.isHidden = true
                cell.view.backgroundColor = .red
                cell.bodyLabel.textColor = .white
            }
            else{
                cell.avatarImage.isHidden = true
                cell.yourAvatar.isHidden = false
                cell.view.backgroundColor = .blue
                cell.bodyLabel.textColor = .red
                
            }
        }
        return cell
    }
}
extension ChatViewController : UITableViewDelegate{
    
}

