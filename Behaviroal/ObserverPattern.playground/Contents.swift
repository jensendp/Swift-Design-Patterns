protocol Observer {
    func update()
}

class BasketballGame {
    private var observers: [Observer] = []
    private var _homeScore = 0
    private var _awayScore = 0
    
    var homeScore: Int {
        set {
            _homeScore = newValue
            notify()
        }
        get {
            return _homeScore
        }
    }
    
    var awayScore: Int {
        set {
            _awayScore = newValue
            notify()
        }
        get {
            return _awayScore
        }
    }
    
    func attachObserver(observer: Observer) {
        observers.append(observer)
    }
    
    private func notify() {
        for observer in observers {
            observer.update()
        }
    }
}

class Fan: Observer {
    private var game: BasketballGame
    
    init(game: BasketballGame) {
        self.game = game
        self.game.attachObserver(observer: self)
    }
    
    func update() {
        print("New score is Home Team: \(game.homeScore) and Away Team: \(game.awayScore)")
    }
}

let game = BasketballGame()
let fan = Fan(game: game)

game.homeScore = 3