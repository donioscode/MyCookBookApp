//
//  DetailRecipeViewController.swift
//  MyCookBookApp
//
//  Created by doniyor normuxammedov on 07/09/24.
//

import UIKit

class DetailRecipeViewController: UIViewController {

    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    
    @IBOutlet weak var mealTime: UILabel!
    @IBOutlet weak var segmentCont: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var servingsCount: UILabel!
    @IBOutlet weak var mealKcal: UILabel!
    

    var recipes: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        backBtn.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)

            heartBtn.layer.cornerRadius = 25
            backBtn.layer.cornerRadius = 25
            mealImage.roundBottomCorners(radius: 50)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.register(UINib(nibName: "IngredientTableViewCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
        self.tableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
        
        segmentCont.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmentCont.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        self.segmentCont.layer.cornerRadius = 20.0;
        self.segmentCont.layer.masksToBounds = true
        self.segmentCont.selectedSegmentIndex = 0 // Default selection
        self.segmentCont.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        self.teskor()
//
        // Do any additional setup after loading the view.
    }
    
    func teskor(){
        if let recipe = recipes {
            mealImage.image = recipe.image
            mealName.text = recipe.name
            servingsCount.text = String("\(recipe.ingredients.count)")
            mealTime.text = String("\(recipe.cookingTime) min")
            mealKcal.text = String("\(recipe.kcal) kcal")
        }else {
            fatalError("Optinal nil")
        }
    }
    
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        tableView.reloadData() // Reload the table to reflect the selected segment
    }
    
    @objc func didTapBackButton() {
        // Action to perform when back button is tapped
        navigationController?.popViewController(animated: true) // Pops to the previous view controller
    }
  

}

//MARK: mealImage only bottom cornerRadius
extension UIImageView {
    func roundBottomCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


// MARK: UITableViewDataSource

extension DetailRecipeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentCont.selectedSegmentIndex == 0 {
            // Number of ingredients
            return recipes?.ingredients.count ?? 0
        } else {
            // Number of recipes
            return recipes?.steps.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentCont.selectedSegmentIndex == 0 {
            // Show ingredient cell (FirstCell)
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientTableViewCell
            // Configure the IngredientCell for ingredient
            cell.ingredientImage.image = recipes?.ingredients[indexPath.row].image
            cell.IngName.text = recipes?.ingredients[indexPath.row].name
            cell.IngCount.text = recipes?.ingredients[indexPath.row].quantity
            return cell
            
        } else {
            // Show recipe cell (SecondCell)
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeTableViewCell
            // Configure the RecipeCell for recipe
            cell.RecNumber.text = String(" Step \(recipes?.steps[indexPath.row].number ?? 0)")
            cell.RecDescription.text = recipes?.steps[indexPath.row].description
            return cell
        }
    }
   
}

extension DetailRecipeViewController: UITableViewDelegate {
    
}
