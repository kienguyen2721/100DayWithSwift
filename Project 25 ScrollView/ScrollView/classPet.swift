//
//  classPet.swift
//  ScrollView
//
//  Created by Nguyễn Trung Kiên on 18/11/2022.
//

import Foundation

class DogAndCat {
    var nameOfPet: String = ""
    var image: String = ""
    var noteOfPet: String = ""
    var hashtagOfPet: String = ""
    var numberLikeOfPet: String = ""
    
    init(nameOfPet: String,image: String,noteOfPet: String,hashtagOfPet: String,numberLikeOfPet: String){
        self.nameOfPet = nameOfPet
        self.image = image
        self.hashtagOfPet = hashtagOfPet
        self.noteOfPet = noteOfPet
        self.numberLikeOfPet = numberLikeOfPet
    }
}
