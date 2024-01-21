//
//  HomeViewController.swift
//  TwitterClone
//
//  Created by Hanna on 21/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Private properties
    private let timeLineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tableView
    }()
    
    private func configureNavigationBar() {
        let size: CGFloat = 36
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height:  size))
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = UIImage(named: "twitter_logo")
        
        let middleView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        middleView.addSubview(logoImageView)
        navigationItem.titleView = middleView
        
        let profileImage = UIImage(systemName: "person")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(didTapProfile))
    }
    
    @objc private func didTapProfile() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timeLineTableView)
        timeLineTableView.delegate = self
        timeLineTableView.dataSource = self
        configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timeLineTableView.frame = view.frame
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: TweetTableViewDelegate {
    func tweetTableViewCellDidTapReply() {
        print("reply")
    }
    
    func tweetTableViewCellDidTapRetweet() {
        print("retweet")
    }
    
    func tweetTableViewCellDidTapLike() {
        print("like")
    }
    
    func tweetTableViewCellDidTapShare() {
        print("share")
    }
}
