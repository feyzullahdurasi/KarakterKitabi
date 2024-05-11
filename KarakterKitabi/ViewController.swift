//
//  ViewController.swift
//  KarakterKitabi
//
//  Created by Feyzullah Durası on 18.04.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroNames[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var TableView: UITableView!
    var superHeroNames = [String]()
    var superHeroImages = [String]()
    var selectedName = ""
    var selectedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableView.delegate = self
        TableView.dataSource = self
        
        superHeroNames.append("Batman")
        superHeroNames.append("Superman")
        superHeroNames.append("Spiderman")
        superHeroNames.append("Hulk")
        superHeroNames.append("Iron Man")
        
        superHeroImages.append("batman")
        superHeroImages.append("superman")
        superHeroImages.append("Sp")
        superHeroImages.append("hulk")
        superHeroImages.append("ironman")
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHeroNames.remove(at: indexPath.row)
            superHeroImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = superHeroNames[indexPath.row]
        selectedImage = superHeroImages[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedHeroName = selectedName
            destinationVC.selectedHeroImage = selectedImage
        }
    }
}

