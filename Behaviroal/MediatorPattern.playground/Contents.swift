class Person {
    let name: String
    private let mediator: Mediator
    
    init(mediator: Mediator, name: String) {
        self.mediator = mediator
        self.name = name
    }
    
    func send(message: String) {
        mediator.send(message: message, sender: self)
    }
    
    func receive(message: String) {
        print("\(name) received message: \(message)")
    }
    
}

protocol Mediator {
    func send(message: String, sender: Person)
}

class Chatroom: Mediator {
    private var people: [Person] = []
    
    func addPerson(person: Person) {
        people.append(person)
    }
    
    func send(message: String, sender: Person) {
        for p in people {
            if p !== sender {
                p.receive(message: message)
            }
        }
    }
}

let chatroom = Chatroom()
let derek = Person(mediator: chatroom, name: "Derek")
let amanda = Person(mediator: chatroom, name: "Amanda")
let adam = Person(mediator: chatroom, name: "Adam")

chatroom.addPerson(person: derek)
chatroom.addPerson(person: amanda)
chatroom.addPerson(person: adam)

derek.send(message: "Hello, is anyone there?")
amanda.send(message: "Hi Derek, I'm here.")

