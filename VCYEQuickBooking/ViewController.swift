//
//  ViewController.swift
//  VCYEQuickBooking
//
//  Created by victor on 2021/1/27.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {


    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        let request = URLRequest(url: URL(string: "https://www.trueclassbooking.com.tw/member/login.aspx")!)
        webView.load(request)
    }

    @IBAction func button1Clicked(_ sender: Any) {
        print("clicked")
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.impactOccurred()
        
    }
    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
//    {
//        webView.evaluateJavaScript("navigator.userAgent", completionHandler: { result, error in
//
//            if let userAgent = result as? String {
//                print(userAgent)
//            }
//        })
//    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        webView.evaluateJavaScript("document.getElementById('ctl00_cphContents_txtUsername').value='DN20092360'")
        webView.evaluateJavaScript("document.getElementById('ctl00_cphContents_txtPassword').value='jj1216'")
        webView.evaluateJavaScript("document.getElementById('ctl00_cphContents_btnLogin').click() ") { (result, error) in
            print(result)
            if let resultString = result as? String {
                print("resultString= ", resultString)
            }
        }
    }
    
}

