//
//  BlueMAGViewController.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//
import UIKit
import CoreBluetooth
import SwiftUI

class BlueMAGViewController: UIViewController {
    

    private let tableview : UITableView =
    {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
        
    }()
       
    private var scanner: Scanner1!
    
    
    
    
/*

    
    
    private let progressView: UIProgressView =
    {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .systemBlue
           
        return progressView
    }()
    
    private let progressView1: UILabel =
    {
        let progressView1 = UILabel()
        progressView1.text = "ok"
        
        
        return progressView1
    
    }()
        
    
    
    struct ContentView: View {
        var body: some View {
            Text("Hello World")
        }
    }
    */
 
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // centralManager = CBCentralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view.
        scanner = Scanner1()
        scanner.initializeScanner()
        tableview.backgroundColor = .link
        
        view.addSubview(tableview)
        
      
       /*let dic =  SensorFactory.shared().returnDtictionnary()
        for key in dic
        {
            print("www"+String(key.self.value.RSSI))
        }
        */
        
      /* view.backgroundColor = .darkGray

        
            view.addSubview(progressView)
     let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
     label.center = CGPoint(x: 160, y: 285)
     label.textAlignment = .center
     label.text = "I'm a test label"
     self.view.addSubview(label)
                progressView.frame = CGRect(x: 10, y: 100, width: view.frame.width-20, height: 20)
                progressView.setProgress(0.5, animated: true)
            
        
        */
       
     
        
    }
    override func  viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    
      
    
}
  

