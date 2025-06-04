class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init?(name: String, age: Int, canFail: Bool) {
        if age < 16 {
            return nil
        }
        self.init(name: name, age: age)
    }
}
class Student: Person {
    var studentID: String
    var major: String
    
    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
    }
    
    convenience init(name: String, studentID: String) {
        self.init(name: name, age: 18, studentID: studentID, major: "Undeclared")
    }
}

class Professor: Person {
    var faculty: String
    
    init(name: String, age: Int, faculty: String) {
        self.faculty = faculty
        super.init(name: name, age: age)
    }
}

struct University {
    var name: String
    var location: String
}
/*
 let person1 = Person(name: "John", age: 30)
 let person2 = Person(name: "Alice", age: 15, canFail: true)
 
 let student1 = Student(name: "Bob", age: 20, studentID: "b1234", major: "Computer Science")
 let student2 = Student(name: "Emma", studentID: "e1234")
 
 let professor = Professor(name: "Dr. Smith", age: 45, faculty: "Engineering")
 
 let university = University(name: "Tech University", location: "Epam")
 */
