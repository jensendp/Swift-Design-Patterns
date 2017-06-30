
struct Countdown: Sequence {
    let start: Int
    
    func makeIterator() -> CoutdownIterator {
        return CoutdownIterator(countdown: self)
    }
}

struct CoutdownIterator: IteratorProtocol {
    let countdown: Countdown
    var times = 0
    
    init(countdown: Countdown) {
        self.countdown = countdown
    }
    
    mutating func next() -> Int? {
        let nextNumber = countdown.start - times
        guard nextNumber > 0 else {
            return nil
        }
        
        times += 1
        return nextNumber
    }
}

let ten = Countdown(start: 10)

for count in ten {
    print("\(count)")
}