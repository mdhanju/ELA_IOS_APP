//
//  targetTempViewController.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 08/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit
import Charts
class targetTempViewController: UIViewController,ChartViewDelegate {

    private var arrayGlobal : [Capteur.Cap]? = nil
    
     var lineChart = LineChartView()

    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    private let displayObject : [Capteur.DisplayObject]
    
//    private let relatedItem : [String]
    init(nameSensor : String,RSSI: Int, identifier : String, battery : Int, typedata : SensorTypes,array: [Capteur.Cap],displayObject : [Capteur.DisplayObject]) {
        self.nameSensor = nameSensor
        self.RSSI = RSSI
        self.identifier = identifier
        self.battery = battery
        self.typedata = typedata
        self.array = array
        self.displayObject = displayObject
        
     
        super.init(nibName : nil , bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        lineChart.delegate = self
        arrayGlobal?.append(contentsOf: array)
        var b = arrayGlobal
        print(nameSensor, RSSI ,identifier, battery,typedata, array)

        if let temp : [Capteur.Temp] = array as? [Capteur.Temp]
            {
               // print(temp[0].getTemp())
                for cle in temp
                {
                    print(cle.getTemp())
                }
              
        }
        
 
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
          lineChart.frame = CGRect(x: 0, y: 0,
                                     width: self.view.frame.size.width, height:self.view.frame.size.width)
          lineChart.center = view.center
          view.addSubview(lineChart)
          
          var entries = [ChartDataEntry]()
       //   if let temp : [Capteur.Temp] = array as? [Capteur.Temp]
        for cle in displayObject {
            if( cle.name == nameSensor)
        
                   {
                       if let temp : [Capteur.Temp] = cle.array as? [Capteur.Temp]
                       {
                    for x in 0..<cle.array.count
                    {
                        var countArrray = array.count
          
         
            entries.append(ChartDataEntry(x: Double(x),y: Double(temp[x].temp)))
                    }
                        
                    }
          }
        }
          let set = LineChartDataSet(entries:entries)
          set.colors = ChartColorTemplates.material()
          
          let data = LineChartData(dataSet: set)
          
          lineChart.data = data
        
    }
    
 }


