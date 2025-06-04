struct School {
    enum SchoolRole {
        case student
        case teacher
        case administrator
    }
    
    class Person {
        let name: String
        let role: SchoolRole
        
        init(name: String, role: SchoolRole) {
            self.name = name
            self.role = role
        }
    }
    
    private var people: [Person] = []
    
    subscript(role: SchoolRole) -> [Person] {
        return people.filter { $0.role == role }
    }
    
    mutating func addPerson(_ person: Person) {
        people.append(person)
    }
    
    func countStudents() -> Int {
        return self[.student].count
    }
    
    func countTeachers() -> Int {
        return self[.teacher].count
    }
    
    func countAdministrators() -> Int {
        return self[.administrator].count
    }
}
/*
 var highSchool = School()
 
 highSchool.addPerson(School.Person(name: "Alice Johnson", role: .student))
 highSchool.addPerson(School.Person(name: "Bob Smith", role: .student))
 highSchool.addPerson(School.Person(name: "Dr. Williams", role: .teacher))
 highSchool.addPerson(School.Person(name: "Principal Davis", role: .administrator))
 highSchool.addPerson(School.Person(name: "Sarah Miller", role: .teacher))
 
 let students = highSchool[.student]
 print("Students: \(students.map { $0.name }.joined(separator: ", "))")
 
 print("Student count: \(highSchool.countStudents())")
 print("Teacher count: \(highSchool.countTeachers())")
 print("Administrator count: \(highSchool.countAdministrators())")
 
 highSchool.addPerson(School.Person(name: "New Student", role: .student))
 print("\nAfter adding new student:")
 print("Updated student count: \(highSchool.countStudents())")
 */
