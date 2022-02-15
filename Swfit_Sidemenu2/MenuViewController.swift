//
//  MenuViewController.swift
//  Swfit_Sidemenu2
//
//  Created by 申民鐡 on 2022/02/15.
//

import UIKit
protocol MenuViewControllerDelegate:AnyObject {
    func didSelect(menuItem: MenuViewController.MenuOption)
}

class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    weak var delegate:MenuViewControllerDelegate?
    enum MenuOption:String, CaseIterable {
        case home = "Home"
        case info = "Info"
        case appRating = "AppRating"
        case shareApp = "ShareApp"
        case settings = "Settings"
        
        var imageName:String {
            switch self {
            case .home:
                return "house"
            case .info:
                return "airplane"
            case .appRating:
                return "star"
            case .shareApp:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
   
    let greyColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)

    private let tableView:UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = greyColor
        tableView.backgroundColor = greyColor
        view.addSubview(tableView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOption.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOption.allCases[indexPath.row].rawValue
        cell.backgroundColor = greyColor
//        cell.contentView.backgroundColor = greyColor
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(systemName: MenuOption.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        return cell
    }
    
}
