//
//  TodoService.swift
//  TodoApp
//
//  Created by SHIN YOON AH on 2023/06/18.
//

import Foundation

protocol TodoService {
    func create(title: String)
    func count() -> Int
    func item(at index: Int) -> Todo
}
