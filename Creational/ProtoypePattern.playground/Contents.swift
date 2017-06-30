class BasketballGame {
    var quarter: Int = 1
    var homeScore: Int = 0
    var awayScore: Int = 0
    
    init() {}
    
    init(quarter:Int, homeScore:Int, awayScore:Int) {
        self.quarter = quarter
        self.homeScore = homeScore
        self.awayScore = awayScore
    }
    
    func incrementQuarter() {
        if quarter < 4 {
            quarter + 1
        }
    }
    
    func incrementHomeScore(points: Int) {
        homeScore += points
    }
    
    func incrementAwayScore(points: Int) {
        awayScore += points
    }
    
    func clone() -> BasketballGame {
        return BasketballGame(quarter: self.quarter, homeScore: self.homeScore, awayScore: self.awayScore)
    }
}

let game = BasketballGame()
game.incrementAwayScore(points: 25)
game.incrementHomeScore(points: 22)

let firstQuarterStats = game.clone()
firstQuarterStats.homeScore
firstQuarterStats.awayScore

game.incrementQuarter()
game.incrementAwayScore(points: 22)
game.incrementHomeScore(points: 25)

let secondQueryStats = game.clone()
secondQueryStats.homeScore
secondQueryStats.awayScore
