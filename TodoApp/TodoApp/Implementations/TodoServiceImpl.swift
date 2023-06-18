//
//  TodoServiceImpl.swift
//  TodoApp
//
//  Created by SHIN YOON AH on 2023/06/18.
//

import Foundation

class TodoServiceImpl: TodoService {

    // MARK: - property

    private var todoItems: [Todo] = []
    private let repository: Repository

    // MARK: - init

    init(repository: Repository) {
        self.repository = repository
        self.todoItems = repository.load()
    }

    deinit {
        self.repository.save(todos: self.todoItems)
    }

    // MARK: - func

    func create(title: String) {
        let todo = Todo(id: UUID().uuidString,
                        title: title,
                        done: false,
                        createAt: Date())
        self.todoItems.append(todo)
    }

    func count() -> Int {
        return self.todoItems.count
    }

    func item(at index: Int) -> Todo {
        return self.todoItems[index]
    }
}

extension TodoServiceImpl: Toggable {
    func toggle(withId id: String) {
        if let found = self.todoItems.enumerated().first(where: { $0.element.id == id}) {
            let index = found.offset
            var todo = found.element
            todo.done = !todo.done
            self.todoItems[index] = todo
        }
    }
}

