//
//  DetailsViewController.swift
//  KarakterKitabi
//
//  Created by Feyzullah Durası on 20.04.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var selectedHeroName = ""
    var selectedHeroImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: selectedHeroImage)
        label.text = selectedHeroName
    }

}
