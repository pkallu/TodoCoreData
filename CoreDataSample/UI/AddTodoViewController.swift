//
//  AddTodoViewController.swift
//  CoreDataSample
//
//  Created by Pragathi Kallu on 10/3/19.
//  Copyright © 2019 Pragathi Kallu. All rights reserved.
//

import UIKit

protocol AddTodoProtocol: AnyObject {
    func didAddTodo()
}

class AddTodoViewController: ViewController {
    @IBOutlet weak var textViewTodo: UITextView!
    weak var delegate: AddTodoProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        title = "Add"
        textViewTodo.layer.cornerRadius = 3
        textViewTodo.layer.borderColor = UIColor.lightGray.cgColor
        textViewTodo.layer.borderWidth = 0.5
    }

    @IBAction func saveTodo(_ sender: Any) {
        guard let text = textViewTodo.text else {
            print("Enter Todo")
            return
        }
        Todo.createTodo(todoText: text)
        delegate?.didAddTodo()
        self.dismiss(animated: true, completion: nil)
    }
}
