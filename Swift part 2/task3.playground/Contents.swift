class Person {
    var name: String
    var age: Int
    
    var isAdult: Bool {
        return age >= 18
    }
    
    static let minAgeForEnrollment = 16
    
    lazy var profileDescription: String = {
        return "\(name) is \(age) years old."
    }()
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init?(name: String, age: Int, canFail: Bool) {
        if age < Self.minAgeForEnrollment {
            return nil
        }
        self.init(name: name, age: age)
    }
}

class Student: Person {
    var studentID: String
    var major: String
    
    static var studentCount = 0
    
    weak var advisor: Professor?
    
    var formattedID: String {
        return "ID: \(studentID.uppercased())"
    }
    
    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
        Student.studentCount += 1
    }
    
    convenience init(name: String, studentID: String) {
        self.init(name: name, age: 18, studentID: studentID, major: "Undeclared")
    }
    
    deinit {
        Student.studentCount -= 1
    }
}

class Professor: Person {
    var faculty: String
    
    static var professorCount = 0
    
    var fullTitle: String {
        return "Professor \(name), Faculty of \(faculty)"
    }
    
    init(name: String, age: Int, faculty: String) {
        self.faculty = faculty
        super.init(name: name, age: age)
        Professor.professorCount += 1
    }
    
    deinit {
        Professor.professorCount -= 1
    }
}

struct University {
    var name: String
    var location: String
    
    var description: String {
        return "\(name) University, located in \(location)"
    }
}
/*
 let person1 = Person(name: "John Smith", age: 30)
 print(person1.profileDescription)
 print("Is adult:", person1.isAdult)
 
 if let person2 = Person(name: "Young Student", age: 15, canFail: true) {
 print("Created:", person2.name)
 } else {
 print("Creation failed too young")
 }
 
 let student1 = Student(name: "Alice", age: 20, studentID: "a1234", major: "Computer Science")
 print(student1.formattedID)
 print("Student count:", Student.studentCount)
 
 let student2 = Student(name: "Bob", studentID: "b1234")
 print("Student count:", Student.studentCount)
 
 let professor = Professor(name: "Dr. Smith", age: 45, faculty: "Engineering")
 print(professor.fullTitle)
 print("Professor count:", Professor.professorCount)
 
 student1.advisor = professor
 
 let university = University(name: "Tech University", location: "Epam")
 print(university.description)
 */
