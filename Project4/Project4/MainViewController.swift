//
//  MainViewController.swift
//  Project4
//
//  Created by SANDEEP BANDARU on 18/07/20.
//  Copyright © 2020 SANDEEP BANDARU. All rights reserved.
//
import Foundation
import UIKit

class MainViewController: UITableViewController {

    var websites = ["apple.com","www.hackingwithswift.com","www.google.com"]
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        title = "website"
     }
     
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return websites.count
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
           cell.textLabel?.text = websites[indexPath.row]
           return cell
       }
       
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
           vc.websites = websites
           vc.currentWebsite = indexPath.row
           navigationController?.pushViewController(vc, animated: true)
       }


    

}
