import UIKit

class BlueANGViewController: Capteur {

        private var sensorANG : SensorTypes = SensorTypes.SensorAngle

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .cyan
            super.initializeInfoSensor(sensor : sensorANG)
        }
        
    }



