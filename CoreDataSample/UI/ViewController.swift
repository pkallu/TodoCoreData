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
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MySegueId" {
            if let addTodoViewController = segue.destination as? AddTodoViewController {
                addTodoViewController.delegate = self
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //This is to test multi threading issue.
//        DispatchQueue.global(qos: .background).async {
//            let todolist = Todo.getTodos()
//            DispatchQueue.main.async {
//                print(todolist)
//            }
//        }

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
        return  Todo.getTodos().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text =  Todo.getTodos()[indexPath.row].todo
        return cell
    }
    
}


extension ViewController: AddTodoProtocol {
    func didAddTodo() {
        tableViewTodo.reloadData()
    }    
}
