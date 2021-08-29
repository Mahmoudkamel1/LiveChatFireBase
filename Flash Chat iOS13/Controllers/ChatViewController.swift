//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var messages : [Message] = [
        Message(sender: "1_3@gmail.com",body: "hey"),
        Message(sender: "1_2@gmail.com",body: "Hello"),
        Message(sender: "1_2@gmail.com",body: "how are you doing bud how are you doing bud how are you doing bud how are you doing bud how are you doing bud how are you doing bud vhow are you  bud how are you doing bud how are you doing bud how are you doing bud how are you doing bud how are you doing bud vhow are you  bud how are you doing bud how are you doing bud how are you doing bud how are you doing bud how are you doing bud vhow are you doing bud"),
        Message(sender: "1_3@gmail.com",body: "how are you doing bud")
    ]
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationItem.title = "⚡️FlashChat"
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nibBundle), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
        //tableView.beginUpdates()

    }
    func loadMessages(){
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener{
            (data,error) in
            if let e = error{
                print(e.localizedDescription)
            }
            self.messages = []
            if let rows = data?.documents{
                for row in rows{
                    if let sender = row.data()[K.FStore.senderField] as? String, let body = row.data()[K.FStore.bodyField] as? String
                    {
                        self.messages.append(Message(sender: sender, body: body))
                    }
                    
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                }
                
            }
        }
    }
    @IBAction func logoutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton){
        
        //self.messageTextfield.endEditing(true)
        if let messageBody = messageTextfield.text , let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender,
                                                                      K.FStore.bodyField: messageBody,
                                                                      K.FStore.dateField: Date().timeIntervalSince1970]){
                (error) in
                if error != nil{
                    
                    print(error!.localizedDescription)
                }else{
                    self.messageTextfield.text = ""
                }
            }
        }
    }
}
