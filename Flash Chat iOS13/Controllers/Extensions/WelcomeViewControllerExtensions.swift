//
//  WelcomeViewControllerExtensions.swift
//  Flash Chat iOS13
//
//  Created by Macbook on 10/07/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

extension String{
    func charAt(_ index: Int) -> Character{
        let char = self[self.index(self.startIndex, offsetBy: index)]
        return char
    }
}
