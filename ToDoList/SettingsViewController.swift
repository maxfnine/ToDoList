//
//  SettingsViewController.swift
//  ToDoList
//
//  Created by My mac on 12/09/2026.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var appThemeLabel: UILabel!
    @IBOutlet weak var settingsTitleLabel: UILabel!
    @IBOutlet weak var modalView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTitleLabel.font = UIFont.style(.h1)
        appThemeLabel.font = UIFont.style(.secondaryText)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        modalView.layer.cornerRadius = 5
    }

    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow
        }
        
        if sender.selectedSegmentIndex == 0 {
            window?.overrideUserInterfaceStyle = .light
        }else if sender.selectedSegmentIndex == 1{
            window?.overrideUserInterfaceStyle = .dark
        }else{
            window?.overrideUserInterfaceStyle = .unspecified
        }
    }
}
