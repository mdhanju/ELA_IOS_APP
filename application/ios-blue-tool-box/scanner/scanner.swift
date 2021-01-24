import UIKit
import CoreBluetooth

class Scanner1: NSObject, CBPeripheralDelegate, CBCentralManagerDelegate {
    
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    /** \brief */
    private var identifier: [String] = []
    
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
    
    
    //call
    //var str1: String = "AB0A"
    //print(Conversion(str : str1))
    
    // Handles the result of the scan
    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber)
    {
       // print(peripheral.identifier);
        print(peripheral.name)

        if(advertisementData[CBAdvertisementDataServiceDataKey] != nil)
        {
      //  print(advertisementData[CBAdvertisementDataServiceDataKey])
         let sensorData = advertisementData[CBAdvertisementDataServiceDataKey] as? Dictionary<CBUUID,NSData>
        //   print(advertisementData[CBAdvertisementDataServiceDataKey])
           print(sensorData)
            print(advertisementData[CBAdvertisementDataServiceDataKey])
            var cpt : Int = 0
            
            
            
            if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && ConvertionToolbox.convertHexaToEtat(str: sensorData![CBUUID(string: "2A3F")]!.description) == true ){
                
                print(advertisementData[CBAdvertisementDataServiceDataKey])
                print(advertisementData.debugDescription)
                 print(peripheral.debugDescription)
                
                
                
            }
            
        
          
         /*   if(peripheral.name?.description == "P MOV B004EB")
            {
                print("lol")
                print(sensorData![CBUUID(string: "2AA1")]!.debugDescription)
                print(advertisementData[CBAdvertisementDataServiceDataKey])
                print("lol1")
                var a : Int = 0;
             
     
            }
          */
            
         /*   if(sensorData![CBUUID(string: "2A6F")] != nil)
                                      {
                                      print("alpha")
                                        var  a = sensorData![CBUUID(string: "2A6F")]?.debugDescription.dropFirst().dropLast()
                                        print(a!)
                                      print("beta")
                                      }
            */
            
            if(identifier.count <= 0) {
              identifier.append(peripheral.identifier.description)
            }
            else{
                if(!identifier.contains(peripheral.identifier.description))
                {
                    print("New Device = " +  peripheral.identifier.description)
                    identifier.append(peripheral.identifier.description)
 
        
       

          //      for key in sensorData!
          //      {
                 //   print(key)
           //         if( cpt == 0 )
            //        {
  //print(type(of: key))
                        
                        
                  
                      
                    //print(key.key.uuidString)
                  //      if(sensorData![CBUUID(string: "2A6E")].debugDescription != nil && sensorData![CBUUID(string: "2A58")].debugDescription != nil){
                        
                        
                        if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && ConvertionToolbox.convertHexaToEtat(str: sensorData![CBUUID(string: "2A3F")]!.description) == false ){
                          
                            var id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription), nbrObjet: ConvertionToolbox.convertHexaToSumExpo(str :ConvertionToolbox.hexaToBinary(str: "2A06")), etat: ConvertionToolbox.convertHexaToEtat(str: sensorData![CBUUID(string: "2A3F")]!.description))
                            
                          // var id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMove, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription), nbrPas: ConvertionToolbox.convertHexaToSumExpo(str :ConvertionToolbox.hexaToBinary(str: "2A06")), etat: ConvertionToolbox.convertHexaToEtat(str :ConvertionToolbox.hexaToBinary(str: "2A06")))
                            
                            
                            print("captuer magnétique")
                        }
                        
                        
                        
                        if(sensorData![CBUUID(string: "2A6E")] != nil && sensorData![CBUUID(string: "2A6F")] != nil && sensorData![CBUUID(string: "2A58")] != nil){
                                    
                           // var id = SensorFactory.shared().getSensorTemperature(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI),batterylevel:
                                //ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription)ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription),  temperature: ConvertionToolbox.ConvertTemperature(str: key.key.uuidString))
                          
                       //     var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel:  ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription), humidity: <#T##Float#>, objectTemperature: <#T##SensorTemperature?#>)
              //              let temperature = SensorTemperature(name: peripheral.name ?? "", RSSI: Int(RSSI), sensorTypes: .SensorTemperature, temperature: ConvertionToolbox.ConvertTemperature(str: key.key.uuidString))
                            
                            
                            let temperature = SensorTemperature(name: peripheral.name ?? "", RSSI: Int(RSSI), sensorTypes: .SensorTemperature, temperature: Float(ConvertionToolbox.ConvertTemperature(str: sensorData![CBUUID(string: "2A58")].debugDescription)))
                                                       
                            
                            
                            var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription), humidity: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A6F")].debugDescription), objectTemperature: temperature)
                            
                                          }
                        
                         else if(sensorData![CBUUID(string: "2A6E")] != nil && sensorData![CBUUID(string: "2A6F")] != nil){
                            print("capteur RHT")
                        }
                        
                        
                        else if(sensorData![CBUUID(string: "2A6E")] != nil && sensorData![CBUUID(string: "2A58")] != nil){
                    
                       
                
                
                           // print(sensorData![CBUUID(string: "180F")])
                            
                           
                    
                      /*      var id = SensorFactory.shared().getSensorTemperature(sensorTypes: .SensorTemperature, name: peripheral.name ?? "", RSSI: Int(RSSI),batterylevel:
                                //ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription)
                                ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription)
                                ,  temperature: ConvertionToolbox.ConvertTemperature(str: key.key.uuidString))
                            print("battery sensor found !!!!!!!!!!")
                         */
                        }
                            
                        else if(sensorData![CBUUID(string: "2A6E")].debugDescription != nil ){
                        
                           // print(key)
                            var temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                            print("bravo")
                            if(temp != nil)
                            {
                          
                            print("delta")
                                var id = SensorFactory.shared().getSensorTemperature(sensorTypes: .SensorTemperature, name: peripheral.name ?? "", RSSI: Int(RSSI),temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                                print("temperature  sensor found !!!!!!!!!!")
                                if(id is SensorTemperature)
                                {
                                    //
                                    if let tempfloat = id as? SensorTemperature {
                                        print("My temperature found : " + String(tempfloat.getTemp()))
                                    }
                                }
                                                       
                            }
                        }
                       
                            
                            
                        else    if(sensorData![CBUUID(string: "2A06")] != nil && ConvertionToolbox.convertHexaToEtatInv(str: sensorData![CBUUID(string: "2A3F")]!.description) == true ){
                                 
                                    // print(key)
                                 
                            var id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMove, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription), nbrPas: ConvertionToolbox.convertHexaToSumExpo(str :ConvertionToolbox.hexaToBinary(str: "2A06")), etat: ConvertionToolbox.convertHexaToEtat(str :ConvertionToolbox.hexaToBinary(str: "2A06")))
                            
                            
                            
                               print("le move la valeur est : " + String(ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription)))
                                         print("move  sensor found !!!!!!!!!!")
                                      
                            
                            
                                     }
                            
                        else if(sensorData![CBUUID(string: "2AA1")] != nil ){
                                 
                                    // print(key)
                                 
                        //    var id = SensorFactory.shared().getSensorAngle(sensorTypes: .SensorAngle, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2AA1")].debugDescription), x: ConvertionToolbox.ConvertHexaToDecimal(str: ConvertionToolbox.ANG(str: sensorData![CBUUID(string: "2AA1")].debugDescription, index: 0)), y: , z: Int(<#T##Double#>))
                            
                            var id = SensorFactory.shared().getSensorAngle(sensorTypes: .SensorAngle, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel:ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2AA1")].debugDescription), x: ConvertionToolbox.ConvertHexaToDecimal(str: ConvertionToolbox.ANG(str: sensorData![CBUUID(string: "2AA1")].debugDescription, index: 0)), y: ConvertionToolbox.ConvertHexaToDecimal(str: ConvertionToolbox.ANG(str: sensorData![CBUUID(string: "2AA1")].debugDescription, index: 4)), z: ConvertionToolbox.ConvertHexaToDecimal(str: ConvertionToolbox.ANG(str: sensorData![CBUUID(string: "2AA1")].debugDescription, index: 8)))
                            
                    
                        
     
                               print("le move la valeur est : " + String(ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2AA1")].debugDescription)))
                                         print("ANG  sensor found !!!!!!!!!!")
   
                            
                                     }
   
                            
                        else
                       {
                       
                            print("Sensor uknow")
                        }
                       // print(key)
                        cpt = cpt + 1
                    }
                   
                    }
                    
                    
                       }
                        else
                        {
                            print("déja trouvé")
                        }

                    }
                    
                    
                }

 
   //     }

  
  //  }
