import UIKit
import CoreBluetooth
import SwiftUI


class BlueTViewController: Capteur {
    

    //private var capteur: Capteur!
    private var sensorTemp : SensorTypes = SensorTypes.SensorTemperature

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        //super?.viewDidLoad()
  
        super.initializeInfoSensor(sensor : sensorTemp)
    }
    
}



/*

import UIKit
import CoreBluetooth
import SwiftUI


class BlueTViewController:  UIViewController, UITableViewDataSource{
    
    private var scanner: Scanner1!
    var display: [ DisplayObject] = []
    var isStartButton : Bool = true
    
   
    
    class DisplayObject {
        
        public var name: String
        public var RSSI: Int
        public var identifier : String
        public var displaytext : String
        
        init(name : String, RSSI: Int, identifier : String, displaytext : String)
        {
            self.name = name
            self.RSSI = RSSI
            self.identifier = identifier
            self.displaytext = displaytext
        }
    }
    

    
    func showToast(message: String, font: UIFont) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = .white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        let maxWidthPercentage: CGFloat = 0.8
        let maxTitleSize = CGSize(width: view.bounds.size.width * maxWidthPercentage, height: view.bounds.size.height * maxWidthPercentage)
        var titleSize = toastLabel.sizeThatFits(maxTitleSize)
        titleSize.width += 20
        titleSize.height += 10
        toastLabel.frame = CGRect(x: view.frame.size.width / 2 - titleSize.width / 2, y: view.frame.size.height - 50, width: titleSize.width, height: titleSize.height)
        
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return display.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let objectDiplay = display[indexPath.row]
        cell.textLabel?.text = objectDiplay.name + String(objectDiplay.RSSI)
        return cell
    }
    
    private let tableview : UITableView =
    {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
        
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scanner = Scanner1()
        scanner.initializeScanner()
        tableview.contentInset = UIEdgeInsets(top: 60,left: 0,bottom: 0,right: 0)
        tableview.backgroundColor = .green
        tableview.dataSource = self
        view.addSubview(tableview)
        

        
        let button = UIButton(frame: CGRect(x: 100, y: 50, width: 60, height: 60))
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        let buttonStop =  UIButton(frame: CGRect(x: 180, y: 50, width: 60, height: 60))
        
        buttonStop.setImage(UIImage(systemName: "stop"), for: .normal)
        buttonStop.addTarget(self, action: #selector(self.buttonTappedStop), for: .touchUpInside)
        view.addSubview(buttonStop)
    }
    
    @objc func buttonTapped(sender : UIButton) {
        
        if (isStartButton == true)
        {
            scanner = Scanner1()
            scanner.initializeScanner()
            
            scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
            print("El toro de Mardid")
            
            self.showToast(message: "Le scan a démarré", font: .systemFont(ofSize: 12.0))
            
            isStartButton = false
        }
    }
    
    @objc func buttonTappedStop(sender : UIButton) {
        
        scanner.stopScanner()
        
        print("El toro de Mardid")
        self.showToast(message: "Le scan est terminé", font: .systemFont(ofSize: 12.0))
        
        self.display.removeAll()
        tableview.reloadData()
        isStartButton = true
    }
    
    override func  viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    func infoSensor()
    {
        let vartype = SensorTypes.SensorTemperature
    }
    
    func handleNewObjectAvailable(data: ([String : Sensor])) {
        
        getSensorTemperature(data: data)
        
    }
    
    func getSensorTemperature(data: ([String : Sensor])) -> DisplayObject {
    
        var trouve = true
        var newobject : DisplayObject = DisplayObject(name: "null", RSSI: 0, identifier: "", displaytext: "")
        
       // let vartype = SensorTypes.SensorTemperature
    
        
        for (key,value) in data
        {
       //     if(value.sensorTypes == vartype)
            if(value is SensorTemperature)
            {
             
                if let magnetic = value as? SensorTemperature // SensorTemperature
                {
                    for var cle in display
                    {
                        if(key == cle.identifier)
                        {
                            cle.RSSI = value.RSSI
                            cle = DisplayObject(name : cle.name, RSSI : cle.RSSI, identifier:  cle.identifier, displaytext: cle.name + " " + String(cle.RSSI))
                            trouve  = false
                        }
                    }
                    if(trouve == true)
                    {
                        newobject = DisplayObject(name: magnetic.name, RSSI: magnetic.RSSI, identifier:  magnetic.idenfitfier, displaytext: "")
                        display.append(newobject)
                    }
                    self.tableview.reloadData()
                }
            }
        }
        return newobject
    }
}






*/
