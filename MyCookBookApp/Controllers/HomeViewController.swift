//
//  HomeViewController.swift
//  MyCookBookApp
//
//  Created by doniyor normuxammedov on 17/08/24.
//

import UIKit

class HomeViewController: UIViewController {

// MARK: Varibalies
    
    @IBOutlet weak var searchBarSearch: UISearchBar!
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var recipe: [Recipe] = [
    Recipe(name: "Creamy shrimp spaghetti",
           description: "Beshqozon oshi juda mazali",
           ingredients: [
            Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!),
            Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!),
            ],
           steps: [Step(number: 1, description: "suv sol")],
           cookingTime: 30,
           category: "Breakfast",
           image: UIImage(named: "chicken")!,
           kcal: 1000),
    Recipe(name: "Kebab",
           description: "Beshqozon oshi juda mazali",
           ingredients: [Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!)],
           steps: [Step(number: 1, description: "suv sol")],
           cookingTime: 25,
           category: "Dinner",
           image: UIImage(named: "kebab")!,
           kcal: 500),
    
    Recipe(name: "Kebab",
           description: "Beshqozon oshi juda mazali",
           ingredients: [Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!)],
           steps: [Step(number: 1, description: "suv sol")],
           cookingTime: 25,
           category: "Lunch",
           image: UIImage(named: "kebab")!,
           kcal: 500),
    Recipe(name: "Kebab",
           description: "Beshqozon oshi juda mazali",
           ingredients: [Ingredient(name: "Tuxum", quantity: "2ta", image: UIImage(named: "chicken")!)],
           steps: [Step(number: 1, description: "suv sol")],
           cookingTime: 25,
           category: "Desert",
           image: UIImage(named: "kebab")!,
           kcal: 500),
    ]
    var filteredRicipes = [Recipe]()
    
// MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        navigationItem.title = "Recipe App"
        
        self.filteredRicipes = recipe
        
        segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        searchBarSearch.delegate = self
        
//MARK: - Added HomeCollectionViewCell with XIB file
        self.CollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        
    }
    
    @IBAction func categoryChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            filteredRicipes = recipe
        case 1:
            filteredRicipes = recipe.filter { $0.category == "Breakfast" }
        case 2:
            filteredRicipes = recipe.filter { $0.category == "Dinner" }
        case 3:
            filteredRicipes = recipe.filter { $0.category == "Lunch" }
        case 4:
            filteredRicipes = recipe.filter { $0.category == "Desert" }
        default:
            break
        }
        CollectionView.reloadData()
        
    }
    
   
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredRicipes.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? HomeCollectionViewCell else {
            fatalError("Cell not found")
        }
        
        let recipes = filteredRicipes[indexPath.row]
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

// MARK: UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
    func filterContentForSearchText(_ searchText: String) {
        if searchText.isEmpty {
            filteredRicipes = recipe
        } else {
            filteredRicipes = recipe.filter{ recipe in
                recipe.name.lowercased().contains(searchText.lowercased())
            }
        }
        CollectionView.reloadData()
            
    }
}




