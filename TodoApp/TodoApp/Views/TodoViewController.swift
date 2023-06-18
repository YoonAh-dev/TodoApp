//
//  TodoViewController.swift
//  TodoApp
//
//  Created by SHIN YOON AH on 2023/06/18.
//

import UIKit

class TodoViewController: UITableViewController {

    typealias TodoToggableServie = TodoService & Toggable

    let service: TodoToggableServie = Inject(TodoToggableServie.self)!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onCreateTodo(_ sender: Any) {
        let title = "test"
        self.service.create(title: title)
        self.tableView.reloadData()
    }
}

extension TodoViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.service.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier, for: indexPath) as? TodoTableViewCell else { return UITableViewCell() }
        let index = indexPath.row
        let item = self.service.item(at: index)
        cell.setTodo(item)
        cell.toggable = service
        return cell
    }
}
