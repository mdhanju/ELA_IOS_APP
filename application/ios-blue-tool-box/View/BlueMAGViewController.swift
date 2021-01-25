//
//  BlueMAGViewController.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//
import UIKit
import CoreBluetooth

class BlueMAGViewController: UIViewController {
        
    private var scanner: Scanner1!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // centralManager = CBCentralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view.
        scanner = Scanner1()
        scanner.initializeScanner()
    }
  
}
