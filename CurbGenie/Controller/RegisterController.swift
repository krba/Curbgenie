//
//  RegisterController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 11/30/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit
import Firebase

class RegisterController: UIViewController, UITextFieldDelegate
{
    var loginController: LoginController?
    
    let filemgr = FileManager.default;
    var databasePath = NSString()
    let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        view.addSubview(logoImageView)
        view.addSubview(nameField)
        view.addSubview(phoneNumberField)
        view.addSubview(emailField)
        view.addSubview(passwordNameField)
        view.addSubview(nameTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(cancelButtonView)
        view.addSubview(cancelButton)
        
        view.backgroundColor = UIColor.mainColor()
        setupUIContraints()
        
        self.nameTextField.delegate = self
        self.phoneNumberTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        let center: NotificationCenter = NotificationCenter.default
        center.removeObserver(self)
        center.addObserver(self, selector: #selector(self.gotoBookingsController), name: NSNotification.Name("gotoBookingsController"), object: nil)
    }
    
    lazy var cancelButtonView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "cancelXButton")
        imageview.contentMode = .scaleAspectFill
        imageview.isUserInteractionEnabled = true
        imageview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCancel)))
        imageview.layer.masksToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: UIControlState())
        button.setTitleColor(.green, for: UIControlState())
        button.titleLabel?.font = UIFont (name: "Nunito-Regular", size: 18)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func gotoBookingsController()
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
            print("RegisterController Id \(String(describing: HomeModel.getInstance().userId))")
            
            var tinsertSQL = "INSERT INTO User (Id, Full_Name, Email, Password, ClientId) VALUES ("
            tinsertSQL = tinsertSQL + "'"+HomeModel.getInstance().userId+"', '"+HomeModel.getInstance().First_Name+"', '"+HomeModel.getInstance().Email+"', '"+HomeModel.getInstance().Password+"', '"+HomeModel.getInstance().clientId+"')"
            
            print("94 RegisterController tinsertSQL \(tinsertSQL)")
            
            _ = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
        }
        contactDB!.close()
        
        HomeModel.getInstance().download_progress = 0
        
        DispatchQueue.main.async
        {
            if self.win.viewWithTag(1115) != nil
            { if let viewWithTag = self.win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
            if self.win.viewWithTag(1116) != nil
            { if let viewWithTag = self.win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
            
            let layout = UICollectionViewFlowLayout()
            let bookingsController = BookingsController(collectionViewLayout: layout)
            UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: bookingsController)
            self.dismiss(animated: true, completion: nil)
        }
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
    
    let nameField:  UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "inputField")
        view.image = image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let phoneNumberField:  UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "inputField")
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
    
    let nameTextField: UITextField = {
        
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white]) //custom placeholder
        tf.font = UIFont.boldSystemFont(ofSize: 16)
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
        return tf
    }()
    
    let phoneNumberTextField: UITextField = {
        
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white]) //custom placeholder
        tf.font = UIFont.boldSystemFont(ofSize: 16)
        tf.textColor = UIColor.white
        tf.textAlignment = .center
        tf.keyboardType = .numberPad
        tf.keyboardAppearance = .light
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
        return tf
    }()
    
    let emailTextField: UITextField = {
        
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white]) //custom placeholder
        tf.font = UIFont.boldSystemFont(ofSize: 16)
        tf.textColor = UIColor.white
        tf.textAlignment = .center
        tf.keyboardType = .emailAddress
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
        return tf
    }()
    
    let passwordTextField: UITextField = {
        
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tf.font = UIFont.boldSystemFont(ofSize: 16)
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
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("Register", for: UIControlState())
        button.setTitleColor(UIColor.mainColor(), for: UIControlState())
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
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
        nameField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 70).isActive = true
        nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        //phoneNumberField constraints
        phoneNumberField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 12).isActive = true
        phoneNumberField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneNumberField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        phoneNumberField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        //emailField constraints
        emailField.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 12).isActive = true
        emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        //passwordNameField constraints
        passwordNameField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 12).isActive = true
        passwordNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordNameField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordNameField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        //nameTextField constraints
        nameTextField.leftAnchor.constraint(equalTo: nameField.leftAnchor, constant: 16).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: nameField.centerYAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        //phoneNumberTextField constraints
        phoneNumberTextField.leftAnchor.constraint(equalTo: emailField.leftAnchor, constant: 16).isActive = true
        phoneNumberTextField.centerYAnchor.constraint(equalTo: phoneNumberField.centerYAnchor).isActive = true
        phoneNumberTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
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
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 64).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        //cancelButtonView constraits
        _ = cancelButtonView.anchor(view.safeTopAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 24, bottomConstant: 0, rightConstant: 0, widthConstant: 32, heightConstant: 32)
        
        //cancelButton constraints
        cancelButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 24).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    //Main login function
    @objc func handleRegister()
    {
        /* guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        
        //create user in the Firebase database
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
        } */
        
        print("Login successful")
        
        var error_text = ""
        
        if nameTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
            error_text = error_text + "\nPlease enter Name"
        }
        
        if  emailTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" ||
            (emailTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).range(of: "@") == nil && emailTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).range(of: ".") == nil)
        {
            error_text = error_text + "\nPlease enter Valid Email"
        }
        
        if passwordTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" || passwordTextField.text!.count < 6
        {
            error_text = error_text + "\nPlease enter Password of 6 characters or more"
        }
        
        if phoneNumberTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
            error_text = error_text + "\nPlease enter Phone"
        }
        
        if error_text == ""
        {
            //signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:
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
                    HomeModel.getInstance().First_Name = self.nameTextField.text!
                    HomeModel.getInstance().Phone = self.phoneNumberTextField.text!
                    HomeModel.getInstance().page = "addClient"
                    HomeModel.getInstance().method = "getToken"
                    HomeModel.getInstance().downloadItems() 
                    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
