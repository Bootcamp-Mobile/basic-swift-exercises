import UIKit

// ************* Classes *************

// Declaración clase Student
class Student {
    // Propiedades de la clase Student
    var name: String
    var lastname: String
    var age: Int?
    var address: String?
    var email: String
    var phone: String?
    
    // Computed property
    var fullName: String {
        return "\(name) \(lastname)"
    }

    // Constructor o inicializador de la clase Student
    init(name: String = "", lastname: String = "", email: String = "", age: Int? = nil, address: String = "", phone: String = "") {
        self.name = name
        self.lastname = lastname
        self.email = email
        self.age = age
        self.address = address
        self.phone = phone
    }
}

class Teacher: CustomStringConvertible {
    var name: String
    var lastname: String
    var email: String
    var age: Int?
    
    // Computed properties
    // Variable 'description' se utiliza porque obliga el protocolo 'CustomStringConvertible'
    var description: String {
        return name
//        return """
//        "teacher": {
//            "name": \(name),
//            "lastname": \(lastname),
//            "email": \(email),
//            "age": \(age ?? -1)
//        }
//        """
    }
    
    var fullName: String {
        return "\(name) \(lastname)"
    }
    
    init(name: String = "", lastname: String = "", email: String = "", age: Int? = nil) {
        self.name = name
        self.lastname = lastname
        self.email = email
        self.age = age
    }
}

// ************* Typealias *************
typealias Teachers = [Teacher]
typealias Students = [Student]

class Bootcamp {
    var name: String
    var teachers: Teachers
    var students: Students
    
    // Computed properties
    // 1.- teachersCount
    /*
     func teachersCount() -> Int {
         return teachers.count
     }
     */
    var teachersCount: Int {
        return teachers.count
    }
    
    // 2.- studentsCount
    /*
     func studentsCount() -> Int {
         return students.count
     }
     */
    var studentsCount: Int {
        return students.count
    }
    
    
    init(name: String, teachers: Teachers = [], students: Students = []) {
        self.name = name
        self.teachers = teachers
        self.students = students
    }
}


// ************* Sample Data *************

let bootcampStudents = [Student(name: "Elena",
                                lastname: "Barbullushi",
                                email: "e.barbullushi@email.com",
                                age: 25),
                        Student(name: "Sergi",
                                lastname: "Exposito",
                                email: "s.exposito@email.com",
                                age: 45,
                                phone: "612692692"),
                        Student(name: "Belén",
                                lastname: "Cerezo",
                                email: "b.cerezo@email.com",
                                age: 23),
                        Student(name: "Miguel",
                                lastname: "Alarcón",
                                email: "m.alarcon@email.com",
                                age: 37),
                        Student(name: "Natalia",
                                lastname: "Soria",
                                email: "n.soria@email.com",
                                age: 19,
                                phone: "666612612"),
                        Student(name: "Adrián",
                                lastname: "Puerto",
                                email: "a.puerto@email.com",
                                age: 32),
                        Student(name: "Alex",
                                lastname: "Del Río",
                                email: "a.rio@email.com",
                                age: 29)]

let bootcampTeachers = [Teacher(name: "David",
                                lastname: "Jardón",
                                email: "d.jardon@email.com",
                                age: 35),
                        Teacher(name: "Carlos",
                                lastname: "De Tena",
                                email: "c.detena@email.com",
                                age: 34),
                        Teacher(name: "Sara",
                                lastname: "Vizarro",
                                email: "s.vizarro@email.com",
                                age: 36),
                        Teacher(name: "Andrés",
                                lastname: "López",
                                email: "a.lopez@email.com")]

let bootcamps = [Bootcamp(name: "Bootcamp Mobile",
                          teachers: bootcampTeachers.filter { $0.name.contains("a") },
                          students: bootcampStudents.filter { $0.name.contains("e") }),
                 Bootcamp(name: "Bootcamp Fullstack",
                          teachers: bootcampTeachers.filter { $0.name.contains("i") },
                          students: bootcampStudents.filter { $0.name.contains("a") }),
                 Bootcamp(name: "Bootcamp UX/UI",
                          teachers: bootcampTeachers.filter { $0.name.contains("o") },
                          students: bootcampStudents.filter { $0.name.contains("i") })]


