//
//  LoginVC.swift
//  BongGong
//
//  Created by sungjoong.kim on 2020/04/09.
//  Copyright © 2020 sungjoong.kim. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let loginURL = "http://localhost:3000/loginUser"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = signInButton.bounds.size.height/2
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.blue.cgColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func moveToSignUp(_ sender: Any) {
        let signUpVC = UIStoryboard(name: "SignUpVC", bundle: nil).instantiateViewController(identifier: "SignUpVC")
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInAPICall(_ sender: Any) {
        //파라미터 가공하자.
        var param = ["name": userNameTextField.text ?? "", "password":passwordTextField.text ?? ""]
        //query String key=value&key=value
        //get post ?
        //URLSession
        //주소에 params를 붙이려면 ?를 붙인다.
        
        //URL Components
        var urlComponents = URLComponents(string: loginURL)
        urlComponents?.query = param.queryString
        guard let hasURL = urlComponents?.url else {
            return
        }
        
        // model을 만들어야 함.
//        URLSession.shared.dataTask(with: hasURL) { (data, response, error) in
//            //data는 기계어같은 느낌 -> 사람이 읽을 수 있도록 해야함.
//            guard let data = data else {
//                return
//            }
//            let decoder = JSONDecoder()
//            do {
//                let user = try decoder.decode([LoginUser].self, from: data)
//                if let hasUserInfo = user.first{
//                    User.shared.info = hasUserInfo
//                    DispatchQueue.main.async {
//                        self.dismiss(animated: true, completion: nil)
//                    }
//                    
//                    NotificationCenter.default.post(name: NSNotification.Name.init("UserInfoLoad"), object: nil)
//                }
//                else {
//                    
//                    //dataTask는 하나의 스레드임. UI의 움직임들은 메인스레드에서만 움직어야함.
//                    DispatchQueue.main.async {
//                        // alert
//                        let alert = UIAlertController.init(title: "유저 정보가 없음.", message: "ID or Password 확인", preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (element) in
//                            //작동하는 코드
//                        }))
//                        alert.addAction(UIAlertAction(title: "취소", style: .default, handler: { (element) in
//                            //작동하는 코드
//                        }))
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }
//            }
//            catch {
//                print("error ==> \(error)")
//            }
//        }.resume()
    }
    
}

//param은 딕셔너리형태인데 query String 구조로 바꿀거니까 항상! 익스텐전으로 구현하자.
extension Dictionary {
    var queryString: String {
        var output = ""
        for (key, value) in self {
            output += "\(key)=\(value)&"
        }
        //가장 마지막 글자 빼고.
        output = String(output.dropLast())
        return output
    }
}
