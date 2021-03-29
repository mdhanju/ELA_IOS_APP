import UIKit

class BlueMOVViewController: Capteur {

    private var sensorMove : SensorTypes = SensorTypes.SensorMove

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        super.initializeInfoSensor(sensor : sensorMove)
    }
    
}
