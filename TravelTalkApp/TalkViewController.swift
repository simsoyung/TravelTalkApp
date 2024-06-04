//
//  TalkViewController.swift
//  TravelTalkApp
//
//  Created by 심소영 on 6/3/24.
//

import UIKit

class TalkViewController: UIViewController {

    @IBOutlet var talkTableVIew: UITableView!
    @IBOutlet var talkTextField: UITextField!
    
    var mainList: [ChatRoom] = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
