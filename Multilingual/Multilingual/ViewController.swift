//
//  ViewController.swift
//  Multilingual
//
//  Created by Macbook on 01/08/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wlcLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        wlcLabel.text = NSLocalizedString("wlc", comment:"Welcome Message")
        nameLabel.text = NSLocalizedString("mahmoud", comment: "Name")
        changeButton.setTitle(NSLocalizedString("changeLangauge", comment: "Change Language string"), for: UIControl.State.normal)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
}

