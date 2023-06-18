//
//  Todo.swift
//  TodoApp
//
//  Created by SHIN YOON AH on 2023/06/18.
//

import Foundation

struct Todo: Identifiable, Codable {
    let id: String
    let title: String
    var done: Bool
    let createAt: Date
}
