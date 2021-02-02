//
//  BlueRHTViewController.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//
import UIKit
import CoreBluetooth
import SwiftUI



class BlueRHTViewController: Capteur {


       

       //private var capteur: Capteur!
       private var sensorTempHum : SensorTypes = SensorTypes.SensorTemperatureHumidity

       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .cyan
           //super?.viewDidLoad()
           super.initializeInfoSensor(sensor : sensorTempHum)
       }
       
   }
