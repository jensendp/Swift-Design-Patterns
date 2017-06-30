enum Severity: Int {
    case Low = 1, Medium, High, Super
}

class SupportRequest {
    let severity: Severity
    var name: String
    var completed: Bool = false
    
    init(name: String, severity: Severity) {
        self.name = name
        self.severity = severity
    }
}

protocol SupportRepProtocol {
    func processRequest(request: SupportRequest)
}

class SupportRep: SupportRepProtocol {
    var severity: Severity
    var level: String
    var nextLevelRep: SupportRep?
    
    init(severity: Severity, level: String) {
        self.severity = severity
        self.level = level
    }
    
    func setNextLevelRep(nextLevelRep: SupportRep) {
        self.nextLevelRep = nextLevelRep
    }
    
    func processRequest(request: SupportRequest) {
        if request.completed {
            return
        }
        
        if request.severity.rawValue <= severity.rawValue {
            print("Request '\(request.name)' has been processed by a \(level) level support rep")
            request.completed = true
        }
        
        if nextLevelRep != nil {
            nextLevelRep?.processRequest(request: request)
        }
    }
}

class SupportGroup {
    var supportReps: [SupportRep]
    
    init(supportReps: [SupportRep]) {
        self.supportReps = supportReps
    }
    
    func processRequest(request: SupportRequest) {
        print("Recieved \(request.severity) level support request.  Processing...")
        if let firstRep = supportReps.first {
            firstRep.processRequest(request: request)
        }
        
        if request.completed {
            print("Successfully processed request")
        }else {
            print("Unable to find representative to process request")
        }
    }
}


let junior = SupportRep(severity: .Low, level: "Junior")
let mid = SupportRep(severity: .Medium, level: "Mid")
let senior = SupportRep(severity: .High, level: "Senior")

junior.setNextLevelRep(nextLevelRep: mid)
mid.setNextLevelRep(nextLevelRep: senior)

let group = SupportGroup(supportReps: [junior, mid, senior])
let request = SupportRequest(name: "Upgrade Laptop", severity: .Super)

group.processRequest(request: request)