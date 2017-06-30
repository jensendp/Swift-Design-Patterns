import Foundation

class InventorySystem {
    func checkInventory(productId: String, quantity: Int) {
        print("Checking for quantity \(quantity) of product \(productId)")
    }
    
    func reserveInventory(productId: String, quantity: Int, orderId: String) {
        print("Reserverd quantity \(quantity) of product \(productId) for order \(orderId)")
    }
    
    func removeInventory(productId: String, quantity: Int, orderId: String) {
        print("Removed quantity \(quantity) of product \(productId) from inventory")
    }
}

class ShippingSystem {
    func validateAddress(street: String, city: String, state: String, postalCode: String) {
        print("Validating address \(street), \(city), \(state) \(postalCode)")
    }
    
    func shipOrderToAddress(productId: String, quantity: Int, street: String, city: String, state: String, postalCode: String) {
        print("Shipping Order.  Have a nice day")
    }
}

class CostCalculator {
    func calculateTotal(itemCost: Double, quantity: Int) -> Double {
        let total = itemCost * Double(quantity)
        print("Calculating cost = $\(total)")
        
        return total
    }
}

class BillingSystem {
    func chargeCustomer(customerId: String, chargeTotal: Double) {
        print("Successfully charged customer \(customerId) a total of \(chargeTotal)")
    }
}

class EmailSystem {
    func sendReciept(customerId: String, orderId: String, chargeTotal: Double) {
        print("Successfully sent customer \(customerId) a receipt for order \(orderId) for a total of \(chargeTotal)")
    }
}

// Facade

class Address {
    var street: String
    var city: String
    var state: String
    var postalCode: String
    
    init(street: String, city: String, state: String, postalCode: String) {
        self.street = street
        self.city = city
        self.state = state
        self.postalCode = postalCode
    }
}

class Order {
    var customerId: String
    var address: Address
    var productId: String
    var quantity: Int
    var itemCost: Double
    
    init(customerId: String, address: Address, productId: String, quantity: Int, itemCost: Double) {
        self.customerId = customerId
        self.address = address
        self.productId = productId
        self.quantity = quantity
        self.itemCost = itemCost
    }
}

class OrderFacade {
    private let inventorySystem: InventorySystem = InventorySystem()
    private let shippingSystem: ShippingSystem = ShippingSystem()
    private let costCalculator: CostCalculator = CostCalculator()
    private let billingSystem: BillingSystem = BillingSystem()
    private let emailSystem: EmailSystem = EmailSystem()
    
    func placeOrder(order: Order) {
        let orderId = UUID().uuidString
        
        inventorySystem.checkInventory(productId: order.productId, quantity: order.quantity)
        inventorySystem.reserveInventory(productId: order.productId, quantity: order.quantity, orderId: orderId)
        
        shippingSystem.validateAddress(street: order.address.street, city: order.address.city, state: order.address.state, postalCode: order.address.postalCode)
        
        let chargeTotal = costCalculator.calculateTotal(itemCost: order.itemCost, quantity: order.quantity)
        
        billingSystem.chargeCustomer(customerId: order.customerId, chargeTotal: chargeTotal)
        
        inventorySystem.removeInventory(productId: order.productId, quantity: order.quantity, orderId: orderId)
        
        shippingSystem.shipOrderToAddress(productId: order.productId, quantity: order.quantity, street: order.address.street, city: order.address.city, state: order.address.state, postalCode: order.address.postalCode)
        
        emailSystem.sendReciept(customerId: order.customerId, orderId: orderId, chargeTotal: chargeTotal)
        
    }
}

let address = Address(street: "123 Main St.", city: "Los Angeles", state: "CA", postalCode: "90222")
let order = Order(customerId: UUID().uuidString, address: address, productId: "123456789", quantity: 2, itemCost: 13.59)

let orderFacade = OrderFacade()
orderFacade.placeOrder(order: order)


