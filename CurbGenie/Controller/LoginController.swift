//
//  LoginController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 11/25/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController, UITextFieldDelegate
{
    let filemgr = FileManager.default;
    var databasePath = NSString()
    let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true //  .barTintColor = UIColor.mainColor()
        
        view.addSubview(bgImageView)
        view.addSubview(logoImageView)
        view.addSubview(emailField)
        view.addSubview(passwordNameField)
        view.addSubview(loginButton)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(noAccountLabel)
        view.addSubview(goToRegisterButton)
        
        view.backgroundColor = UIColor.mainColor()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        setupUIContraints()
        
        let center: NotificationCenter = NotificationCenter.default
        center.removeObserver(self)
        center.addObserver(self, selector: #selector(self.getClientList), name: NSNotification.Name("getClientList"), object: nil)
    }
    
    let noAccountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Don't have an account?"
        label.font = UIFont (name: "Nunito-Regular", size: 16)
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var goToRegisterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: UIControlState())
        button.setTitleColor(.green, for: UIControlState())
        button.titleLabel?.font = UIFont (name: "Nunito-Regular", size: 16)
        button.addTarget(self, action: #selector(showRegisterController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return false
    }

    let bgImageView: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "bgWhite")
        view.image = image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let logoImageView: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "logo")
        view.image = image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailField: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "inputField")
        view.image = image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordNameField: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "inputField")
        view.image = image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white]) //custom placeholder
        tf.font = UIFont (name: "Nunito-Regular", size: 20)     //UIFont.boldSystemFont(ofSize: 16)
        tf.textColor = UIColor.white
        tf.textAlignment = .center
        tf.spellCheckingType = .no
        tf.autocorrectionType = .no
        tf.returnKeyType = UIReturnKeyType.done
        //add image to left of placeholder
        let image = UIImage(named: "emailIcon")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 18, height: 12))
        tf.leftViewMode = .always
        imageView.image = image
        tf.leftView = imageView
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = UIKeyboardType.emailAddress               //.default //DecimalPad //.NumberPad
        tf.autocorrectionType = UITextAutocorrectionType.no
        //tf.returnKeyType = .next
        tf.clearButtonMode = .whileEditing
        
        return tf
    }()
    
    let passwordTextField: UITextField = {
        
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tf.font = UIFont (name: "Nunito-Regular", size: 20) //UIFont.boldSystemFont(ofSize: 16)
        tf.isSecureTextEntry = true
        tf.textColor = .white
        tf.textAlignment = .center
        tf.returnKeyType = UIReturnKeyType.done
        //add image to left of placeholder
        let image = UIImage(named: "lockIcon")
        let imageView = UIImageView(frame: CGRect(x: 2, y: 0, width: 16, height: 20))
        imageView.image = image
        tf.leftViewMode = .always
        tf.leftView = imageView
        tf.translatesAutoresizingMaskIntoConstraints = false        
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.keyboardType = UIKeyboardType.default  //.DecimalPad //.NumberPad
        tf.clearButtonMode = .whileEditing
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("Login", for: UIControlState())
        button.setTitleColor(UIColor.mainColor(), for: UIControlState())
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont (name: "Nunito-Regular", size: 20)     //UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupUIContraints() {
        
        //background constraints
        bgImageView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        //logoImageView constraints
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -175).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 270).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        //emailField constraints
        emailField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 90).isActive = true
        emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        //passwordNameField constraints
        passwordNameField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 12).isActive = true
        passwordNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordNameField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordNameField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        //emailTextField constraints
        emailTextField.leftAnchor.constraint(equalTo: emailField.leftAnchor, constant: 16).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: emailField.centerYAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        //passwordTextField constraints
        passwordTextField.leftAnchor.constraint(equalTo: passwordNameField.leftAnchor, constant: 16).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: passwordNameField.centerYAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        //loginButton constraints
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 64).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        //noAccountLabel constraints
        noAccountLabel.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -12).isActive = true
        noAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -24).isActive = true
        noAccountLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        noAccountLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //goToRegisterButton constraints
        goToRegisterButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -12).isActive = true
        goToRegisterButton.leftAnchor.constraint(equalTo: noAccountLabel.rightAnchor, constant: 2).isActive = true
        goToRegisterButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        goToRegisterButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    //Main login function
    @objc func handleLogin() {
        
        /* guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        
        //create user in the Firebase database
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print(error)
                return
            }
        }
        
        print("Login successful") */
            
        var error_text = ""
        
        if  emailTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" ||
            (emailTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).range(of: "@") == nil && emailTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).range(of: ".") == nil)
        {
            error_text = error_text + "\nPlease enter Valid Email"
        }
        
        if passwordTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" || passwordTextField.text!.count < 6
        {
            error_text = error_text + "\nPlease enter Password of 6 characters or more"
        }
        
        if error_text == ""
        {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:
            {
                (authResult, error) in
                //self.hideSpinner {}
                
                guard let user = Auth.auth().currentUser, error == nil else // authResult?.user
                {
                    //self.showMessagePrompt(error!.localizedDescription)
                    print("2348 error!.localizedDescription \(error!.localizedDescription)")
                    
                    let alert = UIAlertController(title: "Oops!", message: "Something went wrong. Please try again. " + error!.localizedDescription, preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil ))
                    //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                    return
                }
                
                print("2359 user.uid \(user.uid)")
                
                HomeModel.getInstance().userId = user.uid;
                HomeModel.getInstance().download_progress = 1
                HomeModel.getInstance().showSyncAlert()
                HomeModel.getInstance().Email = self.emailTextField.text!
                HomeModel.getInstance().Password = self.passwordTextField.text!
                HomeModel.getInstance().page = "getClientList"
                HomeModel.getInstance().method = "getToken"
                HomeModel.getInstance().downloadItems()
                
                /* self.ref.child("users").child(user.uid).observeSingleEvent(of: .value, with:
                {
                    (snapshot) in
                    // Check if user already exists
                    
                    let value = snapshot.value as? NSDictionary
                    
                    let username = value?["Full_Name"] as? String ?? ""
                    let email = value?["Email"] as? String ?? ""
                    let password = value?["Password"] as? String ?? ""
                    let phone = value?["Phone"] as? String ?? ""
                    
                    print("2385 username \(username) email \(email) password \(password) dob \(dob) phone \(phone) country \(country)")
                    
                    print("Logged in successfully!")
                    
                    let alert = UIAlertController(title: "Sign in success!", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil)) */
                
                //}) // End of observeSingleEvent
            }) // End of signIn
        }
        else
        {
            let alert = UIAlertController(title: "Oops!", message: error_text, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil ))
            //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @objc func getClientList()
    {
        let dirPaths = self.filemgr.urls(for: .documentDirectory, in: .userDomainMask);
        self.databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
        let contactDB = FMDatabase(path: self.databasePath as String);
        contactDB!.open()
            let results1: FMResultSet? = contactDB!.executeQuery("SELECT * FROM User", withArgumentsIn: nil)
            var activity_table_count = Int(); while results1!.next()
            {
                activity_table_count += 1
                
                let Id = results1?.string(forColumnIndex: 0);
                
                print("Id \(String(describing: Id))")
                
                HomeModel.getInstance().userId = Id ?? ""
            }
        
            if activity_table_count == 0
            {
                print("Id \(String(describing: HomeModel.getInstance().userId))")
                
                var tinsertSQL = "INSERT INTO User (Id, Full_Name, Email, Password, ClientId) VALUES ("
                tinsertSQL = tinsertSQL + "'"+HomeModel.getInstance().userId+"', '"+HomeModel.getInstance().First_Name+"', '"+HomeModel.getInstance().Email+"', '"+HomeModel.getInstance().Password+"', '"+HomeModel.getInstance().clientId+"')"
                
                print("339 LoginController tinsertSQL \(tinsertSQL)")
                
                _ = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
            }
        contactDB!.close()
        
        HomeModel.getInstance().download_progress = 0
        
        DispatchQueue.main.async
        {
            if self.win.viewWithTag(1115) != nil  { if let viewWithTag = self.win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
            if self.win.viewWithTag(1116) != nil  { if let viewWithTag = self.win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
            
            //segue to booking controller if login successful
            let layout = UICollectionViewFlowLayout()
            let bookingsController = BookingsController(collectionViewLayout: layout)
            bookingsController.loginController = self
            //self.present(bookingsController, animated: true, completion: nil)
            UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: bookingsController)
        } 
    }
    
    @objc func showRegisterController()
    {
        print("Register")
        let registerController = RegisterController()
        registerController.loginController = self
        present(registerController, animated: true)        
    }
}

