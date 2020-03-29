//
//  WebViewController.swift
//  IntroApp
//
//  Created by 金澤武士 on 2020/03/28.
//  Copyright © 2020 tk. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKUIDelegate {
    
    var webView = WKWebView ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 50)
        view.addSubview(webView)

    }
    

}
