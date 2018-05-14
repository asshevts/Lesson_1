//
//  LoginFormController.swift
//  Lesson_1
//
//  Created by Анастасия Шевцова on 11.05.2018.
//  Copyright © 2018 Анастасия Шевцова. All rights reserved.
//

import UIKit

 struct Credentials {
    static let validUsername = "admin"
    static let validPassword = "123456"
}

 class LoginFormController: UIViewController {

    
    
    @IBOutlet weak  var userTextField: UITextField!
    
    @IBOutlet weak  var passwordTextFiled: UITextField!
    
    @IBOutlet weak  var scrollView: UIScrollView!
    
    override  func viewDidLoad(){
        super.viewDidLoad()
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action:
            #selector(self.hideKeyboard))
        // присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?){    }

    
    
    
   override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    let isValid = checkAuth()
    
    if !isValid {
        let alert = UIAlertController(title: "Erroe", message: "Неверно указан логин/пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    return isValid
    }
    @IBAction  func LoginButtonTapped(_ sender: Any) {
    }
    func checkAuth() -> Bool {
        
    guard let login = userTextField.text, let password = passwordTextFiled.text else {
          return false
       }
       if login == Credentials.validUsername && password == Credentials.validPassword{
            return true
        }
          return false
    }

    
    
    @objc  func hideKeyboard() {
       self.scrollView?.endEditing(true)
   }

    
    //​к​огда​ к​лавиатура​​ появляется

    @objc func keyboardWasShown(notification: Notification) {
    // получаем размер клавиатуры
    let info = notification.userInfo! as NSDictionary
    let kbSize = (info.value(forKey:UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
    let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
    // добавляем отступ снизу равный размеру клавиатуры
    self.scrollView?.contentInset = contentInsets
    scrollView?.scrollIndicatorInsets = contentInsets

    }
// когда коавиатура изчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
      // устанавливаем отступ снизу равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  // подписываемся на уведомление когда клавиатура появляется
NotificationCenter.default.addObserver(self,selector: #selector(self.keyboardWasShown),name: NSNotification.Name.UIKeyboardWillShow,object:nil)
  // когда изчезает
NotificationCenter.default.addObserver(self,selector:#selector(self.keyboardWillBeHidden(notification:)),name:NSNotification.Name.UIKeyboardWillHide, object: nil)
  //     navigationController?.setNavigationBarHidden(true, animated: true)
    }
// отписка при наступлении события исчезновения​ к​онтроллера​​ с​​ экрана.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//         navigationController?.setNavigationBarHidden(false, animated: true)

NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object:nil)

NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }




}





    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


