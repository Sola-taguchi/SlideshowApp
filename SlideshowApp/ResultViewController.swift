//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by タグチミツオ on 2024/10/31.
//

import UIKit

class ResultViewController: UIViewController {
    var imageSet: UIImage?
    
    
    @IBOutlet weak var imageResult: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageResult.image = imageSet
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