// ************* Exercises *************

print("****** 9.1 ******")
// Escribir en consola los nombres de los estudiantes con menos de 30 años
for student in bootcampStudents {
    // Desempaquetar de forma segura 'student.age' que es opcional 'Int?',
    // después comprobamos si 'age' es menor que 30
    if let age = student.age, age < 30 {
        print("\(student.fullName) age \(age)")
    }
    
    /*
    // Podríamos utilizar un guard-let en lugar del if-let anterior
    guard let age = student.age,
          age < 30 else {
        // Si NO se cumplen las condiciones salto
        // a la siguiente iteración con 'continue'
        continue
    }
    
    print("\(student.fullName()) age \(age)")
    */
}

// Mismo ejemplo utilizando el closure 'forEach'
bootcampStudents.forEach { student in
    if let age = student.age, age < 30 {
        print(student.fullName)
    }
}

print("****** 9.2 ******")
// Escribir en consola los nombres de los estudiantes con menos de 30 años
// y su email tenga más de 15 letras
bootcampStudents.forEach { student in
    if let age = student.age, age < 30, student.email.count > 15 {
        print("\(student.fullName) age \(age) email \(student.email)")
    }
}


print("****** 9.3 ******")
// Escribir en consola los nombres de los estudiantes con más de 30 años
// y que tengan número de teléfono
bootcampStudents.forEach { student in
    if let phone = student.phone, let age = student.age, age < 30, !phone.isEmpty {
        print("\(student.fullName) age \(age) phone \(phone)")
    }
}


print("****** 10 ******")
// Escribir en consola, por cada bootcamp,
// el nombre de cada estudiante del bootcamp
for bootcamp in bootcamps {
    print("\(bootcamp.name), \(bootcamp.studentsCount) estudiantes:")
    for student in bootcamp.students {
        print(student.name)
    }
    print()
}

print()
print("****** 10.1 ******")
// Escribir en consola, por cada bootcamp,
// el nombre de cada profesor del bootcamp
for bootcamp in bootcamps {
    print("\(bootcamp.name), \(bootcamp.teachersCount) profesores:")
    for teacher in bootcamp.teachers {
        print(teacher.name)
    }
    print()
}


print()
print("****** 10.2 ******")
// Escribir en consola el nombre de los bootcamps que tengan más de 2 estudiantes
/*
 for bootcamp in bootcamps {
    if(bootcamp.students.count > 2) {
        print(bootcamp.name)
    }
 }
 
 bootcamps.forEach { bootcamp in
     if(bootcamp.students.count > 2) {
         print(bootcamp.name)
     }
 }
 */
for bootcamp in bootcamps where bootcamp.students.count > 2 {
    print(bootcamp.name)
}


print()
print("****** 10.3 ******")
// Escribir en consola el nombre de los bootcamps que tengan más de 1 profesor
/*
 for bootcamp in bootcamps {
    if(bootcamp.teachers.count > 1) {
        print(bootcamp.name)
    }
 }
 
 bootcamps.forEach { bootcamp in
     if(bootcamp.teachers.count > 1) {
         print(bootcamp.name)
     }
 }
 */
for bootcamp in bootcamps where bootcamp.teachers.count > 1 {
    print(bootcamp.name)
}


print()
print("****** 10.4 ******")
// Escribir en consola el nombre de todos los estudiantes de los bootcamps sin repetir nombres
var studentNames: Set<String> = []
for bootcamp in bootcamps {
    for student in bootcamp.students {
        studentNames.insert(student.name)
    }
}
print(studentNames)


print()
print("****** 10.5 ******")
// Escribir en consola el nombre de todos los profesores de los bootcamps sin repetir nombres
var teacherNames: Set<String> = []
for bootcamp in bootcamps {
    for teacher in bootcamp.teachers {
        teacherNames.insert(teacher.name)
    }
}
print(teacherNames)


