//
//  ViewController.swift
//  KarimTask
//
//  Created by macintosh on 19/04/2022.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var mobileNum: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBttn: UIButton!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private let loginViewModel = LoginOneViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingIndicator.isHidden = true
        roundedBttnWithShadow(Bttn: loginBttn)
        setUpViewModel()
    }

    
   
    

    @IBAction func loginBttn(_ sender: Any) {
        if mobileNum.text?.isEmpty == true || password.text?.isEmpty == true {
            self.displayAlertMessage(messageToDisplay: "Please fill empty fields")
            return
        }
        loginViewModel.loginOne(mobile: mobileNum.text ?? "" , password: password.text ?? "" )

    }
    
    
    
    func setUpViewModel(){
        
        loginViewModel.OnLoginSucsess =  { [weak self] vc in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let transition = storyboard.instantiateViewController(withIdentifier: "loggedInVC")  as! LoggedInViewController
                self?.navigationController?.pushViewController(transition, animated: true)
           }
        }
        
        
        loginViewModel.showLoadingIndic = { [weak self] logInd in
            if logInd == true {
                self?.loadingIndicator.isHidden = false
                self?.loadingIndicator.startAnimating()
            }
            else {
                self?.loadingIndicator.stopAnimating()
                self?.loadingIndicator.isHidden = true
            }
        }
        
        
        loginViewModel.onLoginFailed = { [weak self] message in
            self?.displayAlertMessage(messageToDisplay: message)
            self?.loadingIndicator.stopAnimating()
            self?.loadingIndicator.isHidden = true
        }
        
        loginViewModel.showAlert = { [weak self] message in
            self?.displayAlertMessage(messageToDisplay: message)
        }
    }

    
    
    
    func roundedBttnWithShadow(Bttn: UIButton) {
            Bttn.layer.cornerRadius = Bttn.frame.size.height/4
            Bttn.layer.shadowColor = UIColor.black.cgColor
            Bttn.layer.shadowRadius = 2
            Bttn.layer.shadowOpacity = 0.5
            Bttn.layer.shadowOffset = CGSize(width: 0.0 , height: 2.0)
        }
    
    
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
}

