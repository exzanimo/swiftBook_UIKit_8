//
//  ViewController.swift
//  UI_Course8 (WebKit)
//
//  Created by Александр Тарасов on 14/05/2019.
//  Copyright © 2019 Aleksandr Tarasov. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var utlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        utlTextField.delegate = self
        webView.navigationDelegate = self
        
       
        let homePage = "http://www.bit-stroitelstvo.ru"
        let url = URL(string: homePage)
        let request = URLRequest(url: url!)
        
        utlTextField.text = homePage
        
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
     
    }

    @IBAction func backButtonAction(_ sender: UIButton) {
        
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goForward()
        }
    }
}

extension ViewController: UITextFieldDelegate, WKNavigationDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let urlString = textField.text!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        webView.load(request)
        textField.resignFirstResponder()
        return true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        utlTextField.text = webView.url?.absoluteString
        backButton.isEnabled = webView.canGoBack
        nextButton.isEnabled = webView.canGoForward
        
    }
}


