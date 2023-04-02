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
    
    private var photoList: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyApi.shared.callService() { photoList in
            print(photoList.map { photo in
                photo.title ?? ""
            })
            self.photoList = photoList
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photo = photoList[indexPath.row]
        let customCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        
        customCell.iv_profile.kf.setImage(with: URL(string: photo.thumbnailUrl ?? ""))
        customCell.tv_title.text = "[\(photo.id ?? 0)] album : \(photo.albumId ?? 0)"
        customCell.tv_contents.text = photo.title
        
        return customCell
    }
}
