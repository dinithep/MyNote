//
//  ViewController.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-02.
//

import UIKit
import CoreData

class QRScannerViewController: UIViewController {
    
    @IBOutlet weak var scannerView: QRScannerView! {
        didSet {
            scannerView.delegate = self
        }
    }

    
    @IBOutlet weak var scanButton: UIButton!{
        didSet {
            scanButton.setTitle("STOP", for: .normal)
        }
        
    }
    
    var qrData: QRData? = nil {
        didSet {
            if qrData != nil {
                self.performSegue(withIdentifier: "homeSeuge", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if !scannerView.isRunning {
            scannerView.startScanning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !scannerView.isRunning {
            scannerView.stopScanning()
        }
    }

    @IBAction func scanButtonAction(_ sender: UIButton) {
        scannerView.isRunning ? scannerView.stopScanning() : scannerView.startScanning()
        let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
        sender.setTitle(buttonTitle, for: .normal)
    }
}


extension QRScannerViewController: QRScannerViewDelegate {
    func qrScanningDidStop() {
        let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
        scanButton.setTitle(buttonTitle, for: .normal)
    }
    
    func qrScanningDidFail() {
        presentAlert(withTitle: "Error", message: "Scanning Failed. Please try again")
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        self.qrData = QRData(qrString: str)
        createData()
        
    }
    
//    func saveUser(){
//
//        let currentDate = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" //give the formate according to your need
//        let dateStr =  dateFormatter.string(from: currentDate)
//        let qrInfoList = qrData?.qrString?.components(separatedBy: [","]).filter({!$0.isEmpty})
//
//        let UserObject:UserModel? = UserModel(context: CoreDataHandler.context)
//        UserObject?.userId = qrInfoList![0]
//        UserObject?.userName = qrInfoList![1]
//        UserObject?.email = qrInfoList![2]
//        UserObject?.userCreated = dateStr
//        CoreDataHandler.saveContext()
//
//    }
//
    
    func createData(){

        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext

        //Now let’s create an entity and new user records.
        let noteEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!

        //final, we need to add some data to our newly created record for each keys using
        //here adding 5 data with loop

        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" //give the formate according to your need
        let dateStr =  dateFormatter.string(from: currentDate)
        let qrInfoList = qrData?.qrString?.components(separatedBy: [","]).filter({!$0.isEmpty})



        let user = NSManagedObject(entity: noteEntity, insertInto: managedContext)
        user.setValue(qrInfoList![0], forKey: "userId")
        user.setValue(qrInfoList![1], forKey: "userName")
        user.setValue(qrInfoList![2], forKey: "email")
        user.setValue(dateStr, forKey: "userCreated")



        //Now we have set all the values. The next step is to save them inside the Core Data

        do {
            try managedContext.save()

        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    
}


extension QRScannerViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeSeuge", let viewController = segue.destination as? HomeViewController {
            viewController.qrData = self.qrData
        }
    }
}



