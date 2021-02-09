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
        
        
        let imageView0 = UITextView()
        imageView0.text = nameSensor
        imageView0.textColor = UIColor.red
        imageView0.font = UIFont.systemFont(ofSize: 25.0)
        imageView0.isUserInteractionEnabled = false
        imageView0.font = UIFont.boldSystemFont(ofSize: 25)
        imageView0.frame = CGRect(x: 80, y: 300, width: 350, height: 100)
        imageView0.backgroundColor = .none
        self.view.addSubview(imageView0)
        self.view.bringSubviewToFront(imageView0)
        
        let imageTemp = "temp"
        let UIimageTemp = UIImage(named: imageTemp)
        let imageViewTemp = UIImageView(image: UIimageTemp!)
        imageViewTemp.frame = CGRect(x: 150, y: 450, width: 45, height: 45)
        self.view.addSubview(imageViewTemp)
        
        
        
        lineChart.delegate = self

        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        lineChart.frame = CGRect(x: 0, y: 0,width: self.view.frame.size.width, height:self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
    
        var entries = [ChartDataEntry]()
        for cle in displayObject {
            if( cle.name == nameSensor)
                
            {
                if let temp : [Capteur.Temp] = cle.array as? [Capteur.Temp]
                {
                    for x in 0..<cle.array.count
                    {
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


