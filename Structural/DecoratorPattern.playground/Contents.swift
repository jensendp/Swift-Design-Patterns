protocol BurgerProduct {
    var price: Double { get set }
    var ingredient: String { get set }
    
    func getCost() -> Double
    func getIngredient() -> String
}

class Burger: BurgerProduct {
    var price = 3.0
    var ingredient = "Beef"
    
    func getCost() -> Double {
        return price
    }
    
    func getIngredient() -> String {
        return ingredient
    }
}

class BurgerDecorator: BurgerProduct {
    private let decoratedBurger: BurgerProduct
    
    var ingredient = ""
    var price = 0.0
    
    required init(decoratedBurger: BurgerProduct) {
        self.decoratedBurger = decoratedBurger
    }
    
    func getCost() -> Double {
        return decoratedBurger.getCost()
    }
    
    func getIngredient() -> String {
        return decoratedBurger.getIngredient()
    }
}

class CheeseIngredient: BurgerDecorator {
    required init(decoratedBurger: BurgerProduct) {
        super.init(decoratedBurger: decoratedBurger)
        
        self.ingredient = "Cheese"
        self.price = 1.5
    }
    
    override func getCost() -> Double {
        return super.getCost() + price
    }
    
    override func getIngredient() -> String {
        return super.getIngredient() + " \(ingredient)"
    }
}

var burger: BurgerProduct = Burger()
burger.ingredient
burger.price

burger = CheeseIngredient(decoratedBurger: burger)
burger.getCost()
burger.getIngredient()
