//
//  AddTodoViewController.swift
//  CoreDataSample
//
//  Created by Pragathi Kallu on 10/3/19.
//  Copyright © 2019 Pragathi Kallu. All rights reserved.
//

import UIKit

class AddTodoViewController: ViewController {
    @IBOutlet weak var textViewTodo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        title = "Add"
    }

    @IBAction func saveTodo(_ sender: Any) {
        guard let text = textViewTodo.text else {
            print("Enter Todo")
            return
        }
        Todo.createTodo(todoText: text)
        self.dismiss(animated: true, completion: nil)
    }
}
