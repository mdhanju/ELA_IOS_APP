//
//  sensor.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 03/03/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import Foundation

/**
 * \class Sensor
 * \brief base object for all sensors
 */
class Sensor
{
    
    var name : String = ""
    var RSSI : Int = 0
    var batterylevel: Int = 0
    var sensorTypes : SensorTypes = SensorTypes.SensorID
    var idenfitfier : String = ""
    
    
    /* \brief constructor **/
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,identifier : String) {
        self.name = name
        self.RSSI = RSSI
        self.batterylevel = batterylevel
        self.sensorTypes = sensorTypes
        self.idenfitfier = identifier
    }
    
    public func getName()->String
    {
        return name
    }
    
    /* \brief function execute command **/
    func ExecuterCommmande() {
        
    }
}
