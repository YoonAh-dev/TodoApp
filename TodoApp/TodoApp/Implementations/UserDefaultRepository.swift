//
//  UserDefaultRepository.swift
//  TodoApp
//
//  Created by SHIN YOON AH on 2023/06/18.
//

import Foundation

class UserDefaultRepository: Repository {
    private let TodoKey = "todos"

    func load() -> [Todo] {
        guard let json = UserDefaults.standard.string(forKey: TodoKey),
              let data = json.data(using: .utf8) else {
            return []
        }
        return (try? JSONDecoder().decode([Todo].self, from: data)) ?? []
    }

    func save(todos: [Todo]) {
        guard let data = try? JSONEncoder().encode(todos),
              let json = String(data: data, encoding: .utf8) else { return }
        UserDefaults.standard.set(json, forKey: TodoKey)
    }
}
