//
//  storyCollectionViewCell.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/05/06.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    
    //MARK: @IBOutlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userID: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(storyData : StoryDataModel){
        profileImage.image = UIImage(named: storyData.storyImageName)
        userID.text = storyData.storyUserID
    }

}
