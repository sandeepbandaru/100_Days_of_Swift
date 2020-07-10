//
//  DetailViewController.swift
//  Project1
//
//  Created by SANDEEP BANDARU on 09/07/20.
//  Copyright © 2020 SANDEEP BANDARU. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selctedImage: String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // title = "View Picture" // static text
        title = "Picture \(selectedPictureNumber) of \(totalPictures)"//Dynamic text
        navigationItem.largeTitleDisplayMode = .never
        
        // Do any additional setup after loading the view.
        if let imageToLoad = selctedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
