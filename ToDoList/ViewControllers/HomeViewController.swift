//
//  ViewController.swift
//  ToDoList
//
//  Created by My mac on 22/08/2026.
//

import UIKit
import os
/// The main screen of the application. This is where see all the tasks and this is starting point for adding new tasks.
class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleView: UIView!
    var tasks: [Task] = [
        .init(
            id: UUID().uuidString,
            category: .study,
            caption: "First sample Task",
            date: Date(),
            isComplete: false
        ),
        .init(
            id: UUID().uuidString,
            category: .exercise,
            caption: "Second sample Task",
            date: Date(),
            isComplete: false
        ),
        .init(
            id: UUID().uuidString,
            category: .work,
            caption: "Third sample Task",
            date: Date(),
            isComplete: false
        )
    ]
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.link
        button.tintColor = UIColor.white
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(
            1.4,
            1.4,
            1.4
        )
        button.addTarget(
            self,
            action: #selector(addButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotifications()
        setupView()

    }
    
    private func setupView(){
        titleView.clipsToBounds = true
        titleView.layer.cornerRadius = 24
        titleView.layer.maskedCorners = [
            .layerMaxXMaxYCorner, .layerMinXMaxYCorner,
        ]
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension

        view.addSubview(addButton)
        
    }
    
    /// We setup obserevers for notification when new task created or existing edited
    private func setupNotifications(){
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(createTask(_:)),
            name: NSNotification.Name("derevyan.arkadiy.createTask"),
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(editTask(_:)),
            name: NSNotification.Name("derevyan.arkadiy.editTask"),
            object: nil
        )
    }

    /**
     This responds to task that has been edited from the NewTaskViewController
            - Parameters:
                - notification: The notification object from the derevyan.arkadiy.editTask
     */
    @objc
    func editTask(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let taskToUpdate = userInfo["updateTask"] as? Task
        else {
            return
        }
        guard
            let taskIndex = tasks.firstIndex(where: { $0.id == taskToUpdate.id }
            )
        else {
            return
        }
        print(taskToUpdate.category.rawValue)
        tasks[taskIndex] = taskToUpdate
        tableView.reloadData()

    }

    /**
     This responds to task that has been created from the NewTaskViewController
            - Parameters:
                - notification: The notification object from the derevyan.arkadiy.createTask
     */
    @objc
    func createTask(_ notification: Notification) {
    
        os_log("Task received by notification observer",type: .info)
        guard let userInfo = notification.userInfo,
            let task = userInfo["newTask"] as? Task
        else {
            return
        }

        tasks.append(task)
        tableView.reloadData()
        os_log("Task successfully created.",type: .info)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let safeAreaBottom = view.safeAreaInsets.bottom
        let width: CGFloat = 60
        let height: CGFloat = 60
        let xPos = view.frame.width / 2 - width / 2
        let yPos = view.frame.height - height - safeAreaBottom
        addButton.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        addButton.layer.cornerRadius = width / 2
    }

    @objc
    func addButtonTapped() {
        let newTaskViewController = NewTaskViewController()
        present(newTaskViewController, animated: true)
    }

    @IBAction func settingsButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "SettingsSegue", sender: nil)
    }
}

//MARK: - Methods conforming to UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let task = tasks[indexPath.row]
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: TaskTableViewCell.identifier,
                for: indexPath
            ) as! TaskTableViewCell
        cell.configure(withTask: task, delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

//MARK: - Methods conforming to TaskTableViewCellDelegate
extension HomeViewController: TaskTableViewCellDelegate {
    func editTask(id: String) {
        guard let task = tasks.first(where: { $0.id == id }) else {
            return
        }
        
        let newTaskViewController = NewTaskViewController(task: task)
        present(newTaskViewController, animated: true)
    }

    func markTask(id: String, complete: Bool) {
        guard let taskIndex = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }

        tasks[taskIndex].isComplete = complete
        tableView.reloadData()
    }

}
