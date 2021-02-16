import UIKit
import CoreBluetooth
import SwiftUI



class BlueRHTViewController: Capteur {

    private var sensorTempHum : SensorTypes = SensorTypes.SensorTemperatureHumidity
        
    override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .cyan
           super.initializeInfoSensor(sensor : sensorTempHum)
       }
       
   }