print()
print("****** 10.6 ******")
// Escribir en consola el nombre de todos los alumnos de los bootcamps sin repetir nombres ordenados alfabeticamente
var studentNamesSorted: Set<String> = []
for bootcamp in bootcamps {
    for student in bootcamp.students {
        studentNamesSorted.insert(student.name)
    }
}
// print(studentNamesSorted.sorted())
print(studentNamesSorted.sorted(by: { (name1, name2) -> Bool in
    return name1.compare(name2) == .orderedAscending
}))


print()
print("****** 10.7 ******")
// Escribir en consola el nombre de todos los profesores de los bootcamps sin repetir nombres ordenados alfabeticamente
var teacherNamesSorted: Set<String> = []
for bootcamp in bootcamps {
    for teacher in bootcamp.teachers {
        teacherNamesSorted.insert(teacher.name)
    }
}
print(teacherNamesSorted.sorted())


print()
print("****** 10.8 ******")
// Escribir en consola el nombre de los estudiantes que están en más de un bootcamp
/* Ejemplo
 Alumno Belén 3 bootcamps
 Alumno Miguel 2 bootcamps
 */
var studentBootcamps: [String:Int] = [:]
bootcamps.forEach { bootcamp in
    bootcamp.students.forEach { student in
        studentBootcamps[student.name] = (studentBootcamps[student.name] ?? 0) + 1
    }
}

for (name, bootcamps) in studentBootcamps where bootcamps > 1 {
    print("Alumno \(name) \(bootcamps) bootcamps")
}

/* Ejemplo compactMap
 let studentsMore1Bootcamp: [String] = bootcampStudents.compactMap { ($0.name.count > 5) ? $0.name : nil }

 let studentsMore1Bootcamp: [String] = bootcampStudents.compactMap { student in
    if(student.name.count > 5) {
        return student.name
    } else {
        return nil
    }
 }

// Operador ternario es una simplificación de un if: (condición) ? valorDevuelto_SiCondiciónTrue : valorDevuelto_SiCondiciónFalse

let studentsMore1Bootcamp: [String] = bootcampStudents.compactMap { student in
    let studentName: String? = (student.name.count > 5) ? student.name : nil
    return studentName
}
 */


/* Ejemplo filter
let bootcamps5: [Bootcamp] = bootcamps.filter { $0.name.count > 5}
let bootcamps5: [Bootcamp] = bootcamps.filter { bootcamp in
    return bootcamp.name.count > 5
}
*/

/* Ejemplo contains
var studentToSearch = "Elena"
let existsStudent: Bool = bootcampStudents.contains { $0.name.compare(studentToSearch) == .orderedSame }
    
let existsStudent: Bool = bootcampStudents.contains { student -> Bool in
    return student.name.compare(studentToSearch) == .orderedSame
}
*/


/*
 let studentsMore1Bootcamp: [String] = bootcampStudents.compactMap { student in
     return (bootcamps.filter { $0.students.contains { $0.name.compare(student.name) == .orderedSame } }.count > 1 ? student.name : nil)
 }
 print(studentsMore1Bootcamp)
 */

/*
 bootcampStudents.forEach { student in
     let studentBootcamps = bootcamps.filter { bootcamp in
         // return filter
         return bootcamp.students.contains { bootcampStudent in
             // return contains
             return bootcampStudent.name.compare(student.name) == .orderedSame
         }
     }
     
     if (studentBootcamps.count > 1) {
         print("Alumno \(student.name) \(studentBootcamps.count) bootcamps")
     }
 }
 */

/*
 Podemos utilizar en el closure: $0.age != nil ? $0:nil
let studentsWithAge: [Student] = bootcampStudents.compactMap { student in
    if(student.age != nil) {
        return student
    } else {
        return nil
    }
}
 */

let studentsMore1Bootcamp: [(name: String, count: Int)] = bootcampStudents.compactMap { student in
    // Filter devuelve una lista con los valores de bootcamps que cumplen la condición
    let studentBootcamps = bootcamps.filter { bootcamp in
        // return filter
        return bootcamp.students.contains { bootcampStudent in
            // return contains
            return bootcampStudent.name.compare(student.name) == .orderedSame
        }
    }
    
    // return CompactMap
    return (studentBootcamps.count > 1 ? (student.name, studentBootcamps.count) : nil)
}

