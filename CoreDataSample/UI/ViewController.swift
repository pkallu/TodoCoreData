//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Pragathi Kallu on 10/3/19.
//  Copyright © 2019 Pragathi Kallu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableViewTodo:UITableView!
    lazy var todos: [Todo] = {
        return Todo.getTodos()
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if tableViewTodo != nil {
            tableViewTodo.reloadData()
        }
        DispatchQueue.global(qos: .background).async {
            let todolist = Todo.getTodos()
            DispatchQueue.main.async {
                print(todolist)
            }
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    private func setUpUI() {
        title = "Todos"
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = todos[indexPath.row].todo
        return cell
    }
    
}

