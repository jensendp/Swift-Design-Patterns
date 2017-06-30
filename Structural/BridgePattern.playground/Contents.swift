protocol Shape {
    func draw()
}

protocol ColorProtocol {
    func fill() -> String
}

class Color: ColorProtocol {
    private var fillColor: String
    
    init(fillColor: String) {
        self.fillColor = fillColor
    }
    
    func fill() -> String {
        return fillColor
    }
}

class Red: Color {
    init() {
        super.init(fillColor: "red")
    }
}

class Circle: Shape {
    private let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func draw() {
        print("Drawing a \(color.fill()) circle")
    }
}

class Square: Shape {
    func draw() {
        print("Drawing a square")
    }
}

class Triangle: Shape {
    func draw() {
        print("Drawing a triangle")
    }
}


let red = Red()
let circle = Circle(color: red)

circle.draw()

