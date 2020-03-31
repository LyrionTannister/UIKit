//
//  ViewController.swift
//  notVK
//
//  Created by Roman on 31.03.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var userPasswordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    let notificationCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardDidChangeFrameNotification,
            object: nil)
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "loginSegue":
            let isAuth = login()
            if !isAuth {
                showErrorAlert()
            }
            return isAuth
        default:
            return true
        }
    }

    func login() -> Bool {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        return login == "root" && password == "toor"
    }

    func showErrorAlert() {
        // Создаем контроллер
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Введены неверные данные пользователя",
            preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alert.addAction(action)
        // Показываем UIAlertController
        present(alert, animated: true)
    }

    // swiftlint:disable force_cast
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        scrollBottomConstraint.constant = frame.height
    }
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollBottomConstraint.constant = 0
    }
    // swiftlint:enable force_cast
}


