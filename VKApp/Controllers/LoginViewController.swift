//
//  ViewController.swift
//  VKApp
//
//  Created by Олеся Бабич on 11.10.22..
//

import UIKit

class LoginViewController: UIViewController {
    
    let session = Session.sharedInstance
    let service = Service()
    var contacts = [User]()

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingPointView1: UIView!
    @IBOutlet weak var loadingPointView2: UIView!
    @IBOutlet weak var loadingPointView3: UIView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.isHidden = true
        
        print(session.token)
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    
        loadingPointView1.layer.cornerRadius = loadingPointView1.frame.height / 2
        loadingPointView2.layer.cornerRadius = loadingPointView2.frame.height / 2
        loadingPointView3.layer.cornerRadius = loadingPointView3.frame.height / 2
        


//        service.getGroupsBySearch(token: session.token)
        
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    @IBAction func enterButtonPressed(_ sender: Any) {

        loadingView.backgroundColor = .clear
        loadingView.isHidden = false
        animateView()
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        if !checkResult { showLoginError()
        }
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else {
            return false
        }
        if login == "login" && password == "123" {
            return true
        } else {
            return false
        }
        

    }
    
    func showLoginError() {
        let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    
    func animateView() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.autoreverse, .repeat]) { [weak self] in
            guard let self = self else { return }
            self.loadingPointView1.alpha = 0
        }
        
        UIView.animate(withDuration: 1,
                       delay: 0.3,
                       options: [.autoreverse, .repeat]) { [weak self] in
            guard let self = self else { return }
            self.loadingPointView2.alpha = 0
        }
        
        UIView.animate(withDuration: 1,
                       delay: 0.6,
                       options: [.autoreverse, .repeat]) { [weak self] in
            guard let self = self else { return }
            self.loadingPointView3.alpha = 0
        }
        
    }
    
}



