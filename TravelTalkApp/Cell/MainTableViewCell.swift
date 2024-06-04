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
    }
    
    func configureMainCell(data: ChatRoom){
        let image = data.chatroomImage[]
            
        mainName.text = data.chatroomName
       // mainTalkLabel.text = data.chatList[Chat]
    }
}
