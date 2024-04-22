//
//  StudentsModel.swift
//  HW16ContactsApp
//
//  Created by telkanishvili on 12.04.24.
//

import UIKit

enum Gender {
    case male
    case female
}

struct Student {
    let name: String
    let hobby: String
    let gender: Gender
    let age: Int
    let avatar: UIImage
}

let femaleAvatarNames = ["Avatar Image-0 Female", "Avatar Image-1 Female", "Avatar Image-2 Female", "Avatar Image-3 Female"]
let maleAvatarNames = ["Avatar Image-4 Male", "Avatar Image-5 Male", "Avatar Image-6 Male", "Avatar Image-7 Male"]


let students: [Student] = [
    Student(name: "Nodar Ghachava", hobby: "Reading", gender: .male, age: 20, avatar: UIImage(named: maleAvatarNames[0])!),
    Student(name: "Elene Donadze", hobby: "Painting", gender: .female, age: 22, avatar: UIImage(named: femaleAvatarNames[0])!),
    Student(name: "Temuri Chitashvili", hobby: "Swimming", gender: .male, age: 19, avatar: UIImage(named: maleAvatarNames[1])!),
    Student(name: "Irina Datoshvili", hobby: "Dancing", gender: .female, age: 21, avatar: UIImage(named: femaleAvatarNames[1])!),
    Student(name: "Ana Ioramashvili", hobby: "Gardening", gender: .female, age: 20, avatar: UIImage(named: femaleAvatarNames[2])!),
    Student(name: "Nini Bardavelidze", hobby: "Playing guitar", gender: .female, age: 22, avatar: UIImage(named: femaleAvatarNames[3])!),
    Student(name: "Barbare Tepnadze", hobby: "Photography", gender: .female, age: 19, avatar: UIImage(named: femaleAvatarNames[0])!),
    Student(name: "Mariam Sreseli", hobby: "Traveling", gender: .female, age: 21, avatar: UIImage(named: femaleAvatarNames[1])!),
    Student(name: "Valeri Mekhashishvili", hobby: "Playing chess", gender: .male, age: 20, avatar: UIImage(named: maleAvatarNames[3])!),
    Student(name: "Zuka Papuashvili", hobby: "Hiking", gender: .male, age: 31, avatar: UIImage(named: maleAvatarNames[0])!),
    Student(name: "Nutsa Beriashvili", hobby: "Singing", gender: .female, age: 23, avatar: UIImage(named: femaleAvatarNames[1])!),
    Student(name: "Luka Kharatishvili", hobby: "Football", gender: .male, age: 20, avatar: UIImage(named: maleAvatarNames[2])!),
    Student(name: "Data Robakidze", hobby: "Chess", gender: .male, age: 19, avatar: UIImage(named: maleAvatarNames[3])!),
    Student(name: "Nik'a Kakhniashvili", hobby: "Basketball", gender: .male, age: 21, avatar: UIImage(named: maleAvatarNames[0])!),
    Student(name: "Sandro Gelashvili", hobby: "Cycling", gender: .male, age: 22, avatar: UIImage(named: maleAvatarNames[1])!),
    Student(name: "Ana Namgaladze", hobby: "Running", gender: .female, age: 20, avatar: UIImage(named: femaleAvatarNames[2])!),
    Student(name: "Bakar Kharabadze", hobby: "Surfing", gender: .male, age: 21, avatar: UIImage(named: maleAvatarNames[3])!),
    Student(name: "Archil Menabde", hobby: "Gaming", gender: .male, age: 22, avatar: UIImage(named: maleAvatarNames[0])!),
    Student(name: "Tamuna Kakhidze", hobby: "Cooking", gender: .female, age: 23, avatar: UIImage(named: femaleAvatarNames[1])!),
    Student(name: "Giorgi Michitashvili", hobby: "Reading", gender: .male, age: 20, avatar: UIImage(named: maleAvatarNames[2])!),
    Student(name: "Salome Topuria", hobby: "Painting", gender: .female, age: 21, avatar: UIImage(named: femaleAvatarNames[3])!),
    Student(name: "Luka Gujejiani", hobby: "Swimming", gender: .male, age: 19, avatar: UIImage(named: maleAvatarNames[0])!),
    Student(name: "Gega Tatulishvili", hobby: "Dancing", gender: .male, age: 20, avatar: UIImage(named: maleAvatarNames[1])!),
    Student(name: "Raisa Badalova", hobby: "Singing", gender: .female, age: 22, avatar: UIImage(named: femaleAvatarNames[2])!),
    Student(name: "Aleksandre Saroiani", hobby: "Photography", gender: .male, age: 23, avatar: UIImage(named: maleAvatarNames[3])!),
    Student(name: "Begi Kopaliani", hobby: "Gaming", gender: .male, age: 20, avatar: UIImage(named: maleAvatarNames[0])!),
    Student(name: "Akaki Titberidze", hobby: "Reading", gender: .male, age: 21, avatar: UIImage(named: maleAvatarNames[1])!),
    Student(name: "Sandro Kupatadze", hobby: "Football", gender: .male, age: 22, avatar: UIImage(named: maleAvatarNames[2])!),
    Student(name: "Gvantsa Gvagvalia", hobby: "Painting", gender: .female, age: 23, avatar: UIImage(named: femaleAvatarNames[3])!),
    Student(name: "Vano Kvakhadze", hobby: "Swimming", gender: .male, age: 20, avatar: UIImage(named: maleAvatarNames[3])!)
]

let phoneOwner =  Student(name: "Tornike Elkanishvili", hobby: "Singing", gender: .male, age: 21, avatar: UIImage(named: maleAvatarNames[2])!)
