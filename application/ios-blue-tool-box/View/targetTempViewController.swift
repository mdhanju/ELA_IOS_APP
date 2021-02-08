//
//  targetTempViewController.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 08/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit

class targetTempViewController: UIViewController {

    

    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    
//    private let relatedItem : [String]
    init(nameSensor : String,RSSI: Int, identifier : String, battery : Int, typedata : SensorTypes,array: [Capteur.Cap]) {
        self.nameSensor = nameSensor
        self.RSSI = RSSI
        self.identifier = identifier
        self.battery = battery
        self.typedata = typedata
        self.array = array
        
     
        super.init(nibName : nil , bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nameSensor, RSSI ,identifier, battery,typedata, array)
     
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
