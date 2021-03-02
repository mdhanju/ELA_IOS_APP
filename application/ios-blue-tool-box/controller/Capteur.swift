import UIKit
import CoreBluetooth
import SwiftUI


class Capteur:  UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private var scanner: Scanner1!
    private var display: [ displayObjectCharacteristic.DisplayObject] = []
    private var isStartButton : Bool = true
    private var sensorT : SensorTypes? = nil
    private var buttonStart : UIButton? = nil
    private var buttonStop : UIButton? = nil
    private var isStopButton = false
    
    public var dictionnarySensorSacond : Event<([String : Sensor])>? = nil
    
    
    

    
    
    
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
        cell.textLabel?.text = objectDiplay.name
        cell.textLabel?.textAlignment = .left
        
        let label1 = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
        label1.text = String(objectDiplay.RSSI ) + " (dBm)"
        cell.accessoryView = label1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let string1 = display[indexPath.row].name
        let RSSI = display[indexPath.row].RSSI
        let identifier = display[indexPath.row].identifier
        let battery = display[indexPath.row].battery
        let typedata = display[indexPath.row].typedata
        let arr : [SensorCaracteristic.Cap] = display[indexPath.row].array
        
        
        // si c'est un capteur de temperature
        
        
        switch typedata {
        
        case SensorTypes.SensorTemperature:
            self.navigationController?.pushViewController(controllerGrapheUI(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
            self.navigationController?.navigationBar.tintColor = .black
        
        case SensorTypes.SensorTemperatureHumidity:
            self.navigationController?.pushViewController(controllerGrapheUI(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
            self.navigationController?.navigationBar.tintColor = .black
            
        case SensorTypes.SensorMove:
            self.navigationController?.pushViewController(controllerEtatUI(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
            self.navigationController?.navigationBar.tintColor = .black
        case SensorTypes.SensorMagnetic:
            self.navigationController?.pushViewController(controllerEtatUI(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
            self.navigationController?.navigationBar.tintColor = .black
        case SensorTypes.SensorAngle:
            self.navigationController?.pushViewController(controllerGrapheUI(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
            self.navigationController?.navigationBar.tintColor = .black
        case SensorTypes.SensorID:
            self.navigationController?.pushViewController(controllerGrapheUI(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
            self.navigationController?.navigationBar.tintColor = .black
            
     

        default:
            print("error inside switch class Capteur")
        }
        
  
       
        
    }
    
    
    private let tableview : UITableView =
        {
            let tableview = UITableView()
            tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            
            tableview.estimatedRowHeight = 0
            tableview.estimatedSectionHeaderHeight = 0
            tableview.estimatedSectionFooterHeight = 0
            tableview.rowHeight = 70
            tableview.frame.size.height = tableview.contentSize.height
            tableview.allowsMultipleSelection = false
            tableview.allowsMultipleSelectionDuringEditing = false
            tableview.allowsSelectionDuringEditing = false
            
            
            return tableview
            
        }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        
        let uiScrollView = UIScrollView()
        uiScrollView.frame = CGRect(x: 10 * UIScreen.main.bounds.width/100, y: 15 * UIScreen.main.bounds.width/100, width: 80 * UIScreen.main.bounds.width/100, height: 100 * UIScreen.main.bounds.height/100)
        uiScrollView.backgroundColor = .green
        self.view.addSubview(uiScrollView)
        
        scanner = Scanner1()
        scanner.initializeScanner()
        tableview.contentInset = UIEdgeInsets(top: 80,left: 0,bottom: 0,right: 0)
        //  tableview.backgroundColor = .green
        tableview.dataSource = self
        view.addSubview(tableview)
        
        let uiView = UIView()
        uiView.frame = CGRect(x: 0 * UIScreen.main.bounds.height/100, y: 6 * UIScreen.main.bounds.width/100, width: 100 * UIScreen.main.bounds.width/100, height:  17 * UIScreen.main.bounds.height/100)
        uiView.backgroundColor = .white
        self.view.addSubview(uiView)
        
        buttonStart = UIButton(frame: CGRect(x: 32 * UIScreen.main.bounds.width/100, y:  12 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        buttonStart!.setImage(UIImage(named: "start"), for: .normal)
        buttonStart!.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        
        view.addSubview(buttonStart!)
        
        let labelStart = UITextView(frame: CGRect(x: 33 * UIScreen.main.bounds.width/100, y: 17 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        
        labelStart.text = "start"
        labelStart.backgroundColor = .none
        labelStart.isUserInteractionEnabled = false
        view.addSubview(labelStart)
        
        buttonStop =  UIButton(frame: CGRect(x: 55 * UIScreen.main.bounds.width/100, y: 12 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        
        buttonStop!.setImage(UIImage(named: "stop"), for: .normal)
        buttonStop!.addTarget(self, action: #selector(self.buttonTappedStop), for: .touchUpInside)
        view.addSubview(buttonStop!)
        
        let labelStop = UITextView(frame: CGRect( x: 55 * UIScreen.main.bounds.width/100, y: 17 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        
        labelStop.text = "stop"
        labelStop.isUserInteractionEnabled = false
        labelStop.backgroundColor = .none
        view.addSubview(labelStop)
        
    }
    
    @objc func buttonTapped(sender : UIButton) {
        if (isStartButton == true)
        {
            buttonStart!.setImage(UIImage(named: "start_s"), for: .normal)
            scanner = Scanner1()
            scanner.initializeScanner()
            
            scanner.defineFilterType(sensor: sensorT!)
            scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
            print("El toro de Mardid")
            
            self.showToast(message: "Le scan a démarré", font: .systemFont(ofSize: 12.0))
            
            isStartButton = false
            isStopButton = false
            buttonStop!.setImage(UIImage(named: "stop"), for: .normal)
        }
        
    }
    
    @objc func buttonTappedStop(sender : UIButton) {
        isStopButton = true
        if( isStopButton == true)
        {
            buttonStop!.setImage(UIImage(named: "stop_s"), for: .normal)
        }
        
        buttonStart!.setImage(UIImage(named: "start"), for: .normal)
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
    
    func initializeInfoSensor(sensor : SensorTypes)
    {
        sensorT = sensor
    }
    
    func handleNewObjectAvailable(data: ([String : Sensor])) {
        updateSensorUI(data: data)
    }
    
    func updateSensorUI(data: ([String : Sensor])) -> displayObjectCharacteristic.DisplayObject {
        
        var trouve = true
        let objectTemp1 = SensorCaracteristic.Temp(temp: 0)
        
        var newobject : displayObjectCharacteristic.DisplayObject = displayObjectCharacteristic.DisplayObject(name: "null", RSSI: 0, identifier: "",battery : 0, typedata : SensorTypes.SensorID, array: [objectTemp1])
        
        for (key,value) in data
        {
            for cle in display
            {
                if(key == cle.identifier)
                {
                    cle.RSSI = value.RSSI
                    
                    switch value {
                    
                    case is SensorTemperature:
                        
                        if let temp = value as? SensorTemperature
                        {
                            let objectTemp = SensorCaracteristic.Temp(temp: temp.getTemp())
                            cle.addData(data: objectTemp)
                        }
                        
                    case is SensorMove:
                        
                        if let move = value as? SensorMove
                        {
                            let objectMove =
                                SensorCaracteristic.Move(nbrPas: move.getNbrPas(), etat: move.getEtat())
                            
                            cle.addData(data: objectMove)
                        }
                        
                    case is SensorMagnetic:
                        
                        if let mag = value as? SensorMagnetic
                        {
                            let objectMagnetic =
                                SensorCaracteristic.Mag(nbrMagnet: mag.getNbrObject(), etat: mag.getEtat())
                            
                            cle.addData(data: objectMagnetic)
                        }
                    case is SensorAngle:
                        
                        if let angle = value as? SensorAngle
                        {
                            let objectAngle =
                                SensorCaracteristic.Angle(x: angle.getX(), y: angle.getY(), z: angle.getZ())
                            cle.addData(data: objectAngle)
                        }
                        
                        
                    
                    default: print("not a sensor")
                    
                    }

                    
                 
                    
                  
                    
                    
                    
                    
                    
                    
                    trouve  = false
                }
            }
            if(trouve == true)
            {
                switch value {
                
                case is SensorID:
                    newobject = displayObjectCharacteristic.DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes )
                    
                case is SensorTemperature:
                    if let temp = value as? SensorTemperature
                    {
                        let objectTemp = SensorCaracteristic.Temp(temp: temp.getTemp())
                        newobject = displayObjectCharacteristic.DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectTemp] )
                    }
                case is SensorTemperatureHumidity:
                    if let tempHum = value as? SensorTemperatureHumidity
                    {
                        let objectTempHum = SensorCaracteristic.TempHum(temp: tempHum.getTemp(), hum: tempHum.getHum())
                        newobject = displayObjectCharacteristic.DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectTempHum] )
                    }
                    
                case is SensorMove:
                    
                    if let move = value as? SensorMove
                    {
                        let objectMove =
                            SensorCaracteristic.Move(nbrPas: move.getNbrPas(), etat: move.getEtat())
                        newobject = displayObjectCharacteristic.DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectMove] )
                    }
               
                case is SensorMagnetic:
                    
                    if let mag = value as? SensorMagnetic
                    {
                        let objectMove =
                            SensorCaracteristic.Mag(nbrMagnet: mag.getNbrObject(), etat: mag.getEtat())
                        newobject = displayObjectCharacteristic.DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectMove] )
                    }
                    
                case is SensorAngle:
                    
                    if let angle = value as? SensorAngle
                    {
                        let objectMove =
                            SensorCaracteristic.Angle(x: angle.getX(), y: angle.getY(), z: angle.getZ())
                        newobject = displayObjectCharacteristic.DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectMove] )
                    }
                    
                    
                    
                    
                default : print("not a sensor")
                    }
                

                
                
          
                
                
                
                display.append(newobject)
                
                
            }
            
            
            
            
            
            self.tableview.reloadData()
        }
        return newobject
    }
}

