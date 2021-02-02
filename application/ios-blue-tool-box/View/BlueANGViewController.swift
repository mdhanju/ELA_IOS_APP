//
//  BlueANGViewController.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit

class BlueANGViewController: Capteur {

        //private var capteur: Capteur!
        private var sensorANG : SensorTypes = SensorTypes.SensorAngle

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .cyan
            //super?.viewDidLoad()
            super.initializeInfoSensor(sensor : sensorANG)
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


