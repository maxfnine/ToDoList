//
//  CategoryModel.swift
//  ToDoList
//
//  Created by My mac on 22/08/2026.
//

import Foundation
import UIKit

enum Category:String,CaseIterable{
    case work = "Work",study = "Study",exercise = "Exercise"
    var color:UIColor{
        switch self{
        case .work:
            return UIColor.workColor
        case .study:
            return UIColor.studyColor
        case .exercise:
            return UIColor.exerciseColor
        }
    }
    
    var secondaryColor:UIColor{
        switch self{
        case .work:
            return UIColor.secondaryWorkColor
        case .study:
            return UIColor.secondaryStudyColor
        case .exercise:
            return UIColor.secondaryExerciseColor
        }
    }
//    func color()->UIColor{
//        switch self{
//        case .work:
//            return UIColor.workColor
//        case .study:
//            return UIColor.studyColor
//        case .exercise:
//            return UIColor.exerciseColor
//        }
//    }
}
