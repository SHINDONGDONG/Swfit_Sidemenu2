//
//  ViewController.swift
//  Swfit_Sidemenu2
//
//  Created by 申民鐡 on 2022/02/15.
//

import UIKit

class ContainerViewController: UIViewController, HomeViewControllerDelegate, MenuViewControllerDelegate {
    
    enum MenuState {
        case closed
        case opened
    }
    
    private var menuState:MenuState = .closed
    

    let homeVC = HomeViewController()
    let menuVC = MenuViewController()
    var navVC:UINavigationController?
    var InfoVC = InfoViewController()
    var airVC = AirViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        addChildVC()
        
        
    }
    
    func addChildVC() {
        
        addChild(menuVC)
        view.addSubview(menuVC.view)
        didMove(toParent: self)
        menuVC.delegate = self
        
        
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        didMove(toParent: self)
        self.navVC = navVC
        
    }
    
    func addInfo() {
        let vc = InfoVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = homeVC.view.frame
        vc.didMove(toParent: homeVC)
       
        homeVC.title = vc.title
    }
    
    func addAir() {
        let vc = airVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = homeVC.view.frame
        vc.didMove(toParent: homeVC)
       
        homeVC.title = vc.title
    }
    
    func returnToHome() {
        InfoVC.view.removeFromSuperview()
        InfoVC.didMove(toParent: nil)
        homeVC.title = homeVC.homeTitle
    }

    func didSelect(menuItem: MenuViewController.MenuOption) {
        toggleMenu(completion: nil)
            switch menuItem {
            case .home:
                self.returnToHome()
            case .info:
                self.addInfo()
//                let vc = InfoViewController()
//                self.present(UINavigationController(rootViewController: vc), animated: true,completion: nil)
            case .appRating:
                self.addAir()
            case .shareApp:
                break
            case .settings:
                break
        }
    }

    func toggleMenu(completion: (()-> Void)?) {
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.8,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width / 2
            } completion: { done in
                if done {
                    self.menuState = .opened
                }
            }
        case .opened:
            UIView.animate(withDuration: 0.8,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }

        }
    }
    
    func didTapMenuButton() {
        toggleMenu(completion: nil)
    }

}

