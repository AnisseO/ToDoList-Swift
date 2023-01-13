//
//  todo.swift
//  TodoList
//
//  Created by Anisse Outssakki on 09/11/2022.
//

import Foundation
import UIKit

class MyTodo {
    var desc: String
    var nom: String
    var state: Bool
    var myDate: Date
    var priorite: String
    
    init (nom: String, desc: String, state: Bool, myDate: Date, priorite: String){
        self.desc = desc
        self.nom = nom
        self.state = state
        self.myDate = myDate
        self.priorite = priorite
    }
    
}
