//
//  storyData.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/05/06.
//

import Foundation

struct StoryDataModel{
    let storyImageName : String
    let storyUserID : String
}


extension StoryDataModel{
    static let sampleData : [StoryDataModel] = [
        StoryDataModel(storyImageName: "avatar1", storyUserID: "avatar1"),
        StoryDataModel(storyImageName: "avatar2", storyUserID: "avatar2"),
        StoryDataModel(storyImageName: "avatar3", storyUserID: "avatar3"),
        StoryDataModel(storyImageName: "avatar4", storyUserID: "avatar4"),
        StoryDataModel(storyImageName: "avatar5", storyUserID: "avatar5"),
        StoryDataModel(storyImageName: "avatar6", storyUserID: "avatar6"),
        StoryDataModel(storyImageName: "avatar7", storyUserID: "avatar7")
    
    ]
}
