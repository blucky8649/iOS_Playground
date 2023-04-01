//
//  ViewController.swift
//  MyStoryBoard
//
//  Created by 이동연 on 2023/02/12.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = [["Test 1-1","Test 1-2","Test 1-3","Test 1-4"],["Test 2-1","Test 2-2","Test 2-3"],["Test 3-1","Test 3-2"]]
    
    let articles = (0 ... 10).map { num in
        Article(title: "title \(num)", contents: "contents \(num)", imageUrl: "https://img.freepik.com/free-photo/adorable-kitty-looking-like-it-want-to-hunt_23-2149167099.jpg?w=1480&t=st=1679828951~exp=1679829551~hmac=a532b3e12f0f888d4d968fd81fcaaf2d1ec2b0df41839042db0bb5bb66cd2a6f")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyApi.shared.callService()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        let customCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        
        customCell.iv_profile.kf.setImage(with: URL(string: article.imageUrl))
        customCell.tv_title.text = article.title
        customCell.tv_contents.text = article.contents
        
        return customCell
    }
}

struct Article {
    var title: String = ""
    var contents: String = ""
    var imageUrl: String = ""
    
    init(title: String, contents: String, imageUrl: String) {
        self.title = title
        self.contents = contents
        self.imageUrl = imageUrl
    }
}
