//
//  HomeViewController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
//MARK: @IBOutlet
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyCellRegister()
        feedCellRegister()
        self.tableView.rowHeight  = UITableView.automaticDimension
    }
    
    private func storyCellRegister(){
        let nib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
    
    private func feedCellRegister(){
        let nib = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        feedTableView.register(nib, forCellReuseIdentifier: FeedTableViewCell.identifier)
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
}

extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoryDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setData(storyData: StoryDataModel.sampleData[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension HomeViewController: UITableViewDelegate{
 
    
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else {return UITableViewCell()}
        cell.setData(FeedDataModel.sampleData[indexPath.row])
        return cell
    }
}

