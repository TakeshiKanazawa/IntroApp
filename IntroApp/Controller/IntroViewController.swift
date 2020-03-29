//
//  IntroViewController.swift
//  IntroApp
//
//  Created by 金澤武士 on 2020/03/27.
//  Copyright © 2020 tk. All rights reserved.
//

import UIKit
import Lottie

class IntroViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var onboardArray = ["1","2","3","4","5"]
    
    var onboardStringArray =
        ["もち","もちもち","もちもちもち","もちもちもちもち","もちもちもちもちもち"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isPagingEnabled = true
        setUpScroll()
        
        for i in 0...4 {
            let animationView = AnimationView()
            let animataion = Animation.named(onboardArray[i])
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animataion
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    func setUpScroll(){
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        
        for i in 0...4{
            
            let onBoardLabel = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y:  view.frame.size.height/3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            onBoardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onBoardLabel.textAlignment = .center
            onBoardLabel.text = onboardStringArray[i]
            scrollView.addSubview(onBoardLabel)
            
        }
    }
}

