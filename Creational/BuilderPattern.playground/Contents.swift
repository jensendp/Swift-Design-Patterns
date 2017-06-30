class Computer {
    var memory: String
    var hddSize: String
    var cpu: String
    
    init?(builder: ComputerBuilder) {
        if let memory = builder.memory, let hddSize = builder.hddSize, let cpu = builder.cpu {
            self.memory = memory
            self.hddSize = hddSize
            self.cpu = cpu
        }else {
            return nil
        }
    }
    
    init(memory: String, hddSize: String, cpu:String) {
        self.memory = memory
        self.hddSize = hddSize
        self.cpu = cpu
    }
}

class ComputerBuilder {
    var memory: String?
    var hddSize: String?
    var cpu: String?
    
    typealias BuilderClosure = (ComputerBuilder) -> ()
    
    init(builderClosure: BuilderClosure) {
        builderClosure(self)
    }
}

let builder = ComputerBuilder { b in
    b.cpu = "3.2 GHz"
    b.memory = "16 GB"
    b.hddSize = "2 TB"
}

let newComputer = Computer(builder: builder)

newComputer?.hddSize


class ComputerBuilderFluent {
    var memory: String?
    var hddSize: String?
    var cpu: String?
    
    func setMemory(for memory: String) -> ComputerBuilderFluent {
        self.memory = memory
        return self
    }
    
    func setHddSize(for hddSize: String) -> ComputerBuilderFluent {
        self.hddSize = hddSize
        return self
    }
    
    func setCpu(for cpu: String) -> ComputerBuilderFluent {
        self.cpu = cpu
        return self
    }
    
    func build() -> Computer? {
        if let mem = self.memory, let hdd = self.hddSize, let cpuName = self.cpu {
            return Computer(memory: mem, hddSize: hdd, cpu: cpuName)
        }else {
            return nil
        }
    }
}

let builderFluent = ComputerBuilderFluent()

builderFluent.setCpu(for: "3.5 GHz").setMemory(for: "8 GB").setHddSize(for: "500 GB")
var computer = builderFluent.build()

computer?.cpu