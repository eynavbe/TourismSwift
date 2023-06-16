//
//  LoginViewController.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 04/08/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
class LoginViewController: BaseViewController ,GIDSignInUIDelegate{
//    let inputsContainerView : UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.white
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.layer.cornerRadius = 5
//        view.layer.masksToBounds = true
//        return view
//    }()
//    let  loginRegisterButton : UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor  = UIColor.lightGray
//        button.setTitle("הרשמה", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        return button
//    }()
//    let nameTextField: UITextField = {
//        let tf = UITextField()
//        tf.placeholder = "שם"
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        return tf
//    }()
//    let nameSeparatorView:UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.lightGray
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    let emailTextField: UITextField = {
//        let tf = UITextField()
//        tf.placeholder = "אימייל"
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        return tf
//    }()
//    let emailSeparatorView:UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.lightGray
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    let passwordTextField: UITextField = {
//        let tf = UITextField()
//        tf.placeholder = "סיסמא"
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        return tf
//    }()
//    let profileImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "star")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.addSlideMenuButton()
//        view.backgroundColor = UIColor.blue
//
//        view.addSubview(inputsContainerView)
//        view.addSubview(loginRegisterButton)
//        view.addSubview(profileImageView)
//        setupInputsContainerView()
//       setupLoginRegisterButton()
//        setupPorfileImageView()
//    }
//    func setupInputsContainerView(){
//        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
//        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//
//        inputsContainerView.addSubview(nameTextField)
//        inputsContainerView.addSubview(nameSeparatorView)
//        inputsContainerView.addSubview(emailTextField)
//        inputsContainerView.addSubview(emailSeparatorView)
//        inputsContainerView.addSubview(passwordTextField)
//
//        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
//        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.rightAnchor, constant: 12).isActive = true
//        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
//
//        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//        nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor,multiplier: 1/3).isActive = true
//
//        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
//        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
//        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
//
//        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
//        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.rightAnchor, constant: 12).isActive = true
//        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
//        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//        emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor,multiplier: 1/3).isActive = true
//
//        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
//        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
//        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
//
//        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
//        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
//        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//        passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor,multiplier: 1/3).isActive = true
//    }
//    func setupLoginRegisterButton() {
//
//        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
//        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }
//    func setupPorfileImageView() {
//        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        profileImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
//        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//    }
//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return .lightContent
//    }
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var login: UIButton!
    @IBAction func dismiss(_ sender: UIButton) {
        dismissDialog()
    }
    @IBAction func segmentedLoginRegister(_ sender: UISegmentedControl) {
        let title = sender.titleForSegment(at: sender.selectedSegmentIndex)
        login.setTitle(title, for: .normal)
        
        if sender.selectedSegmentIndex == 0 {
            dialogView.addSubview(googleButton)
        }else{
            googleButton.removeFromSuperview()
        }
        
    }
    //    let loginRegisterSegmentedControl: UISegmentedControl = {
//        let sc = UISegmentedControl(items: ["Login","Register"])
//       sc.translatesAutoresizingMaskIntoConstraints = false
//        sc.tintColor = UIColor.white
//        return sc
//    }()
    
    func dismissDialog() {
//        guard let stack = dialogView.subviews[0] as? UIStackView else {return}
//        for v in stack.subviews {
//            if let text = v as? UITextField{
//                text.text = ""
//            }
//        }
        
        UIView.animate(withDuration: 0.4, animations: {
            self.dialogView.center = CGPoint(x: self.view.frame.midX, y: -self.view.frame.height/2)
        }) { (isCompleted) in
            self.dialogView.removeFromSuperview()
        }
        visualEffectView.isHidden = true
        isVisible = false
    }
    let googleButton :UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black
        button.setTitle("logIn Google", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
        }()
   
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet var dialogView: UIView!
    var isVisible = false
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GIDSignIn.sharedInstance()?.shouldFetchBasicProfile = true;
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    func createUser(withEmail email: String, password: String)  {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error{
                let alert = UIAlertController(title: "הרשמה", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "הבנתי", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            guard let uid = result?.user.uid else{return}
            let values = ["email":email]
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: {(error,ref) in
                if let error = error {
                    let alert = UIAlertController(title: "הרשמה", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "הבנתי", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                let alert = UIAlertController(title: "הרשמה", message: "נרשמת בהצלחה", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "הבנתי", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
        }
    }
    func logUserIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error{
                let alert = UIAlertController(title: "כניסה", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "הבנתי", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            let alert = UIAlertController(title: "כניסה", message: "נכנסת בהצלחה", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "הבנתי", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func loginOrSignup(_ sender: UIButton) {
        guard let email = email.text else {return}
        guard let password = password.text else {return}
        if sender.titleLabel?.text == "כניסה" {
            logUserIn(withEmail: email, password: password)
        }
        else{
            createUser(withEmail: email, password: password)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser?.uid == nil{
            print("הוא לא נרשם")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dialogView.center = CGPoint(x: self.view.frame.midX, y: -self.view.frame.height/2)
            UIView.animate(withDuration: 0.3){ [weak self] in
                self?.dialogView.center = self?.view.center ?? CGPoint.zero
            }
            self.view.addSubview(self.dialogView)
            
           
            self.dialogView.layer.cornerRadius = 10
            self.dialogView.layer.shadowColor = UIColor.black.cgColor
            self.dialogView.layer.shadowOffset = CGSize(width: 2, height: 2)
            self.dialogView.layer.shadowOpacity = 1
            self.dialogView.layer.shadowRadius = 10
            self.dialogView.layer.masksToBounds = false
            
            self.isVisible = true
            self.visualEffectView.isHidden = false
            
            
//            let loginRegisterSegmentedControl: UISegmentedControl = {
//                let sc = UISegmentedControl(items: ["Login","Register"])
//                sc.translatesAutoresizingMaskIntoConstraints = false
//                sc.tintColor = UIColor.white
//                return sc
//            }()
//                        loginRegisterSegmentedControl.frame = CGRect(x:  self.dialogView.frame.minX , y: self.dialogView.frame.minY, width: 400, height: 30)
            
//            loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: self.dialogView.centerXAnchor).isActive = true
//                    loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: self.dialogView.topAnchor, constant: -12).isActive = true
//            loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: self.dialogView.widthAnchor).isActive = true
//                    loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
//            
//                        self.dialogView.addSubview(loginRegisterSegmentedControl)
            //        dialogView.center = view.center
            
            
            
            self.googleButton.frame = CGRect(x:  self.login.frame.minX , y: self.login.frame.maxY + 8, width: self.login.frame.width, height: self.login.frame.height )
            self.dialogView.addSubview(self.googleButton)
            self.googleButton.addTarget(self, action: #selector(self.singinsss), for: .touchUpInside)
//            GIDSignIn.sharedInstance()?.uiDelegate = self
        }
        
    }
    @objc func singinsss(){
        GIDSignIn.sharedInstance()?.signIn()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LoginViewController: GIDSignInDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("ss")
        if let error = error {
            print(error)
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("שגיאה ביצירה משתמש בfirebase",error)
                return
            }
            guard let uid = Auth.auth().currentUser?.uid else{return}
            let emailGoogle = user.profile.email
            
           let values = ["email":emailGoogle]
            Database.database().reference().child("users").child(uid).updateChildValues(values as [AnyHashable : Any], withCompletionBlock: {(error,ref) in
                if let error = error {
                    let alert = UIAlertController(title: "כניסה דרך גוגל", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "הבנתי", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                let alert = UIAlertController(title: "כניסה דרך גוגל", message: "נכנסת בהצלחה", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "הבנתי", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
        }
    }
}
