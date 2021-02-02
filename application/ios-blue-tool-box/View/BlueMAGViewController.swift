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

class BlueMAGViewController: UIViewController{
    

    //private var capteur: Capteur!
    private var sensorTemp : SensorTypes = SensorTypes.SensorTemperature

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        //super?.viewDidLoad()
      //  super.initializeInfoSensor(sensor : sensorTemp)
    }
    
}
