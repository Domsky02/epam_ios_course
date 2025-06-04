import Foundation

protocol Shape {
    func area() -> Double
    func perimeter() -> Double
}

class Circle: Shape {
    let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    func perimeter() -> Double {
        return 2 * Double.pi * radius
    }
}

class Rectangle: Shape {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func area() -> Double {
        return width * height
    }
    
    func perimeter() -> Double {
        return 2 * (width + height)
    }
}

func generateShape() -> some Shape {
    return Circle(radius: 5)
}

func calculateShapeDetails(_ shape: Shape) -> (area: Double, perimeter: Double) {
    return (shape.area(), shape.perimeter())
}

/*
let shape = generateShape()
let details = calculateShapeDetails(shape)
print("Area: \(details.area), Perimeter: \(details.perimeter)")

let rectangle = Rectangle(width: 3, height: 4)
let rectDetails = calculateShapeDetails(rectangle)
print("Rectangle Area: \(rectDetails.area), Perimeter: \(rectDetails.perimeter)")
*/
