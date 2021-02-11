//
//  BlueMOVViewController.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit

class BlueMOVViewController: Capteur {

    //private var capteur: Capteur!
    private var sensorMove : SensorTypes = SensorTypes.SensorMove

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        //super?.viewDidLoad()
        super.initializeInfoSensor(sensor : sensorMove)
    }
    
}
