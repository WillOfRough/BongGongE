//
//  GuideContentVC.swift
//  BongGong
//
//  Created by sungjoong.kim on 2020/04/09.
//  Copyright © 2020 sungjoong.kim. All rights reserved.
//

import UIKit

class GuideContentVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var subHeadingLabel: UILabel! {
        didSet {
            subHeadingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    
    //MARK : - Properties
    var index = 0
    var heading = ""
    var subHeading = ""
    var imageFile = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
    }
}
