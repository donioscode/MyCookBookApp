//
//  IngredientTableViewCell.swift
//  MyCookBookApp
//
//  Created by doniyor normuxammedov on 08/09/24.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ingredientImage: UIImageView!
    @IBOutlet weak var IngName: UILabel!
    @IBOutlet weak var IngCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ingredientImage.layer.cornerRadius = 20
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
