//
//  MyWebViewViewController.swift
//  MyStoryBoard
//
//  Created by 이동연 on 2023/04/20.
//

import UIKit
import WebKit

class MyWebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://www.naver.com/"
        if let url = URL(string: urlString) {
            let urlReq = URLRequest(url: url)
            webView.load(urlReq)
        }
        
        

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
