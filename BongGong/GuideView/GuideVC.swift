//
//  GuideVC.swift
//  BongGong
//
//  Created by sungjoong.kim on 2020/04/09.
//  Copyright © 2020 sungjoong.kim. All rights reserved.
//

import UIKit

class GuideVC: UIViewController , GuideContentVCDelegate{
    
    //MARK : - Outlets
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton!{
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton: UIButton!
    
    //MARK : - Properties
    var guidePageVC: GuideContentPageVC?
    
    //MARK : - Actions
    @IBAction func skipButtonTapped(sender: UIButton) {
        checkGuideView(VCName: "GuideViewChecked")
        moveSignUpLoginScreen()
    }
    
    func moveSignUpLoginScreen() {
//        self.navigationController?.popViewController(animated: false)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = guidePageVC?.currentIndex {
            switch index {
            case 0...1:
                guidePageVC?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                checkGuideView(VCName: "GuideViewChecked")
                self.dismiss(animated: false, completion: nil)
            default:
                break
            }
        }
        updateUI()
    }
    
    func checkGuideView(VCName: String) {
        do {
            try Keychain.set(value: Data("\(VCName)".utf8), account: "\(VCName)")
        }  catch( _) {
            print("KeyChain save failed..")
        }
    }
    
    
    //MARK : - View controller life Cycle
    func updateUI() {
        if let index = guidePageVC?.currentIndex {
            switch index {
            case 0...1 :
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.isHidden = false
            case 2:
                nextButton.setTitle("GET STARTED", for: .normal)
                skipButton.isHidden = true
            default:
                break
            }
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    //MARK : - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? GuideContentPageVC {
            guidePageVC = pageViewController
            guidePageVC?.guideDelegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
