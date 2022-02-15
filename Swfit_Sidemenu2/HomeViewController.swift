//
//  HomeViewController.swift
//  Swfit_Sidemenu2
//
//  Created by 申民鐡 on 2022/02/15.
//

import UIKit

protocol HomeViewControllerDelegate:AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController {

    weak var delegate:HomeViewControllerDelegate?
    let homeTitle = "HOME"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = homeTitle
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didTapMenuButton))
    }
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }

}
