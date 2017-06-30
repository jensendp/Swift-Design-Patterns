class Employee: CustomStringConvertible {
    var name: String
    var title: String
    var salary: Int
    var manages: [Employee] = []
    
    init(name: String, title: String, salary: Int) {
        self.name = name
        self.title = title
        self.salary = salary
    }
    
    func add(employee: Employee) {
        self.manages.append(employee)
    }
    
    var description: String {
        return "Employee: Title: \(title), Name: \(name), Salary: \(salary)"
    }
}

let ceo = Employee(name: "Derek Jensen", title: "CEO", salary: 10000)
let vpEngineering = Employee(name: "Jane Doe", title: "VP of Engineering", salary: 7500)
let vpMakerting = Employee(name: "James Johnson", title: "VP of Marketing", salary: 7500)
let directorEngineering = Employee(name: "Robby Bobson", title: "Director of Engineering", salary: 5000)
let seniorEngineer = Employee(name: "Jenny Williams", title: "Senior Engineer", salary: 3750)

directorEngineering.add(employee: seniorEngineer)
vpEngineering.add(employee: directorEngineering)
ceo.add(employee: vpEngineering)
ceo.add(employee: vpMakerting)


func printEmployee(employee: Employee, level: Int) {
    let spacing = String(repeating: "-", count: level)
    print("\(spacing)\(employee)")
    
    for e in employee.manages {
        printEmployee(employee: e, level: level + 1)
    }
}

printEmployee(employee: ceo, level: 0)