//
//  Repository.swift
//  TodoApp
//
//  Created by SHIN YOON AH on 2023/06/18.
//

import Foundation

protocol Repository {
    func load() -> [Todo]
    func save(todos: [Todo])
}
