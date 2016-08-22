//
//  TaskService.swift
//  SwiftMVP
//
//  Created by José Manuel Rabasco de Damas on 19/8/16.
//  Copyright © 2016 José Manuel Rabasco de Damas. All rights reserved.
//

import Foundation

protocol TaskService {
    func getTasks(callback:([Task]) -> Void)
}