import UIKit
import CoreBluetooth
import SwiftUI


class BlueTViewController: Capteur {
    
    private var sensorTemp : SensorTypes = SensorTypes.SensorTemperature

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        super.initializeInfoSensor(sensor : sensorTemp)
    }
    
}



