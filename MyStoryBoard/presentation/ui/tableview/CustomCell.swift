//
//  CustomCell.swift
//  MyStoryBoard
//
//  Created by 이동연 on 2023/03/26.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var tv_contents: UILabel!
    @IBOutlet weak var tv_title: UILabel!
    @IBOutlet weak var iv_profile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

}
