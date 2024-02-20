import UIKit

struct Ingredient {
    var name: String
    var weight: Float
    var calorie: Int
    var price: Float
    
}

struct Pizza {
    var name: String
    
    var ingredients = [Ingredient]()
    
    var price: Float {
        var sum: Float = 0
        for item in ingredients {
            sum += item.price
        }
        sum = sum * 1.3
        return sum
    }
    
    func  getIngredientsList () -> String {
        let names = ingredients.map { $0.name }
           return names.joined(separator: ", ")
    }
}




var meat = Ingredient(name: "Meat", weight: 4, calorie: 200, price: 20)
var cheese = Ingredient(name: "Cheese", weight: 1, calorie: 100, price: 10)
var pepperoni = Ingredient(name: "Pepperoni", weight: 3, calorie: 250, price: 25)
var tomatoes = Ingredient(name: "Tomatoes", weight: 2, calorie: 50, price: 5)


var pizzas = [Pizza]()

var pizza_margarita = Pizza(name: "Margarita")
pizza_margarita.ingredients = [cheese, meat]
pizzas.append(pizza_margarita)

var pizza_carbonara = Pizza(name: "Carbonara")
pizza_carbonara.ingredients = [meat, tomatoes, pepperoni]
pizzas.append(pizza_carbonara)

var pizza_pepperoni = Pizza(name: "Pepperoni")
pizza_pepperoni.ingredients = [meat, tomatoes, pepperoni, cheese]
pizzas.append(pizza_pepperoni)


let mostExpensivePizza = pizzas.max(by: { $0.price < $1.price })

let totalPrice = pizzas.reduce(0) { $0 + $1.price }


var pizzaWithCheese = [Pizza]()
for pizza in pizzas {
    for ingredient in pizza.ingredients {
        if ingredient.name == "Cheese" {
            pizzaWithCheese.append(pizza)
            break
        }
    }
}



var meatIngredientCount: Int = 0
for pizza in pizzas {
    for ingredient in pizza.ingredients {
        if ingredient.name == "Meat" {
            meatIngredientCount += 1
        }
    }
}




for pizza in pizzas{
print("Name: \(pizza.name)","Ingredients: \(pizza.getIngredientsList())","Price: \(pizza.price) грн",
      "\n",separator: "\n")
}
print("----------------------------------\n")

if let mostExpensivePizza = mostExpensivePizza {
    print("Most expensive pizza: \(mostExpensivePizza.name)\n")
    
} else {
    print("Pizza absent!\n")
}
print("Total cost pizzas: \(totalPrice) грн")

print("----------------------------------\n")

if pizzaWithCheese.isEmpty {
    print("Pizza with 'Cheese' absent!")
}
else {
    print("Pizza with  'Cheese': " )
    for pizza in pizzaWithCheese {
        print("|", pizza.name, "|")
    }
}

print("----------------------------------\n")

print("Amount of ingredients used - Meat: \(meatIngredientCount)")

//1

