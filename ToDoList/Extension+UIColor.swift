//
//  Colors.swift
//  ToDoList
//
//  Created by My mac on 11/09/2026.
//

import Foundation
import UIKit

extension UIColor{
    static var workColor:UIColor{
        UIColor(named: "work")!
    }
     
    static var secondaryWorkColor:UIColor{
        UIColor(named: "work")!.withAlphaComponent(0.2)
    }
    
    static var exerciseColor:UIColor{
        UIColor(named: "exercise")!
    }
    
    static var secondaryExerciseColor:UIColor{
        UIColor(named: "exercise")!.withAlphaComponent(0.2)
    }
    
    static var studyColor:UIColor{
        UIColor(named: "study")!
    }
    
    static var secondaryStudyColor:UIColor{
        UIColor(named: "study")!.withAlphaComponent(0.2)
    }
    
    static var secondaryLinkColor:UIColor{
        UIColor(named: "secondaryLink")!
    }
    
    
}
