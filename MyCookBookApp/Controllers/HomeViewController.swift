//
//  HomeViewController.swift
//  MyCookBookApp
//
//  Created by doniyor normuxammedov on 17/08/24.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    
    
    
    // MARK: Varibalies
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var segment = UISegmentedControl()
    
    var recipe: [Recipe] = [
    Recipe(name: "Osh",
           description: "Beshqozon oshi juda mazali",
           ingredients: [
            Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!),
            Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!),
            ],
           steps: [Step(number: 1, description: "suv sol")],
           cookingTime: 30,
           category: 0,
           image: UIImage(named: "chicken")!,
           kcal: 1000),
    Recipe(name: "Kebab",
           description: "Beshqozon oshi juda mazali",
           ingredients: [Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!)],
           steps: [Step(number: 1, description: "suv sol")],
           cookingTime: 25,
           category: 0,
           image: UIImage(named: "kebab")!,
           kcal: 500),
    
    Recipe(name: "Kebab",
           description: "Beshqozon oshi juda mazali",
           ingredients: [Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!)],
           steps: [Step(number: 1, description: "suv sol")],
           cookingTime: 25,
           category: 0,
           image: UIImage(named: "kebab")!,
           kcal: 500),
    Recipe(name: "Kebab",
           description: "Beshqozon oshi juda mazali",
           ingredients: [Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!)],
           steps: [Step(number: 1, description: "suv sol")],
           cookingTime: 25,
           category: 0,
           image: UIImage(named: "kebab")!,
           kcal: 500),
    ]
    
  // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        navigationItem.title = "Recipe App"
        
        segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        //MARK: - Added HomeCollectionViewCell with XIB file
        self.CollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        
    }
    
    @IBAction func categoryChanged(_ sender: UISegmentedControl) {
    
    }
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipe.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? HomeCollectionViewCell else {
            fatalError("Cell not found")
        }
            let recipes = recipe[indexPath.row]
            cell.mealImageView.image = recipes.image
            cell.mealTitle.text = recipes.name
            cell.mealTime.text = String("\(recipes.cookingTime) min")
            return cell
    }
}


// MARK: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    // Control the spacing between rows (vertical spacing)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust this value to your preference
    }
    
    // Control the spacing between items in the same row (horizontal spacing)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust this value to your preference
    }
    
    // Control the padding around the section (top, left, bottom, right)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Adjust as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        if let detailVC = storyboard?.instantiateViewController(identifier: "DetailRecipeViewController")as? DetailRecipeViewController {
            let selectedRecipe = recipe[indexPath.row] // Tanlangan retseptni oling
            detailVC.recipes = selectedRecipe
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}



//MARK: UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
              let padding: CGFloat = 15
              let collectionViewWidth = collectionView.frame.width
              let cellWidth = (collectionViewWidth / 2) - padding
              let cellHeight: CGFloat = 220 // Adjust height as per your needs
              return CGSize(width: cellWidth, height: cellHeight)
    }
}

