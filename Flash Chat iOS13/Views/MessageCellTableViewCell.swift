//
//  MessageCellTableViewCell.swift
//  Flash Chat iOS13
//
//  Created by Macbook on 12/07/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class MessageCellTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var yourAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //view.addBottomRoundedEdge(desiredCurve:5.0)
        view.layer.cornerRadius = view.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
