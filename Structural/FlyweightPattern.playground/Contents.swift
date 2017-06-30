protocol Executor {
    func execute()
}

class Service: Executor {
    public let type: String
    
    init(type: String) {
        self.type = type
    }
    
    func execute() {
        print("Congratulations, you just did something great!")
    }
}

class ServiceFactory {
    private var services: [String: Service] = [:]
    
    func getService(key: String) -> Service {
        if let service = services[key] {
            return service
        }else {
            let service = Service(type: key)
            services[key] = service
            return service
        }
    }
}

let factory = ServiceFactory()

var service = factory.getService(key: "order")
var service2 = factory.getService(key: "order")
var service3 = factory.getService(key: "billing")

service === service2
service === service3