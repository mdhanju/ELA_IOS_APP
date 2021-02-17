import UIKit
import Charts
class targetAngleViewController: UIViewController,ChartViewDelegate {
    
    
    
    
    private var lineChart = LineChartView()
    
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    private let displayObject : [Capteur.DisplayObject]

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
    
    
    @objc func imageTapTemp() {
        self.navigationController?.pushViewController(ConnectViewController(nameSensor: nameSensor, RSSI: RSSI, identifier: identifier, battery: battery, typedata: typedata, array: array, displayObject: displayObject), animated: true)
        view.layoutIfNeeded()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        
        
        
        
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        let UInameSensor = UITextView()
        UInameSensor.text = nameSensor
        UInameSensor.textColor = UIColor.black
        UInameSensor.font = UIFont.systemFont(ofSize: 25.0)
        UInameSensor.isUserInteractionEnabled = false
        UInameSensor.font = UIFont.boldSystemFont(ofSize: 25)
        UInameSensor.frame = CGRect(x: 80, y: 50, width: 350, height: 100)
        UInameSensor.backgroundColor = .none
        self.view.addSubview(UInameSensor)
        self.view.bringSubviewToFront(UInameSensor)
    
        if(battery != -1)
        {
            
            let UIbatterie = UITextView()
            UIbatterie.text = "Low battery"
            UIbatterie.textColor = UIColor.red
            UIbatterie.font = UIFont.systemFont(ofSize: 25.0)
            UIbatterie.isUserInteractionEnabled = false
            UIbatterie.font = UIFont.boldSystemFont(ofSize: 15)
            UIbatterie.frame = CGRect(x: 170, y: 560, width: 350, height: 100)
            UIbatterie.backgroundColor = .none
            self.view.addSubview(UIbatterie)
            self.view.bringSubviewToFront(UIbatterie)
            
            
            let imagelowBattery = "lowBattery"
            let UIimagelowBattery = UIImage(named: imagelowBattery)
            
            
            let btn = UIButton()
            btn.frame = CGRect(x: 120, y: 560, width: 45, height: 45)
            btn.blink()
            btn.setImage(UIimagelowBattery, for: .normal)
            self.view.addSubview(btn)
            
            //   Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.alarmAlertActivate), userInfo: nil, repeats: true)
        }
        
        
        
        
        let imageTemp = "temp"
        let UIimageTemp = UIImage(named: imageTemp)
        let imageViewTemp = UIImageView(image: UIimageTemp!)
        imageViewTemp.frame = CGRect(x: 20, y: 70, width: 45, height: 45)
        self.view.addSubview(imageViewTemp)
        
        let imageArray = "sklia"
        let UIarray = UIImage(named: imageArray)
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(image: UIarray, landscapeImagePhone: .none, style: .done, target: self, action: #selector(imageTapTemp)))
        items.append(UIBarButtonItem(title: "Connexion", style: .plain, target: self,action: .none))
        self.navigationItem.setRightBarButtonItems(items, animated: true)
        lineChart.delegate = self
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        lineChart.frame = CGRect(x: 0, y: 0,width: self.view.frame.size.width, height:self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        var entries = [ChartDataEntry]()
        var entries1 = [ChartDataEntry]()
        var entries2 = [ChartDataEntry]()
        
        for cle in displayObject {
            if( cle.identifier == identifier)
                
            {
                if let temp : [Capteur.Angle] = cle.array as? [Capteur.Angle]
                {
                    for x in 0..<cle.array.count
                    {
                        entries.append(ChartDataEntry(x: Double(x),y: Double(temp[x].getX())))
                    }
                    
                }
                
                if let temp : [Capteur.Angle] = cle.array as? [Capteur.Angle]
                {
                    for x in 0..<cle.array.count
                    {
                        entries1.append(ChartDataEntry(x: Double(x),y: Double(temp[x].getY())))
                    }
                    
                }
                if let temp : [Capteur.Angle] = cle.array as? [Capteur.Angle]
                {
                    for x in 0..<cle.array.count
                    {
                        entries2.append(ChartDataEntry(x: Double(x),y: Double(temp[x].getZ())))
                    }
                }
            }
        }
        
        let data1 = LineChartData()
        let line1 = LineChartDataSet(entries: entries1, label: "x")
        let line2 = LineChartDataSet(entries: entries, label: "y")
        let line3 = LineChartDataSet(entries: entries2, label: "z")
        line2.setColor(.red)
        line2.setCircleColor(.red)
        line3.setColor(.green)
        line3.setCircleColor(.green)
        data1.addDataSet(line1)
        data1.addDataSet(line2)
        data1.addDataSet(line3)
        lineChart.data = data1
           
       }
       
   }
