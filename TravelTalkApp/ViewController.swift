//
//  ViewController.swift
//  TravelTalkApp
//
//  Created by 심소영 on 6/3/24.
//

import UIKit

enum Section: CaseIterable {
    case chat1
    case chat2
}

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var magnifyingGlassImage: UIImageView!
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: creatLayout())
    var dataSource: UICollectionViewDiffableDataSource<Section, ChatRoom>!
    
    var mainList: [ChatRoom] = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "TRAVEL TALK"
        configureTextField()
        configureView()
        configureImageView()
        mainTableView.rowHeight = 90
        
    }
    func creatLayout() -> UICollectionViewLayout{
        var layout = UICollectionLayoutListConfiguration(appearance: .grouped)
        layout.backgroundColor = .brown
        layout.showsSeparators = false
        let configutation = UICollectionViewCompositionalLayout.list(using: layout)
        return configutation
    }
    
    private func settingCell(){
        var registeration: UICollectionView.CellRegistration<UICollectionViewListCell, ChatRoom>!
        registeration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.chatroomName
            content.secondaryText = "\(itemIdentifier.chatroomId)"
            content.textProperties.color = .darkGray
            content.imageProperties.tintColor = .red
            content.image = UIImage(systemName: itemIdentifier.chatroomImage[indexPath.item])
            cell.contentConfiguration = content
            
            var background = UIBackgroundConfiguration.listGroupedCell()
            background.backgroundColor = .lightGray
            background.cornerRadius = 10
            background.strokeColor = .blue
            background.strokeWidth = 20
            cell.backgroundConfiguration = background
        }
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registeration, for: indexPath, item: itemIdentifier)
            return cell
        })
    } 
    func updateSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, ChatRoom>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(mainList, toSection: .chat1)
        snapshot.appendItems([ChatRoom(chatroomId: 3, chatroomImage: [User.hue.profileImage, User.jack.profileImage, User.bran.profileImage, User.den.profileImage], chatroomName: "안녕")], toSection: .chat2)
        dataSource.apply(snapshot)
    }
    
    func configureImageView(){
        magnifyingGlassImage.image = UIImage(systemName: "magnifyingglass")
        magnifyingGlassImage.backgroundColor = .clear
        magnifyingGlassImage.tintColor = .lightGray
    }
    func configureView(){
       // mainTableView.delegate = self
       // mainTableView.dataSource = self
        let xib = UINib(nibName: MainTableViewCell.identifier, bundle: nil)
        mainTableView.register(xib, forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    func configureTextField(){
        nameTextField.settingTextField(text: "        친구 이름을 검색해보세요")
    }
}

//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return mainList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
//        let data = mainList[indexPath.row]
//        
//        cell.configureMainCell(data: data)
//        
//        return cell
//    }
//}
