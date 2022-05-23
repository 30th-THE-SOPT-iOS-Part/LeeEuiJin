//
//  FeedTableViewCell.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/05/06.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    static let identifier = "FeedTableViewCell"
    
    //MARK: @IBOutlet
    
    
    @IBOutlet weak var userIDUpper: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var feedContents: UILabel!
    @IBOutlet weak var theNumberOfLikes: UILabel!
    @IBOutlet weak var userIDLower: UILabel!
    @IBOutlet weak var moreComments: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    
    var delegate: FeedTableViewCellDelegate?
    var isLiked : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(_ feedData: FeedDataModel){
        userIDUpper.text = feedData.userID
        profileImage.image = UIImage(named: feedData.profileImageName)
     
        //feedImage.image = UIImage(named: feedData.feedImageName)
        feedImage.loadImage(url: URL(string : "https://picsum.photos/id/237/200/200")!)
        moreComments.text = "댓글 \(feedData.commentCount)개 모두 보기"
        feedContents.text = feedData.feedContents
        userIDLower.text = feedData.userID
        theNumberOfLikes.text = "좋아요 \(feedData.likeCount)개"
    }
    
    @IBAction func tabLikeBtn(_ sender: UIButton) {
        if self.isLiked{
            likeBtn.setImage(UIImage(named: "Like_1"), for: .normal)
        }
        
        else {
            likeBtn.setImage(UIImage(named: "icn_like"), for: .normal)
        }
        self.delegate?.tabLikeBtn(isLiked : self.isLiked, tag : self.tag)
        self.isLiked = !self.isLiked
        self.setData(FeedDataModel.sampleData[self.tag])
        
    }
    
}
