//
//  TaskModel.swift
//  ToDoList
//
//  Created by My mac on 28/08/2026.
//

import Foundation

struct Task:Identifiable {
    let id:String
    let category: Category
    let caption: String
    let date: Date
    var isComplete: Bool

}
