//
//  NewTaskViewController.swift
//  ToDoList
//
//  Created by My mac on 22/08/2026.
//

import UIKit

//TODO: - Move to separate protocols file
/**NewTaskDelegate link links the NewTaskViewController and the NewTaskModalView. This helps the NewTaskViewController when to dismiss and present alert.
 */
protocol NewTaskDelegate:AnyObject {
    /// Dismiss new task modal view
    func closeView()
    
    /**
     This method shows alert if invalid data is entered by user.
     */
    func presentErrorAlert(title:String,message:String)
}

/// This class is responsible for creation of the new task
class NewTaskViewController: UIViewController {
    lazy var modalView: NewTaskModalView = {
        let modalWidth: CGFloat = view.frame.width - CGFloat(30)
        let modalHeight: CGFloat = 430

        let frame = CGRect(
            x: 15,
            y: view.center.y - (modalHeight / 2),
            width: modalWidth,
            height: modalHeight
        )
        let modalView = NewTaskModalView(frame: frame,task: task)
        modalView.delegate = self
        return modalView
    }()
    
    private var task:Task?
    
    
    init(task:Task? = nil) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        self.task = task
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        view.addSubview(modalView)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 2,options: [.curveEaseOut]) {
            self.modalView.transform = CGAffineTransform.identity
        }
        
       
    }

   

}


//MARK: - Conformance to New Task Delegate
extension NewTaskViewController:NewTaskDelegate{
    func presentErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func closeView() {
        dismiss(animated: true)
    }
}
