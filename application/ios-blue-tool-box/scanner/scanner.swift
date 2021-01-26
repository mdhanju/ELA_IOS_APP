import UIKit
import CoreBluetooth

class Scanner1: NSObject, CBPeripheralDelegate, CBCentralManagerDelegate {
    
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    /** \brief */
    private var identifier: [String] = []
    private var arraySensor : [Sensor] = []
    
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
    
    

    
    // Handles the result of the scan
    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber)
        {
     
        print(peripheral.name)

        if(advertisementData[CBAdvertisementDataServiceDataKey] != nil)
            {
                let sensorData = advertisementData[CBAdvertisementDataServiceDataKey] as? Dictionary<CBUUID,NSData>
                print(sensorData)
                print(advertisementData[CBAdvertisementDataServiceDataKey])
            
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
                    if(!identifier.contains(peripheral.identifier.description))
                        {
                            print("New Device = " +  peripheral.identifier.description)
                            identifier.append(peripheral.identifier.description)
 
                    
                    
                    //MARK:: move sans batterie
                                           
                    if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "1")
                        {
                                                               
                                                                 
                        let move = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
                        let etat = String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
                                                                   
                        if(move != nil && etat != "")
                            {
                                let id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI), nbrPas: ConvertionToolbox.ConvertAdvertisingValue(str: String(move!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: etat))
                                                                   
                                                                       
                                                                       
                            print("move found with battery !!!!!!!!!!")
                            if(id is SensorMove)
                                {
                                                                           
                                 if let mov = id as? SensorMove
                                    {
                                    print("nbr pas : " + String(mov.nbrPas))
                                                                              
                                    }
                                 }
                                                                                              
                            }
                        }

                    //MARK:: move avec batterie
                        
                     if(sensorData![CBUUID(string: "180F")] != nil && sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "1")
                        {
                            let move = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
                            let etat = String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
                            let battery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                            if(move != nil && etat != "" && battery != nil)
                                {
                                    let id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(battery!)), nbrPas: ConvertionToolbox.ConvertAdvertisingValue(str: String(move!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: etat))
                                print("MOVE found !!!!!!!!!!")
                                if(id is SensorMove)
                                    {
                                        if let mov = id as? SensorMove
                                            {
                                            print("nbr pas : " + String(mov.nbrPas))
                                                 print("nbr pas : " + String(mov.batterylevel))
                                            }
                                    }
                                }
                        }
                    
                    
                    
                    //MARK::ANG avec batterie
                     
                    
                     
                     
                    if(sensorData![CBUUID(string: "2AA1")] != nil && sensorData![CBUUID(string: "180F")] != nil   )
                        {
                                        
                                        
                            let ang = sensorData![CBUUID(string: "2AA1")]?.debugDescription.dropFirst().dropLast()
                            let battery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                            if(ang != nil && battery != nil)
                                {
                                             
                                    let id = SensorFactory.shared().getSensorAngle(sensorTypes: .SensorAngle, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI),  x: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 0))), y: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 4))), z: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 9))))
                                print("ANG with battery found !!!!!!!!!!")
                                if(id is SensorAngle)
                                    {
                                        if let angle = id as? SensorAngle
                                            {
                                                print("Angle x : " + String(angle.x))
                                                print("Angle y: " + String(angle.y))
                                                print("Angle z: " + String(angle.z))
                                                print("battery : "+String(angle.batterylevel))
                                            }
                                    }
                                                                       
                                }
                            }
                    
                    
                    
                    
                    
                     //MARK::ANG sans batterie
                     if(sensorData![CBUUID(string: "2AA1")] != nil  )
                        {
                            let ang = sensorData![CBUUID(string: "2AA1")]?.debugDescription.dropFirst().dropLast()
                            if(ang != nil)
                                {
                        
                                    let id = SensorFactory.shared().getSensorAngle(sensorTypes: .SensorAngle, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI),  x: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 0))), y: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 4))), z: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 9))))
                                                
                                    print("magnetic found !!!!!!!!!!")
                                    if(id is SensorAngle)
                                        {
                                        if let angle = id as? SensorAngle
                                            {
                                                        print("Angle x : " + String(angle.x))
                                                        print("Angle y: " + String(angle.y))
                                                        print("Angle z: " + String(angle.z))
                                            }
                                        }
                                                                       
                                }
                        }
                    
                    
                    
                    //MARK:: magnétique avec batterie
                    
                    if(sensorData![CBUUID(string: "180F")] != nil && sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "0" )
                        {
                            let mag = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
                            let etat = String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
                            let battery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                        if(mag != nil && etat != "" && battery != nil)
                            {
                                let id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(battery!)), nbrObjet: ConvertionToolbox.ConvertAdvertisingValue(str: String(mag!)), etat: ConvertionToolbox.convertHexaToEtat(str: etat))
                            print("magnetic found !!!!!!!!!!")
                            if(id is SensorMagnetic)
                                {
                                if let magnetic = id as? SensorMagnetic
                                    {
                                        print("Magnetic nbr aimant : " + String(magnetic.getNbrObject()))
                                        print("Etat magnetic : " + String(magnetic.getEtat()))
                                        print("Magnetic battery" + String(magnetic.batterylevel))
                                    }
                                }
                                                                       
                            }
                         }

                     //MARK::Magnétique sans batterie
                     if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "0" )
                        {
                            let mag = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
                            let etat = String(sensorData![CBUUID(string: "2A3F")].debugDescription.dropFirst().dropLast())
                            if(mag != nil && etat != "")
                                {
                                    let id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI), nbrObjet: ConvertionToolbox.ConvertAdvertisingValue(str: String(mag!)), etat: ConvertionToolbox.convertHexaToEtat(str: etat))
                                    print("magnetic found !!!!!!!!!!")
                                    if(id is SensorMagnetic)
                                        {
                                        if let magnetic = id as? SensorMagnetic
                                            {
                                                print("Magnetic nbr aimant : " + String(magnetic.getNbrObject()))
                                                print("Etat magnetic : " + String(magnetic.getEtat()))
                                            }
                                        }
                                                                       
                                }
                        }
  
                       //MARK:: temperature humidite avec batterie

                    if(sensorData![CBUUID(string: "2A6E")].debugDescription != "" && sensorData![CBUUID(string: "2A6F")].debugDescription != "" && sensorData![CBUUID(string: "180F")].debugDescription != "" )
                        {
                            let temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                            let hum = sensorData![CBUUID(string: "2A6F")]?.debugDescription.dropFirst().dropLast()
                            let batterie = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                        if(temp != nil && hum != nil && batterie != nil)
                           {
                            let temperature = SensorTemperature(name: peripheral.name ?? "", RSSI: Int(truncating: RSSI), sensorTypes: .SensorTemperature, temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                            let id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(batterie!)),  humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                               
                            print("humidity  sensor found !!!!!!!!!!")
                            if(id is SensorTemperatureHumidity)
                               {
                                if let tempfloat = id as? SensorTemperatureHumidity
                                    {
                                    print("My temperature found : " + String(tempfloat.getTemp()))
                                    print("My humidity found : " + String(tempfloat.getHum()))
                                    print("My battery found : " + String(tempfloat.getBatterie()))
                                    }
                               }
                                                      
                           }
                       }
                     
                     
             
                    //MARK::temperatureHumidite sans batterie
                   else if(sensorData![CBUUID(string: "2A6E")].debugDescription != "" && sensorData![CBUUID(string: "2A6F")].debugDescription != "" )
                        {
                            let temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                            let hum = sensorData![CBUUID(string: "2A6F")]?.debugDescription.dropFirst().dropLast()
                            if(temp != nil && hum != nil)
                                {
                                    let temperature = SensorTemperature(name: peripheral.name ?? "", RSSI: Int(truncating: RSSI), sensorTypes: .SensorTemperature, temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                                    let id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI), humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                                print("humidity  sensor found !!!!!!!!!!")
                                if(id is SensorTemperatureHumidity)
                                    {
                                    if let humidite = id as? SensorTemperatureHumidity
                                        {
                                            print("My temperature found : " + String(humidite.getTemp()))
                                            print("My humidity found : " + String(humidite.getHum()))
                                        }
                                    }
                                                                      
                                }
                        }
           
                    //MARK:: temperareture avec batterie
                 else if(sensorData![CBUUID(string: "2A6E")].debugDescription != ""  && sensorData![CBUUID(string: "180F")].debugDescription != ""  )
                    {
                        let temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                        let batterie = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                        print("bravo")
                        if(temp != nil && batterie != nil)
                            {
                            print("delta")
                                let id = SensorFactory.shared().getSensorTemperature(sensorTypes: .SensorTemperature, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(batterie!)),temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                            print("temperature  sensor found !!!!!!!!!!")
                            if(id is SensorTemperature)
                                {
                                if let tempfloat = id as? SensorTemperature
                                    {
                                    print("My temperature found : " + String(tempfloat.getTemp()))
                                    print("My battery found : " + String(tempfloat.getBatterie()))
                                    }
                               }
                                                                                  
                             }
                  }

                    //MARK:: temperetaure sans batterie
                            
                       else if(sensorData![CBUUID(string: "2A6E")].debugDescription != "" )
                            {
                                let temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                            print("bravo")
                            if(temp != nil)
                                {
                                print("delta")
                                    let id = SensorFactory.shared().getSensorTemperature(sensorTypes: .SensorTemperature, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI),temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                                print("temperature  sensor found !!!!!!!!!!")
                                if(id is SensorTemperature)
                                    {
                                    if let tempfloat = id as? SensorTemperature
                                        {
                                        print("My temperature found : " + String(tempfloat.getTemp()))
                                        }
                                    }
                                                       
                                }
                            }
                          
                        else
                       {
                       
                            print("Sensor uknow")
                        }
                    }
                   
                }
                    
                    
            }
                        else
                        {
                            print("déja trouvé")
                        }

                    }
                    
                    
                }

 
