//
//  InitialViewController.swift
//  Project4
//
//  Created by Anthony Lee on 9/10/19.
//  Copyright © 2019 anthonyLee. All rights reserved.
//

import UIKit
import WebKit

class InitialViewController: UIViewController{
    
    let tableView = UITableView()
    var websites = ["hackingwithswift.com", "apple.com", "google.com", "naver.com"]
    
    override func loadView() {
        super.loadView()
        setupTableView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        //Setup TableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension InitialViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newWebVC = ViewController()
        newWebVC.website = websites[indexPath.row]
        let navVC = UINavigationController(rootViewController: newWebVC)
        present(navVC, animated: true, completion: nil)
    }
    
    
}
