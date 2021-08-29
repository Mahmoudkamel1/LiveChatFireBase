//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
//import CLTypingLabel
class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    let welcomeText = "⚡️FlashChat"
    var counter: Int = 0
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // titleLabel.charInterval = 0.8
        //titleLabel.text = "FlashChat xmcdlcm"
        titleLabel.text = ""
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: checkIfAnimationShouldContinue()){
            (timer) in
            if self.checkIfAnimationShouldContinue(){
                self.titleLabel.text?.append(self.welcomeText.charAt(self.counter))
                self.counter = self.counter + 1
            }

        }
    }
    func checkIfAnimationShouldContinue() -> Bool {
        if counter < welcomeText.count
        {
            return true
        }
        else{
            return false
        }
    }

}
