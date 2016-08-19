//
//  TaskListPresenter.swift
//  SwiftMVP
//
//  Created by José Manuel Rabasco de Damas on 19/8/16.
//  Copyright © 2016 José Manuel Rabasco de Damas. All rights reserved.
//

import Foundation

struct TaskListViewData {
    let title: String
    let status: String
}

protocol TaskListView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setTasks(tasks: [TaskListViewData])
    func setEmptyTasks()
}

class TaskListPresenter {
    let taskService: TaskService?
    weak private var view: TaskListView?
    
    init(taskService: TaskService) {
        self.taskService = taskService
    }
    
    func attachView(view: TaskListView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getTasks() {
        self.view?.startLoading()
        taskService?.getTasks { (tasks) in
            self.view?.finishLoading()
            if (tasks.count == 0) {
                self.view?.setEmptyTasks()
            } else {
                let mappedTasks = tasks.map{
                    return TaskListViewData(title: "\($0.title)", status: "\($0.status.description)")
                }
                self.view?.setTasks(mappedTasks)
            }
        }
    }
}

