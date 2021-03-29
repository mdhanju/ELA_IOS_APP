import Foundation

class SensorMagnetic: Sensor
{
    private var nbrObjet: Int = 0
    private var etat : Bool = false
    
    
    init(name : String,RSSI : Int,batterylevel : Int,sensorTypes: SensorTypes,nbrObjet : Int,etat : Bool,identifier: String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.nbrObjet = nbrObjet
        self.etat = etat
    }
    
    func getEtat()->Bool
    {
        return etat
    }
    
    func getNbrObject()->Int
    {
        return nbrObjet
    }
    
    override func ExecuterCommmande()
    {
        print("commande executer")
    }
}
