//
//  WebViewController.swift
//  VKApp
//
//  Created by Олеся Бабич on 18.1.23..
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    let session = Session.sharedInstance
    var mainVC = MainTabBarController()
    
    @IBOutlet weak var webView: WKWebView!
    
    let appID = "51528540"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"
        
        urlComponent.queryItems = [URLQueryItem(name: "client_id", value: appID),
                                   URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                                   URLQueryItem(name: "display", value: "mobile"),
                                   URLQueryItem(name: "response_type", value: "token")
        ]
        
        let url = urlComponent.url
        if UIApplication.shared.canOpenURL(url!) {
            let request = URLRequest(url: url!)
            
            webView.load(request)
        }
        
    }

}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment.components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce([String: String]()) { res, param in
                var dict = res
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        session.userID = params["user_id"]!
        
        
        if let token = params["access_token"] {
            self.session.token = token

            
            mainVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarMain")) as! MainTabBarController
            mainVC.transitioningDelegate = mainVC

            self.navigationController?.pushViewController(mainVC, animated: true)
            
            
            self.view.insertSubview((self.mainVC.view)!, at: 9)
            
        }
        
        decisionHandler(.cancel)
    }
    
}


