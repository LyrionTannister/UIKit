//
//  LoginWKView.swift
//  notVK
//
//  Created by Roman on 14.05.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit
import WebKit

class LoginWKView: UIViewController {

    
    @IBOutlet weak var WKLoginView: WKWebView! {
        didSet {
            var urlComponents = URLComponents()
            urlComponents.scheme = "http"
            urlComponents.host = "oauth.vk.com"
            urlComponents.path = "/authorize"
            urlComponents.queryItems = [URLQueryItem(name: "client_id", value: "7450792"),
                                        URLQueryItem(name: "display", value: "mobile"),
                                        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                                        URLQueryItem(name: "scope", value: "262150"),
                                        URLQueryItem(name: "response_type", value: "token"),
                                        URLQueryItem(name: "v", value: "token")]
            
            let request = URLRequest(url: urlComponents.url!)
            WKLoginView.load(request)
            WKLoginView.navigationDelegate = self
        }
    }
    
    let notificationCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        //loginScrollView?.addGestureRecognizer(hideKeyboardGesture)

        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)

        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardDidChangeFrameNotification,
            object: nil)

        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        //scrollBottomConstraint.constant = frame.height
    }

    @objc func keyboardWillBeHidden(notification: Notification) {
        //scrollBottomConstraint.constant = 0
    }

    @objc func hideKeyboard() {
        //self.loginScrollView.endEditing(true)
    }
}

extension LoginWKView: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let parameters = fragment
            .components(separatedBy: "&")
            .map{ $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = parameters["access_token"], let userId = parameters["user_id"] else { return } // check availability of received parameters
        
        Session.shared.token = token // save received token to the Session singleton
        Session.shared.userId = Int(userId)! // save received userId the the Session singleton
        
        print("Current token: \(Session.shared.token)")
        print("Current userID: \(Session.shared.userId)\n")
        
        //vkService.getMyFriendsList() // get friends list for userID
        //vkService.getPhotosOfSelectedFriend() // get photos for userID
        //vkService.getCommunitiesListOfSelectedFriend() // get groups for userID
        //vkService.getAllCommunitiesList() // get groups for search request
        
        decisionHandler(.cancel) // navigation ended
        
        performSegue(withIdentifier: "Login", sender: nil) // go to the next ViewContoller
    }
}
