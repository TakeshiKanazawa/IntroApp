//
//  BaseViewController.swift
//  IntroApp
//
//  Created by 金澤武士 on 2020/03/28.
//  Copyright © 2020 tk. All rights reserved.
//

import UIKit
//タブ遷移用のライブラリ
import SegementSlide

class BaseViewController: SegementSlideViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        scrollToSlide(at: 0, animated: true)
    }
    
    override var headerView: UIView?{
        let headerview = UIImageView()
        //falseにしたらどうなる？？
        headerview.isUserInteractionEnabled = true
        headerview.contentMode = .scaleToFill
        headerview.image = UIImage(named: "")
        headerview.translatesAutoresizingMaskIntoConstraints = false
        let headerHeight:CGFloat
        headerHeight = view.bounds.height/4 + topLayoutGuide.length
        headerview.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        return headerview
    }
    
    override var titlesInSwitcher: [String] {
        return ["Top","AbemaNew","Yahoo!","IT","Buzz","CNN"]
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index {
        case 0:
            return
     
        }
    }
    

}
