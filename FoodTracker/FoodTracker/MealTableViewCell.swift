//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Fiori III, Anthony J on 2/15/17.
//  Copyright © 2017 Fiori III, Anthony J. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
