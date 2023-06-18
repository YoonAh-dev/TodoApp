//
//  TodoTableViewCell.swift
//  TodoApp
//
//  Created by SHIN YOON AH on 2023/06/18.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    static let identifier = "TodoTableViewCell"

    @IBOutlet weak var isDone: UISwitch!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var updatedAt: UILabel!

    private var todo: Todo?
    var toggable: Toggable?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setTodo(_ todo: Todo) {
        self.todo = todo
    }

    @IBAction func onToggle(_ sender: Any) {
        self.toggable?.toggle(withId: self.todo?.id ?? "")
    }
}
