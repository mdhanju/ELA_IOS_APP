import UIKit
import CoreBluetooth
import SwiftUI

class BlueMAGViewController: Capteur {
    
        private var sensorMagnetic : SensorTypes = SensorTypes.SensorMagnetic

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .cyan
            super.initializeInfoSensor(sensor : sensorMagnetic)
        }
        
    }
    

