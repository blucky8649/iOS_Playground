//
//  DetailViewController.swift
//  MyStoryBoard
//
//  Created by 이동연 on 2023/04/03.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ivImage: UIImageView!
    var imageUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("image url = \(imageUrl)")
        ivImage.kf.setImage(with: URL(string: imageUrl))
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
