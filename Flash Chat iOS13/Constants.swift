//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Macbook on 12/07/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCellTableViewCell"
    static let registerSegue = "registerToChat"
    static let loginSegue = "loginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
