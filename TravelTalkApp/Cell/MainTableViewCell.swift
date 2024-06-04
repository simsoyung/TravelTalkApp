//
//  MainTableViewCell.swift
//  TravelTalkApp
//
//  Created by 심소영 on 6/3/24.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var mainName: UILabel!
    @IBOutlet var mainTalkLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureDateLabel()
    }
    
    func configureMainCell(data: ChatRoom){
        let image = data.chatroomImage[0]
        mainImage.image = UIImage(named: image)
        mainTalkLabel.text = data.chatList.last?.message
        mainName.text = data.chatroomName
        guard let date = data.chatList.last?.date else { return }
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let dateString = myFormatter.date(from: date) else { return }
        let mydate = DateFormatter()
        mydate.dateFormat = "yy.MM.dd"
        let result = mydate.string(from: dateString)
        dateLabel.text = result
        
    }
    
    func configureDateLabel(){
        dateLabel.font = .systemFont(ofSize: 13, weight: .medium)
        dateLabel.textAlignment = .right
        mainName.font = .systemFont(ofSize: 15, weight: .bold)
        mainName.textAlignment = .left
        mainName.textColor = .darkGray
        mainTalkLabel.font = .systemFont(ofSize: 14, weight: .regular)
        mainTalkLabel.textAlignment = .left
        mainTalkLabel.textColor = .gray
        dateLabel.textColor = .gray
        mainImage.contentMode = .scaleAspectFit
        mainImage.layer.cornerRadius = mainImage.frame.height / 2.5
        mainImage.layer.borderWidth = 1
        mainImage.layer.borderColor = UIColor.lightGray.cgColor
        mainImage.clipsToBounds = true
        
        

    }
}
