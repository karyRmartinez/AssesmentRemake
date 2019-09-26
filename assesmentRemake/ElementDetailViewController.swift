//
//  ElementDetailViewController.swift
//  assesmentRemake
//
//  Created by Kary Martinez on 9/23/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class ElementDetailViewController: UIViewController {
    
    var element: Element!
    
    @IBOutlet weak var elementlargeImage: UIImageView!
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    
    
    
    @IBAction func Button(_ sender: Any) {
        let favorite = Favorite(elementName: element.name, elementSymbol: element.symbol, favoritedBy: "karys")
        
        FavoritesAPIClient.manager.postfavElement(element: favorite) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.showFavoriteAlert()
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    func loadImage(){
        ImageHelper.shared.getImage(urlStr: element.largeImageURL ) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let imageFromOnline):
                    self.elementlargeImage.image = imageFromOnline
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    func showFavoriteAlert(){
        let alertPopup = UIAlertController(title: "Successful", message: "yeeeea u fav sumting!!", preferredStyle: .alert) //Makes a new alert popup.
        
        alertPopup.addAction(UIAlertAction(title: "well doned", style: .default, handler: nil)) //This is what controls the text of the button. Style can pretty much always be .default and handler as .nil
        
        self.present(alertPopup, animated: true, completion: nil) //The alert made needs to actually be used. This is the method to use it.
        
    }
    
    private func setLabels(){
        labelOne.text = element.name
        labelTwo.text = "Atomic Mass: \(element.atomicMass)"
        
        if let melt = element.meltingPoint {
            labelFour.text = "Melting Point: \(melt)"
        } else {
            labelFour.text = "melting point data not found"
            //If the property is not a nil, we save it to a new property that we just made and named whatever.
        }
        if let boil = element.boilingPoint {
            labelThree.text =
            "Boiling Point: \(boil)"
        }else {
            labelThree.text = "boiling point data not found"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        setLabels()
     
        
    }
}
