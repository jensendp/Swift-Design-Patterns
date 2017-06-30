protocol Command {
    func execute()
}

class Home {
    func lockDoors() {
        print("Locking the doors")
    }
    
    func unlockDoors() {
        print("Unlocking the doors")
    }
    
    func openGarage() {
        print("Openning the garage")
    }
    
    func closeGarage() {
        print("Closing the garage")
    }
}

class LockDoorCommand: Command {
    private let home: Home
    
    init(home: Home) {
        self.home = home
    }
    
    func execute() {
        home.lockDoors()
    }
}

class UnlockDoorCommand: Command {
    private let home: Home
    
    init(home: Home) {
        self.home = home
    }
    
    func execute() {
        home.unlockDoors()
    }
}

class CloseGarageCommand: Command {
    private let home: Home
    
    init(home: Home) {
        self.home = home
    }
    
    func execute() {
        home.closeGarage()
    }
}

class OpenGarageCommand: Command {
    private let home: Home
    
    init(home: Home) {
        self.home = home
    }
    
    func execute() {
        home.openGarage()
    }
}

class HomeAutomator {
    private let lockDoorCommand: Command
    private let unlockDoorCommand: Command
    private let closeGarageCommand: Command
    private let openGarageCommand: Command
    
    init(home: Home) {
        lockDoorCommand = LockDoorCommand(home: home)
        unlockDoorCommand = UnlockDoorCommand(home: home)
        closeGarageCommand = CloseGarageCommand(home: home)
        openGarageCommand = OpenGarageCommand(home: home)
    }
    
    func secure() {
        lockDoorCommand.execute()
        closeGarageCommand.execute()
    }
    
    func open() {
        unlockDoorCommand.execute()
        openGarageCommand.execute()
    }
}

let myHouse = Home()
let automator = HomeAutomator(home: myHouse)

automator.secure()
automator.open()





