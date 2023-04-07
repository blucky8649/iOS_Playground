//
//  CollectionViewController.swift
//  MyStoryBoard
//
//  Created by 이동연 on 2023/04/06.
//

import UIKit

class CollectionViewController: UIViewController {

    private var photoList: [Photo] = []
    let columns: CGFloat = 3
    let space: CGFloat = 1
    
    @IBOutlet weak var centerProgressBar: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MyApi.shared.callService() { photoList in
            self.photoList = photoList
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.centerProgressBar.isHidden = true
            }
            
        }
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    }


}
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(photoList.count)
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photo = photoList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomGridCell", for: indexPath) as! CustomGridCell
        cell.ivTitle.kf.setImage(with: URL(string: photo.thumbnailUrl ?? ""))
        cell.tvTitle.text = "[\(photo.id ?? 0)] album : \(photo.albumId ?? 0)"
        cell.tvLabel.text = photo.title
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.frame.width / columns) - (space * (columns - 1))
            print("width = \(width)")
            return CGSize(width: width, height: width + 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let cell = photoList[indexPath.row]
        print("cell selected : \(indexPath.row)")
        print("photo title : \(cell.title ?? "")")
        
        guard let vcDetail = self.storyboard?
            .instantiateViewController(withIdentifier: "DetailVC")
                as? DetailViewController else {
            return
        }
        vcDetail.imageUrl = cell.thumbnailUrl ?? ""
        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return space
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return space
    }
}
