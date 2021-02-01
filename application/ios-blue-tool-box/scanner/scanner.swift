import UIKit
import CoreBluetooth


/*
class Event<T> {

    typealias EventHandler = (T) -> ()

  private var eventHandlers = [EventHandler]()

  func addHandler(handler: @escaping(EventHandler)) {
    eventHandlers.append(handler)
  }

  func raise(data: T) {
    for handler in eventHandlers {
      handler(data)
    }
  }
}
 */

class Scanner1: NSObject, CBPeripheralDelegate, CBCentralManagerDelegate {
    
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    private var identifier: [String] = []
    
    public var evNewInfoAvailable: Event<(String, String)>
    public var dictionnarySensor : Event<([String : Sensor])>
    
    override init() {
        evNewInfoAvailable = Event<(String, String)>()
        dictionnarySensor = Event<([String : Sensor])>()
        
        
        //evNewInfoAvailable.addHandler { a, b in print("Le nom \(a), et l'identifier \(b)") }
    }
    
    /**
     * \fn initializeScanner
     * \brief function to initialize a new scanner and associate to a central manager object
     * \param [in] self : current isntance ..
     * \return None
     **/
    func initializeScanner()
    {
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    /**
     * \fn initializeScanner
     * \brief function to initialize a new scanner and associate to a central manager object
     * \param [in] self : current isntance ..
     * \return None
     **/
    func stopScanner()
    {
        centralManager.stopScan()
    }
    
    // If we're powered on, start scanning
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
        print("Central state update")
        if central.state != .poweredOn
        {
            print("Central is not powered on")
        }
        else
        {
            print("Central scanning for", ParticlePeripheral.uartRx);
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    // Handles the result of the scan
    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber)
    {
        
       // print(peripheral.name)
       // print(peripheral.identifier.description)
        if(peripheral.name != nil)
        {
            let data = (peripheral.name!, peripheral.identifier.description)
            evNewInfoAvailable.raise(data : data)
        }
        
        //
        if(advertisementData[CBAdvertisementDataServiceDataKey] != nil)
        {
            let sensorData = advertisementData[CBAdvertisementDataServiceDataKey] as? Dictionary<CBUUID,NSData>
         //   print(sensorData)
         //   print(advertisementData[CBAdvertisementDataServiceDataKey])
            
            /*   if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && ConvertionToolbox.convertHexaToEtat(str: sensorData![CBUUID(string: "2A3F")]!.description) == true ){
             
             print(advertisementData[CBAdvertisementDataServiceDataKey])
             print(advertisementData.debugDescription)
             print(peripheral.debugDescription)
             }
             */
            if(identifier.count <= 0)
            {
                identifier.append(peripheral.identifier.description)
            }
            else{
            //    if(!identifier.contains(peripheral.identifier.description))
            //    {
                   // print("New Device = " +  peripheral.identifier.description)
                    identifier.append(peripheral.identifier.description)
                    
                    let id = SensorFactory.shared().get(sensorData: sensorData, tagname: peripheral.name?.description ?? "", tagRSSI: RSSI, tagidentifier: peripheral.identifier.description)
                    
                    if( id != nil)
                    {
                        dictionnarySensor.raise(data : [peripheral.identifier.description:id!])
                        
                   //     SensorFactory.shared().addDtictionnary(tagidentifier: peripheral.identifier.description, sensor: id!)
                   //     SensorFactory.shared().getDataSensor(id: id!)
                    }
                    //SensorFactory.shared().printDtictionnary()
                }
        }
              // else
            //{
              //      print("Sensor uknow")
            //   }
          //  }
        //}
   //     else
     //   {
       //     print("déja trouvé")
         //   SensorFactory.shared().updateDtictionnary(tagidentifier: peripheral.identifier.description, sensor: id)
            
            // arraySensorMagnetic.updateValue(SensorMagnetic, forKey: peripheral.identifier.description)
        //}
    
    }
    
}



