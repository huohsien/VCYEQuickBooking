//
//  ViewController.swift
//  VCYEQuickBooking
//
//  Created by victor on 2021/1/27.
//

import UIKit
import WebKit

var url_class = "https://www.trueclassbooking.com.tw/member/search-class.aspx"
var url_login = "https://www.trueclassbooking.com.tw/member/login.aspx"

enum YE_SITE_STATE: String {
    case login = "https://www.trueclassbooking.com.tw/member/login.aspx"
    case dashboard = "https://www.trueclassbooking.com.tw/member/dashboard.aspx"
    case searchClass = "https://www.trueclassbooking.com.tw/member/search-class.aspx"
}
class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        let request = URLRequest(url: URL(string: url_login)!)
        webView.load(request)
    }

    @IBAction func buttonLeftClicked(_ sender: Any) {
        print("left btn clicked")
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.impactOccurred()
        
    }
    
    @IBAction func buttonCenterClicked(_ sender: Any) {
        print("center btn clicked")
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.impactOccurred()
        
    }
    
    @IBAction func buttonRightClicked(_ sender: Any) {
        print("right btn clicked")
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
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let url = webView.url!.absoluteString
        
        switch url {
        case YE_SITE_STATE.login.rawValue:
            print("login")
            login()
        case YE_SITE_STATE.dashboard.rawValue:
            print("dashboard")
            searchClass()
        case YE_SITE_STATE.searchClass.rawValue:
            print("search class")
        default:
            print("unknow state. url= \(url)")
        }
    }
    
    func login() {
        webView.evaluateJavaScript("document.getElementById('ctl00_cphContents_txtUsername').value='DN20092360'")
        webView.evaluateJavaScript("document.getElementById('ctl00_cphContents_txtPassword').value='jj1216'")
        webView.evaluateJavaScript("document.getElementById('ctl00_cphContents_btnLogin').click()")
    }
    func searchClass() {
        let request = URLRequest(url: URL(string: YE_SITE_STATE.searchClass.rawValue)!)
        webView.load(request)
    }
    
}

