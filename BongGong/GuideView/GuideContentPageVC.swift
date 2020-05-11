//
//  GuideContentPageVC.swift
//  BongGong
//
//  Created by sungjoong.kim on 2020/04/09.
//  Copyright © 2020 sungjoong.kim. All rights reserved.
//

import UIKit

protocol GuideContentVCDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class GuideContentPageVC: UIPageViewController , UIPageViewControllerDataSource , UIPageViewControllerDelegate {
    
    //MARK : - Properties
    var pageHeadings = ["당신의 감정을 기록하세요!", "감정을 토대로 일기를 쓰세요!","리워드를 드립니다!"]
    var pageImages = ["intro1", "intro2","intro3"]
    var pageSubHeadings = ["언제 어디서 어떤 감정을 가졌는지 쉽게 등록하세요.", "다른 사람들과 일기를 공유하세요!","감정등록과 일기로 리워드를 지급받으세요!"]
    
    var currentIndex = 0
    
    weak var guideDelegate: GuideContentVCDelegate?
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentVC).index
        index -= 1
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentVC).index
        index += 1
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> GuideContentVC? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        //Create a New View Controller and pass suitable data
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "GuideContentVC") as?
            GuideContentVC {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //MARK: - Page View Controller delegate
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? GuideContentVC {
                currentIndex = contentViewController.index
                guideDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        //Create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}
