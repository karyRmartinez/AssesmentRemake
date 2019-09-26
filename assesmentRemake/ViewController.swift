//
//  ViewController.swift
//  assesmentRemake
//
//  Created by Kary Martinez on 9/22/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ElementsTableView: UITableView!
    
    var elements = [Element]() {
    
        didSet {
            ElementsTableView.reloadData()
        }
    }
    
    
    private func loadData() {
        ElementsAPIManager.shared.getElements{ (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let elementsFromOnline):
                    self.elements = elementsFromOnline
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ElementsTableView.delegate = self
        ElementsTableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueIdentifer = segue.identifier else {fatalError("No indentifier in segue")}
        
        switch segueIdentifer {
            
        case "elementCell":
            guard let destVC = segue.destination as? ElementDetailViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = ElementsTableView.indexPathForSelectedRow else {fatalError("No row selected")
            }
            let currentElement = elements[selectedIndexPath.row]
            destVC.element = currentElement
            
            
        default:
            fatalError("unexpected segue identifies")
            
        }
    }
    

    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ElementsTableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as! ElementsTableViewCell
        let currentElement = elements[indexPath.row]
        cell.nameLabel.text = currentElement.name
        
        
        
        ImageHelper.shared.getImage(urlStr: currentElement.thumbnailImageURL) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    cell.elementImage.image = image
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 130
    }
    
}
