//
//  SignUpVC.swift
//  BongGong
//
//  Created by sungjoong.kim on 2020/04/09.
//  Copyright © 2020 sungjoong.kim. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = signUpButton.bounds.height/2
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBAction func popVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpAPICall(_ sender: Any) {
        let param = ["name":userNameTextField.text ?? "" , "password":passwordTextField.text ?? "" , "email":emailTextField.text ?? ""
        ]
        
        if let url = URL(string: "http://localhost:3000/loginUser") {
            var request = URLRequest.init(url: url)
            request.httpMethod = "POST"
            request.httpBody = param.queryString.data(using: .utf8)
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
//                guard let data = data else {
//                    let alert = UIAlertController.init(title: "유저 정보가 없음.", message: "ID or Password 확인", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (element) in
//                        //작동하는 코드
//                    }))
//                    alert.addAction(UIAlertAction(title: "취소", style: .default, handler: { (element) in
//                        //작동하는 코드
//                    }))
//                    self.present(alert, animated: true, completion: nil)
//                    return
//                }
//                let decoder = JSONDecoder()
//                do {
//                    let user = try decoder.decode(LoginUser.self, from: data)
//                    User.shared.info = user
//                    DispatchQueue.main.async {
//                        self.dismiss(animated: true, completion: nil)
//                    }
//                    NotificationCenter.default.post(name: NSNotification.Name.init("UserInfoLoad"), object: nil)
//                }
//                catch {
//                    print("error ==> \(error)")
//                }
//                
//            }.resume()
        }
        
        
    }
    
}