studentsMore1Bootcamp.forEach { print("Alumno \($0.name) \($0.count) bootcamps") }


print()
print("****** 10.9 ******")
// Escribir en consola el nombre de los profesores que están en más de un bootcamp
/* Ejemplo
 Profesor David 3 bootcamps
 Profesor Sara 2 bootcamps
 */
let teachersMore1Bootcamp: [(name: String, count: Int)] = bootcampTeachers.compactMap { teacher in
    let teacherBootcamps = bootcamps.filter { $0.teachers.contains { $0.name.compare(teacher.name) == .orderedSame } }
    return teacherBootcamps.count > 1 ? (teacher.name, teacherBootcamps.count) : nil
}
teachersMore1Bootcamp.forEach { print("Profesor \($0.name) \($0.count) bootcamps") }


// ************* Functions *************

/// Filtra la lista de **bootcamps** recibida en base al nombre del **student** y devuelve los bootcamps
/// que contengan al **student**
/// - Parameters:
///   - bootcamps: listado de bootcamps
///   - student: estudiante a buscar en cada bootcamp
/// - Returns: Listado de **bootcamps** filtrados
func filter(bootcamps: [Bootcamp], by student: Student) -> [Bootcamp] {
    return bootcamps.filter { contains(bootcamp: $0, student: student) }
}

func contains(bootcamp: Bootcamp, student: Student) -> Bool {
    return bootcamp.students.contains { areStudentNameEquals(student: $0, other: student) }
}

func areStudentNameEquals(student: Student, other: Student) -> Bool {
    return student.name.compare(other.name) == .orderedSame
}



print()
print("****** 10.10 ******")
// Escribir en consola el nombre de cada estudiante y los de sus profesores
/* Ejemplo
 Alumno Belén, 2 profesores:
 David
 Sara
 */

let studentsTeachersBootcamp: [(name: String, bootcamps: [Bootcamp])] = bootcampStudents.compactMap { student in
    // Filter devuelve una lista con los valores de bootcamps que cumplen la condición
    let studentBootcamps = filter(bootcamps: bootcamps, by: student)
    
    // return CompactMap
    return (studentBootcamps.count > 1 ? (student.name, studentBootcamps) : nil)
}

studentsTeachersBootcamp.forEach { student in
    var teachers: Set<String> = []
    student.bootcamps.forEach { $0.teachers.forEach { teachers.insert($0.name) } }
    
    print("Alumno \(student.name), \(teachers.count) profesores:")
    teachers.forEach { print($0) }
}

print()
print("****** 10.11 ******")
// Escribir en consola el nombre de cada profesor y los de sus alumnos
/* Ejemplo
 Profesor David, 3 alumnos:
 Belén
 Miguel
 Alex
 */

// OBJETIVO: Conseguir la lista de bootcamps de cada profesor

