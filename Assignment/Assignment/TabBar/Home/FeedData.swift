//
//  FeedData.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/05/06.
//

import Foundation
import UIKit

struct FeedDataModel{
    let userID : String
    let profileImageName : String
    let feedImageName : String
    var likeCount : Int
    let feedContents : String
    var commentCount : Int
}

extension FeedDataModel{
    static let sampleData :[FeedDataModel] = [
    FeedDataModel(userID: "avatar1", profileImageName: "avatar1", feedImageName: "postImage1", likeCount: 330, feedContents: "왕초보라면 왕초보 스터디에 오라", commentCount: 19),
    FeedDataModel(userID: "avatar2", profileImageName: "avatar2", feedImageName: "postImage2", likeCount: 220, feedContents: "술을 먹고 싶다면 전통주 스터디에 오라", commentCount: 30),
    FeedDataModel(userID: "avatar3", profileImageName: "avatar3", feedImageName: "postImage3", likeCount: 312, feedContents: "구르고 싶다면 데굴데굴 볼링 스터디에 오라", commentCount: 35),
    FeedDataModel(userID: "avatar4", profileImageName: "avatar4", feedImageName: "postImage4", likeCount: 1000, feedContents: "클론 코딩을 하고 싶다면 틀론 코딩 스터디에 오라", commentCount: 21)
    ]
}
