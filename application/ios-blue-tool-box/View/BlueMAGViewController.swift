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

class BlueMAGViewController: Capteur {
    
        //private var capteur: Capteur!
        private var sensorMagnetic : SensorTypes = SensorTypes.SensorMagnetic

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .cyan
            //super?.viewDidLoad()
            super.initializeInfoSensor(sensor : sensorMagnetic)
        }
        
    }
    