// 1.- Ver cual es la lista de profesores
// bootcampsTeacher
// 2.- Ir uno a uno por cada profesor de la lista
// Ejemplo: profesor = "Juan"
bootcampTeachers.forEach { teacher in
    // 3.- Ver cual es la lista de bootcamps
    // bootcamps
    // 4.- Comprobar cuales son los bootcamps de cada profesor
    // 4.1.- Ir uno a uno por cada bootcamp
    let teacherBootcampList = bootcamps.filter { bootcamp in
        // 4.1.1.- Comprobar si mi profesor está en la lista de profesores del bootcamp
        // 4.1.2- Ir uno a uno por cada profesor del bootcamp
        return bootcamp.teachers.contains { bootcampTeacher in
            // 4.1.3.- Comprobar si cada profesor del bootcamp es igual a mi profesor ("Juan")
            // 4.1.3.1.- Comparar si el nombre del profesor del bootcamp es igual al de mi profesor ("Juan")
            return bootcampTeacher.name.compare(teacher.name) == .orderedSame
        }
    }

    // RESULTADO: Lista de bootcamps de cada profesor
    // teacherBootcampList

    // OBJETIVO: Conseguir la lista de alumnos de cada bootcamp de cada profesor
    
    // 5.- Ver cual es la lista de todos los estudiantes
    // 6.- Ir uno a uno por cada estudiante de la lista
    let teacherStudentsList = bootcampStudents.filter { student in
        // 6.1.- Comprobar si mi alumno existe en la lista 'teacherBootcampList'
        // 6.1.1.- Ir uno a uno por cada bootcamp de 'teacherBootcampList'
        
        // Podríamos utilizar la función que ya creamos para filtrar una lista de
        // bootcamps en base a un student
        // return filter(bootcamps: teacherBootcampList, by: student).count > 0

        return teacherBootcampList.contains { teacherBootcamp in
            // 6.1.1.1.- Comprobar si mi estudiante está en la lista de estudiantes del bootcamp
            // 6.1.1.2.- Ir uno a uno por la lista de estudiantes del bootcamp
            return teacherBootcamp.students.contains { teacherBootcampStudent in
                // 6.1.1.2.1- Comprobar si el alumno del bootcamp es igual a mi estudiante
                // 6.1.1.2.2- Comparar si el nombre del alumno del bootcamp es igual al nombre del estudiante
                return teacherBootcampStudent.name.compare(student.name) == .orderedSame
            }
        }
    }
    
    // RESULTADO: Lista de alumnos del profesor
    // teacherStudentsList
    
    print("Profesor \(teacher.name), \(teacherStudentsList.count) alumnos:")
    teacherStudentsList.forEach { print($0.name) }
    print()
}


print()
print("****** 10.12 ******")
// Escribir en consola el nombre de cada alumno ordenados por la edad del alumno
/* Ejemplo
 Alumno Sergi, edad 35
 Alumno Belén, edad 20
 ....
 */

// 1.- Ir uno a uno por la lista de alumnos
// bootcampStudents
// 2.- Quedarme con los alumnos que la edad no sea vacía
let studentsWithAge = bootcampStudents.filter { student in
    // 2.1.- Comparar por cada alumno si la edad es diferente de vacío
    return student.age != nil
}

// 3.- Ordenar la lista de alumnos por la edad
let studentsWithAgeSorted = studentsWithAge.sorted { ($0.age ?? 0) > ($1.age ?? 0) }
studentsWithAgeSorted.forEach { print("Alumno \($0.name), edad \($0.age ?? 0)") }


print()
print("****** 10.13 ******")
// Escribir en consola el nombre de cada profesor ordenados por la edad del profesor
/* Ejemplo
 Profesor David, edad 35
 Profesor Carlos, edad 20
 ....
 */

// 1.- Ir uno a uno por la lista de profesores
// bootcampTeachers
// 2.- Quedarme con los profesores que la edad no sea vacía
let teachersWithAge = bootcampTeachers.filter { teacher in
    // 2.1.- Comparar por cada profesor si la edad es diferente de vacío
    return teacher.age != nil
}

// 3.- Ordenar la lista de profesores por la edad
let teachersWithAgeSorted = teachersWithAge.sorted { ($0.age ?? 0) > ($1.age ?? 0) }
teachersWithAgeSorted.forEach { print("Profesor \($0.name), edad \($0.age ?? 0)") }


print()
print("****** 10.14 ******")
// Escribir en consola el nombre del alumno con mayor edad de cada bootcamp
/* Ejemplo
 Bootcamp Mobile, alumno Sergi, edad 35
 Bootcamp Fullstack, alumno Elena, edad 27
 ....
 */

bootcamps.forEach { bootcamp in
    let studentOldest = bootcamp.students.sorted { ($0.age ?? -1) > ($1.age ?? -1) }.first
    print("\(bootcamp.name), alumno \(studentOldest?.name ?? "No hay alumnos"), edad \(studentOldest?.age ?? -1)")
}


