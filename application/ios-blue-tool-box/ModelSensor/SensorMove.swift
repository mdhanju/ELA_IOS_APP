import Foundation


class SensorMove: Sensor
{
    private var nbrPas: Int = 0
    private var etat : Bool = false
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,nbrPas : Int,etat : Bool = true,identifier : String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.nbrPas = nbrPas
        self.etat = etat
    }
    
    func getNbrPas()-> Int
    {
        return nbrPas
    }
    
    func getEtat()-> Bool
    {
        return etat
    }
    
    override  func ExecuterCommmande()
    {
        print("commande executer")
    }
}
