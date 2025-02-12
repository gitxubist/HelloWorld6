//
//  User.swift
//  HelloWorld6
//
//  Created by Evgeniy Morozov on 12.02.2025.
//

struct User {
    let login: String
    let password: String
}

struct Person {
    let name: String
    let familyName: String
    
    let creedential: User
    
    let image: String?
    
    let company: String
    let department: String
    let jobTitle: String
    
    let lifeHistory: String
    
    static let person: [Person] = [
        Person(
            name: "Evgeniy",
            familyName: "Morozov",
            creedential: .init(login: "1", password: "1"),
            image: "userImage",
            company: "company",
            department: "situation center",
            jobTitle: "data analyst",
            lifeHistory: """
            Evgeniy Morozov is a data analyst at company. 
            He is a passionate about data science and loves to explore new technologies.
            """)
    ]
}
