import UIKit

class BlueIDViewController: Capteur {

        private var sensorID : SensorTypes = SensorTypes.SensorID

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .cyan
            super.initializeInfoSensor(sensor : sensorID)
        }
        
    }

