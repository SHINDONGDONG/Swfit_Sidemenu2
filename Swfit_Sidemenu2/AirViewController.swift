//
//  AirViewController.swift
//  Swfit_Sidemenu2
//
//  Created by 申民鐡 on 2022/02/15.
//

import UIKit

class AirViewController: UIViewController {


    let airTitle = "App Rating"


    override func viewDidLoad() {
        super.viewDidLoad()
        title = airTitle
        view.backgroundColor = .green
        let nameLabel:UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y:  0, width: 100, height: 200))
            label.text = "labelbblbblelasfdsdafdsfa"
            label.textColor = .black
            label.backgroundColor = .white
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16)
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.center = view.center
            label.numberOfLines = 0
            return label
        }()
        
        view.addSubview(nameLabel)
        
    }
}