print()
print("****** 10.15 ******")
// Escribir en consola el nombre del alumno con menor edad de cada bootcamp
/* Ejemplo
 Bootcamp Mobile, alumno Sergi, edad 18
 Bootcamp Fullstack, alumno Elena, edad 21
 ....
 */

bootcamps.forEach { bootcamp in
    let studentOldest = bootcamp.students.filter { $0.age != nil }.sorted { ($0.age ?? -1) < ($1.age ?? -1) }.first
    print("\(bootcamp.name), alumno \(studentOldest?.name ?? "No hay alumnos"), edad \(studentOldest?.age ?? -1)")
}


print()
print("****** 10.16 ******")
// Escribir en consola el nombre de los profesores de cada bootcamp que sean mayores
// que todos sus alumnos
/* Ejemplo
 Bootcamp Mobile, profesor David, edad 35
 ....
 */

bootcamps.forEach { bootcamp in
    let studentOldest = bootcamp.students.sorted { ($0.age ?? -1) > ($1.age ?? -1) }.first
    
    bootcamp.teachers.forEach { teacher in
        if((teacher.age ?? -1) > (studentOldest?.age ?? -1)) {
            print("\(bootcamp.name), profesor \(teacher.name), edad \(teacher.age ?? -1)")
        }
    }
}


print()
print("****** 10.17 ******")
// Escribir en consola el nombre de los profesores de cada bootcamp que sean menores
// que todos sus alumnos
/* Ejemplo
 Bootcamp Mobile, profesor David, edad 20
 ....
 */

bootcamps.forEach { bootcamp in
    let studentYoungest = bootcamp.students.filter { $0.age != nil }.sorted { ($0.age ?? -1) < ($1.age ?? -1) }.first
    
    bootcamp.teachers.forEach { teacher in
        if((teacher.age ?? -1) < (studentYoungest?.age ?? -1)) {
            print("\(bootcamp.name), profesor \(teacher.name), edad \(teacher.age ?? -1)")
        }
    }
}


print()
print("****** 10.18 ******")
// Escribir en consola el nombre de cada alumno, el número de sus bootcamps y el nombre de cada bootcamp
/* Ejemplo
 Alumno Alex, 2 bootcamps
 Bootcamp Mobile
 Bootcamp Fullstack
 ....
 */

bootcampStudents.forEach { student in
    // Podemos utilizar la función: let studentBootcamps = filter(bootcamps: bootcamps, by: student)
    let studentBootcamps = bootcamps.filter { $0.students.contains { $0.name.compare(student.name) == .orderedSame } }
    
    print("Alumno \(student.name), \(studentBootcamps.count) bootcamps:")
    studentBootcamps.forEach { print("\($0.name)") }
    print()
}


print()
print("****** 10.19 ******")
// Escribir en consola el nombre de cada profesor, el número de sus bootcamps y el nombre de cada bootcamp
/* Ejemplo
 Profesor David, 2 bootcamps
 Bootcamps:
 Mobile
 Fullstack
 ....
 */

bootcampTeachers.forEach { teacher in
    let teacherBootcamps = bootcamps.filter { $0.teachers.contains { $0.name.compare(teacher.name) == .orderedSame } }
    
    print("Profesor \(teacher.name), \(teacherBootcamps.count) bootcamps:")
    teacherBootcamps.forEach { print("\($0.name)") }
    print()
}


print()
print("****** 10.20 ******")
// Escribir en consola el nombre de cada alumno, el número de sus bootcamps, el nombre de cada bootcamp,
// y el nombre de cada profesor de cada bootcamp
/* Ejemplo
 Alumno Adrián, 2 bootcamps
 Bootcamp Mobile, profesor [David]
 Bootcamp Fullstack, profesor [Carlos, Sara]
 ....
 */

bootcampStudents.forEach { student in
    // Utilizamos la función filter, nos devuelve una lista de bootcamps
    // filtrada por que contengan al 'student'
    let studentBootcamps = filter(bootcamps: bootcamps, by: student)
    
    print("Alumno \(student.name), \(studentBootcamps.count) bootcamps:")
    studentBootcamps.forEach { print("\($0.name), profesores \($0.teachers)") }
    print()
}
