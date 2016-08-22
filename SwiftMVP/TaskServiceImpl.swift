//
//  TaskServiceImpl.swift
//  SwiftMVP
//
//  Created by José Manuel Rabasco de Damas on 22/8/16.
//  Copyright © 2016 José Manuel Rabasco de Damas. All rights reserved.
//

import Foundation

class TaskServiceImpl : TaskService {
    
    func getTasks(callback:([Task]) -> Void) {
        let tasks = [
            Task(title: "Task 1", status: TaskStatus.COMPLETED),
            Task(title: "Task 2", status: TaskStatus.PENDING),
            Task(title: "Task 3", status: TaskStatus.PENDING),
            ]
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        
        dispatch_after(delayTime, dispatch_get_main_queue(), {
            callback(tasks)
        })
    }
}