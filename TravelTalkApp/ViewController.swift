//
//  ViewController.swift
//  TravelTalkApp
//
//  Created by 심소영 on 6/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var magnifyingGlassImage: UIImageView!
    
    var mainList: [ChatRoom] = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "TRAVEL TALK"
        configureTextField()
        configureView()
        configureImageView()
        mainTableView.rowHeight = 90
        
    }
    func configureImageView(){
        magnifyingGlassImage.image = UIImage(systemName: "magnifyingglass")
        magnifyingGlassImage.backgroundColor = .clear
        magnifyingGlassImage.tintColor = .lightGray
    }
    func configureView(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
        let xib = UINib(nibName: MainTableViewCell.identifier, bundle: nil)
        mainTableView.register(xib, forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    func configureTextField(){
        nameTextField.settingTextField(text: "        친구 이름을 검색해보세요")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        let data = mainList[indexPath.row]
        
        cell.configureMainCell(data: data)
        
        return cell
    }
    
    
}
