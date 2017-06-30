protocol HardWorkerProtocol {
    func doSomeHardWork()
}

class HardWorker: HardWorkerProtocol {
    func doSomeHardWork() {
        print("Look at me, I'm really doing some hard work!")
    }
}

class HardWorkerProxy: HardWorkerProtocol {
    private var worker: HardWorkerProtocol
    
    init(worker: HardWorkerProtocol) {
        self.worker = worker
    }
    
    func doSomeHardWork() {
        print("Before I do hard work, I need to take a deep breath")
        worker.doSomeHardWork()
        print("After I do hard work, I need to take a break")
    }
}

var worker = HardWorker()
var proxy = HardWorkerProxy(worker: worker)

proxy.doSomeHardWork()