//
//  File.swift
//  MyCookBookApp
//
//  Created by doniyor normuxammedov on 17/08/24.
//

import Foundation
import UIKit

// Asosiy Recipe Struct - Umumiy retseptning barcha qismlarini saqlaydi.
struct Recipe {
    let name: String // Retsept nomi
    let description: String // Retseptning qisqacha ta'rifi
    let ingredients: [Ingredient] // Ingredientlar ro'yxati
    let steps: [Step] // Tayyorlash bosqichlari
    let cookingTime: Int // Tayyorlash vaqti (daqiqalarda)
    let category: String // Kategoriyasi (Masalan, Breakfast, Lunch)
    let image: UIImage // Retsept rasmi
    let kcal: Int
}

// Ingredient Struct - Har bir ingredient nomi, miqdori va rasm bilan taqdim etiladi.

struct Ingredient {
    let name: String
    let quantity: String // Masalan, "2 pcs" yoki "250 gr"
    let image: UIImage // Ingredientning rasm
}

// Step Struct - Har bir tayyorlash bosqichi ketma-ketlikda taqdim etiladi va agar kerak bo'lsa rasm bilan qo'llab-quvvatlanadi.

struct Step {
    let number: Int // Tayyorlash bosqichining raqami
    let description: String // Bosqichning ta'rifi
    
}


