//
//  Task.swift
//  SwiftMVP
//
//  Created by José Manuel Rabasco de Damas on 19/8/16.
//  Copyright © 2016 José Manuel Rabasco de Damas. All rights reserved.
//

import Foundation

enum TaskStatus {
    case PENDING
    case COMPLETED
    
    var description : String {
        switch self {
            case .PENDING: return NSLocalizedString("Pending", comment: "");
            case .COMPLETED: return NSLocalizedString("Completed", comment: "");
        }
    }
}

struct Task {
    let title: String
    let status: TaskStatus
}

