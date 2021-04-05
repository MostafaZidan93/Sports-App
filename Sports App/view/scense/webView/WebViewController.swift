//
//  WebViewController.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 29/03/2021.
//

    import UIKit
    import WebKit
    class WebViewController: UIViewController,WKNavigationDelegate {
        var webUrl:String = ""
        var webView: WKWebView!
        override func loadView() {
            webView = WKWebView()
            webView.navigationDelegate = self
            view = webView
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.hidesBarsOnTap
       let url = URL(string: "https://\(webUrl)")
            webView.load(URLRequest(url: url!))
            print(webUrl)
            print(url as Any)
            webView.allowsBackForwardNavigationGestures = true
            
            // Do any additional setup after loading the view.
        }
        

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
