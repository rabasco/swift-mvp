//
//  TaskListViewController.swift
//  SwiftMVP
//
//  Created by José Manuel Rabasco de Damas on 19/8/16.
//  Copyright © 2016 José Manuel Rabasco de Damas. All rights reserved.
//

import UIKit
import Swinject

class TaskListViewController: UIViewController {
    
    @IBOutlet weak var emptyView: UIView?
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    var presenter: TaskListPresenter?
    private var tasksToDisplay = [TaskListViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        activityIndicator?.hidesWhenStopped = true
        emptyView?.hidden = true
        
        presenter?.attachView(self)
        presenter?.getTasks()
    }
}

extension TaskListViewController: TaskListView {
    
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func setTasks(tasks: [TaskListViewData]) {
        tasksToDisplay = tasks
        tableView?.hidden = false
        emptyView?.hidden = true
        tableView?.reloadData()
    }
    
    func setEmptyTasks() {
        tableView?.hidden = true
        emptyView?.hidden = false
    }
}

extension TaskListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksToDisplay.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "UserCell")
        let taskListViewData = tasksToDisplay[indexPath.row]
        cell.textLabel?.text = taskListViewData.title
        cell.detailTextLabel?.text = taskListViewData.status
        
        return cell
    }
}
