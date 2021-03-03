   public class SensorCaracteristic
   {
    
    /// class that have attribute and property of each object
   public class Cap
    {
    
    }
    
    
    public class Move : Cap
    {
        private var nbrPas: Int = 0
        private var etat : Bool = false
        
        init(nbrPas : Int, etat : Bool) {
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
        
    }
    
    
    public class Mag : Cap
    {
        private var nbrMagnet: Int = 0
        private var etat : Bool = false
        
        init(nbrMagnet : Int, etat : Bool) {
            self.nbrMagnet = nbrMagnet
            self.etat = etat
        }
        
        func getNbrMagnet()-> Int
        {
            return nbrMagnet
        }
        
        func getEtat()-> Bool
        {
            return etat
        }
    }
    
    public class Angle : Cap
    {
        private var x : Int = 0
        private  var y : Int = 0
        private var z : Int = 0
        
        init(x: Int,y:Int, z:Int) {
            self.x = x
            self.y = y
            self.z = z
        }
        func getX()-> Int
        {
            return x
        }
        
        func getY()-> Int
        {
            return y
        }
        func getZ()-> Int
        {
            return z
        }
        
    }
    
    
    public class TempHum : Cap
    {
        private var temp : Float
        private var hum : Int
        init(temp : Float,hum : Int) {
            self.hum = hum
            self.temp = temp
        }
        func getTemp()->Float
        {
            return temp
        }
        
        func getHum()->Int
        {
            return hum
        }
        
    }
    
    public class Temp : Cap
    {
        private var temp : Float
        init(temp : Float) {
            self.temp = temp
        }
        func getTemp()->Float
        {
            return temp
        }
    }
    
    
    
    
   }
