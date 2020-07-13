//
//  ViewController.swift
//  Project1
//
//  Created by SANDEEP BANDARU on 08/07/20.
//  Copyright © 2020 SANDEEP BANDARU. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Strom Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures = pictures.sorted()
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selctedImage = pictures[indexPath.row]
            //print(vc.selctedImage)
            vc.totalPictures = pictures.count
            //print(vc.totalPictures)
            vc.selectedPictureNumber = indexPath.row + 1
            //print(vc.selectedPictureNumber)
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            print("error")
        }
    }
}

