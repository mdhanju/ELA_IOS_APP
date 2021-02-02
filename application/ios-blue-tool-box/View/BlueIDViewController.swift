//
//  BlueIDViewController.swift
//
//
//  Created by ELA Innovation on 14/01/2021.
//

import UIKit





class BlueIDViewController: Capteur {


        
        
       
        //private var capteur: Capteur!
        private var sensorID : SensorTypes = SensorTypes.SensorID

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .cyan
            //super?.viewDidLoad()
            super.initializeInfoSensor(sensor : sensorID)
        }
        
    }

