//
//  HomeCollectionViewCell.swift
//  MyCookBookApp
//
//  Created by doniyor normuxammedov on 04/09/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    
    //MARK: - Varibleis
    
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    @IBOutlet weak var mealTitle: UILabel!
    
    @IBOutlet weak var mealTime: UILabel!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    // MARK: - awakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mainView.layer.cornerRadius = 15
        self.mealImageView.layer.cornerRadius = 15
        self.likeBtn.layer.cornerRadius = 20
       
    }
  
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }
    


}
