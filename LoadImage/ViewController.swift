//
//  ViewController.swift
//  LoadImage
//
//  Created by HAMDI TLILI on 15/07/2023.
//

import UIKit

class ViewController: UIViewController {
var al = "https://static1.mclcm.net/iod/images/v2/103/photo/295310/470x325_100_300_000000x10x0.jpg?ts=20180720104018"
    
    var Trithemis = "http://odonatas403.d.o.f.unblog.fr/files/2023/07/120a9971.jpg"
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     setupActivityIndicator(true )
    }
    @IBAction func loadImage(_ sender: UIButton) {
        if sender.tag == 0 {
            requestImageFrom(al)
        } else {
            requestImageFrom(Trithemis)
        }
    }
    func setupActivityIndicator(_ bool: Bool) {
        activityIndicator.isHidden = !bool
        bool ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    func requestImageFrom(_ urlString: String) {
        if !activityIndicator.isAnimating {
            setupActivityIndicator(true)
        }
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.sync {
                    self.setupActivityIndicator(false)
                    if let d = data {
                        let image = UIImage(data: d)
                        self.myImageView.image = image
                    }
                    if let r = response {
                        print("Response:\(r)")
                    }
                    if let e = error {
                        print("Erreur: \(e.localizedDescription)")
                    }
                }
            }.resume()
        }
    }

}

