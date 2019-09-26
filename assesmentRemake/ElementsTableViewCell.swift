//
//  ElementsTableViewCell.swift
//  assesmentRemake
//
//  Created by Kary Martinez on 9/22/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class ElementsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var egLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
