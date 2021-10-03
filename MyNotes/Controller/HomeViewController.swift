//
//  HomeViewController.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-02.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var qrData: QRData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let infoList = qrData?.qrString?.components(separatedBy: [","]).filter({!$0.isEmpty})
        userLabel.text = "Hello, "+infoList![1]
        emailLabel.text = infoList![2]

    }

//    @IBAction func openInWebAction(_ sender: Any) {
//        if let url = URL(string: qrData?.codeString ?? ""), UIApplication.shared.canOpenURL(url) {
//            UIApplication.shared.open(url, options: [:])
//        } else {
//            showToast(message : "Not a valid URL")
//        }
//    }

}
