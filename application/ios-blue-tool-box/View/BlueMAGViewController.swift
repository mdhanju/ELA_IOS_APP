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
    

    
       
    private var scanner: Scanner1!
    

           
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // centralManager = CBCentralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view.
        scanner = Scanner1()
        scanner.initializeScanner()
      
       /*let dic =  SensorFactory.shared().returnDtictionnary()
        for key in dic
        {
            print("www"+String(key.self.value.RSSI))
        }
        */
        
        view.backgroundColor = .darkGray
        view.
        
            
            
           
       
     
        
    }
    
    
    
      
    
}
  

