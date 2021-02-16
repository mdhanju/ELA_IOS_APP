import Foundation
import UIKit
import CoreBluetooth

class ParticlePeripheral: NSObject {

    // MARK: - Particle LED services and charcteristics Identifiers

    public static let uartRx    = CBUUID.init(string: "6e400003-b5a3-f393-e0a9-e50e24dcca9e")
    public static let uartTx    = CBUUID.init(string: "6e400002-b5a3-f393-e0a9-e50e24dcca9e")

}
