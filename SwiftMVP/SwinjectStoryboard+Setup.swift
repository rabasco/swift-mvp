//
//  SwinjectStoryboard+Setup.swift
//  SwiftMVP
//
//  Created by José Manuel Rabasco de Damas on 19/8/16.
//  Copyright © 2016 José Manuel Rabasco de Damas. All rights reserved.
//

import Swinject

extension SwinjectStoryboard {
    class func setup() {
        
        defaultContainer.registerForStoryboard(TaskListViewController.self) { r, c in
            c.presenter = r.resolve(TaskListPresenter.self)
        }
        
        defaultContainer.register(TaskService.self) { _ in TaskService() }
        
        defaultContainer.register(TaskListPresenter.self.self) { r in
            TaskListPresenter(taskService: r.resolve(TaskService.self)!)
        }        
    }
}

