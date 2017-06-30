protocol State {
    func pull(chain: CeilingFanPullChain)
}

class CeilingFanPullChain {
    private var currentState: State
    
    init() {
        currentState = Off()
    }
    
    func setState(state: State) {
        self.currentState = state
    }
    
    func pull() {
        currentState.pull(chain: self)
    }
}

class Off: State {
    func pull(chain: CeilingFanPullChain) {
        chain.setState(state: Low())
        print("Chainging speed to low")
    }
}

class Low: State {
    func pull(chain: CeilingFanPullChain) {
        chain.setState(state: Medium())
        print("Chainging speed to medium")
    }
}

class Medium: State {
    func pull(chain: CeilingFanPullChain) {
        chain.setState(state: High())
        print("Chainging speed to high")
    }
}

class High: State {
    func pull(chain: CeilingFanPullChain) {
        chain.setState(state: Off())
        print("Turning off fan")
    }
}

let fan = CeilingFanPullChain()
fan.pull()
fan.pull()
fan.pull()
fan.pull()