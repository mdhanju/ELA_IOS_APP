import Foundation

/**
 * \fn NSRegularExpression
 * \brief function to calculate regex more easily
 * \param [in] String : hexadecimal from frame
 * \return Bool
 **/



public class ConvertionToolbox : NSObject {

    /**
     * \fn ANG
     * \brief function to calculate x or y or z aceleration
     * \param [in] String : hexadecimal from frame Index : position of string hexadecimal to start
     * \return String
     **/
    
    public static func ANG(str :String,index : Int)->String
    {
        if( str == "")
        {
            return str
        }
        
        
        var sumA : String = ""
        var sumB : String = ""
        var cpt : Int = 0
        let a : Int = index
        let b : Int = a + 2
        
        for char in str
        {
            if( cpt == b  || cpt == b+1)
            {
                sumB = sumB + String(char)
            }
            if( cpt == a  || cpt == a+1 )
            {
                sumA = sumA + String(char)
            }
            cpt = cpt + 1
        }
        
        sumA = sumB + sumA
 
        return sumA
    }
    
    /**
     * \fn convertHexaToEtat
     * \brief take a string and give bool value if last digit is 0 or 1
     * \param [in] String : hexadecimal
     * \return Bool
     **/
    
    
    public static func convertHexaToEtat(str : String)-> Bool
    {
        
        if(str.suffix(1) == "0")
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    /**
     * \fn convertHexaToEtat
     * \brief take a string and give bool value if last digit is 0 or 1
     * \param [in] String : hexadecimal
     * \return Bool
     **/
    
    
    public static func convertHexaToEtatInv(str : String)-> Bool
    {

        let LSB : String = String(str.prefix(2))
        let MSB : String = String(str.suffix(2))
        var str : String =  MSB + LSB
        
        str = hexaToBinary(str: str)
        if(str.suffix(1) == "1")
        {
            return true
        }
        else { return false}
    }
    /**
     * \fn convertHexaToSumExpo
     * \brief sum of pow of 2 for the string
     * \param [in] String : hexadecimal
     * \return Int
     **/
    
    public static func convertHexaToSumExpo(str : String)-> Int
    {
        
        if(str == "")
        {
            return 0
        }
        
        
        let str = String(Int(str, radix: 16)!, radix: 2)
        
        var ini : Int = 0
        
        var sum : Int = 0
        var cpt : Int = 0
        
        for char in str.reversed()
        {
            if( char == "1")
            {
                sum = sum + cpt
            }
            
            cpt = cpt * 2;
            
            if(ini == 0)
            {
                ini = ini + 1
                cpt = cpt + 1
            }
            
        }
        
        return sum
        
    }
    
    /**
     * \fn convertHexaToDecimal
     * \brief convert hexa to decimal
     * \param [in] String : hexadecimal
     * \return Int
     **/
    
    public static func ConvertHexaToDecimal(str :String) -> Int
    {
        if(str == "")
        {
            return 0
        }
        let LSB : String = String(str.prefix(2))
        let MSB : String = String(str.suffix(2))
        let str : String =  MSB + LSB
        if( str == "ilni")
        {
            return 0
        }
        let decimal = Int(str, radix: 16)!
        return decimal
        
    }
    
    
    
    /**
     * \fn convertTemperature
     * \brief string of hexa to temperature in decimal
     * \param [in] String : hexadecimal
     * \return Float
     **/
    
    public  static func ConvertTemperature(str :String) -> Float
    {
        
        if(str == "")
        {
            return 0
        }
        
        let LSB : String = String(str.prefix(2))
        let MSB : String = String(str.suffix(2))
        let str : String =  MSB + LSB
        
        
        
        let decimal = Int(str, radix: 16)!
        
        if(str.prefix(1).lowercased() == "f"
            || str.prefix(1).lowercased() == "e"
            || str.prefix(1).lowercased() == "d"
            || str.prefix(1).lowercased() == "c"
            || str.prefix(1).lowercased() == "b"
            || str.prefix(1).lowercased() == "a"
            || str.prefix(1).lowercased() == "9"
            || str.prefix(1).lowercased() == "8")
        {
            let random = Int((~UInt16(decimal) + 1)) * (-1)
            return Float(random) / 100.0
        }
        else
        {
            return Float(Int32(decimal)) / 100.0
        }
    }
    
    
    public  static func ConvertAngle(str :String) -> Int16
    {
        if(str == "")
        {
            return 0
        }
        
        var test : Int16 = 0
        let LSB : String = String(str.prefix(2))
        let MSB : String = String(str.suffix(2))
        let LSB1 = Int16(LSB, radix: 16)!
        let MSB1 = Int16(MSB, radix: 16)!
        test = Int16( MSB1 + ( LSB1 << 8))
        return test
    }
    
    
    
    public  static func ConvertAngle2(str :String) -> Float
    {
        if(str == "")
        {
            return 0
        }
        let LSB : String = String(str.prefix(2))
        let MSB : String = String(str.suffix(2))
        var str : String =  MSB + LSB
        let decimal = Int(str, radix: 16)!
        if(str.prefix(1).lowercased() == "f")
        {
            
            str = String(str.dropFirst())
            let random = Int((~UInt16(decimal) + 1)) * (-1)
            return Float(random) / 100.0
        }
        else
        {
            return Float(Int32(decimal)) / 100.0
        }
    }
    
    public static func ConvertMagnetique1(str : String)-> Int
    {
      
        
        if(str == "")
        {
            return 0
        }
        
        let LSB : String = String(str.prefix(2))
        let MSB : String = String(str.suffix(2))
        var str : String =  MSB + LSB
        
        str = String(hexaToBinary(str: str).dropLast())
       
        
        
        // var str1 = ""
        
        //str1  =  str + "0"
        
        var ini : Int = 0
        
        var sum : Int = 0
        var cpt : Int = 0
        
        for char in str.reversed()
        {
            if( char == "1" && ini != 0)
            {
                sum = sum + cpt
                
            }
            
            cpt = cpt * 2;
            
            if(ini == 0 && char == "1")
            {
                
                sum = sum + 1
                
                
            }
            if(ini == 0)
            {
                cpt = cpt + 2
            }
            ini = ini + 1
        }
        
        return sum
        
    }
    
    /**
     * \fn convertHexaToSumExpo
     * \brief sum of pow of 2 for the string
     * \param [in] String : hexadecimal
     * \return Int
     **/
    
    public static func ConvertAdvertisingValue(str : String)-> Int
    {
        
        if(str == "")
        {
            return 0
        }
        
        let LSB : String = String(str.prefix(2))
        let MSB : String = String(str.suffix(2))
        var str : String =  MSB + LSB
        str = hexaToBinary(str: str)
        
        var ini : Int = 0
        
        var sum : Int = 0
        var cpt : Int = 0
        
        for char in str.reversed()
        {
            if( char == "1")
            {
                sum = sum + cpt
            }
            
            cpt = cpt * 2;
            
            if(ini == 0)
            {
                ini = ini + 1
                cpt = cpt + 1
            }
            
        }
        
        return sum
        
    }
    
    
    /**
     * \fnConvertHumidite
     * \brief calculate humidity
     * \param [in] String : hexadecimal
     * \return Int
     **/
    
    
    public static func ConvertHumidite(str :String) -> Int
    {
        if(str == "")
        {
            return 0
        }
        
        if( str == "ilni")
        {
            return 0
        }
        let decimal = Int(str, radix: 16)!
        return decimal
        
    }
    
    
    
    /**
     * \fn hexaToBinary
     * \brief convert hexa to binary
     * \param [in] String : hexadecimal
     * \return String
     **/
    
    public static func hexaToBinary(str : String)->String
    {
        
        if( str == "")
        {
            return str
        }
        
        let string = "1" + str
        
        let binary = String(Int(string, radix: 16)!, radix: 2)
        return String(binary.dropFirst())
    }
    
    
    /**
     * \fn isHexa
     * \brief check if the string in input is hexadecimal
     * \param [in] String : hexadecimal
     * \return Bool
     **/
    
    public static func isHexa(str:String)-> Bool
    {
        do {
            let regex = try NSRegularExpression(pattern: "0[xX][0-9a-fA-F]+")
            if(!regex.matches(str))
            {
                return false
            }
            else {
                return true
            }
        }
        catch {
            preconditionFailure("Illegal regular expression: .")
        }
    }
    
    
    /**
     * \fn isHexa
     * \brief check if the string in input is hexadecimal
     * \param [in] String : hexadecimal
     * \return Bool
     **/
    
    public static func isBinary(str:String)-> Bool
    {
        do {
            let regex = try NSRegularExpression(pattern: "^[01]+$")
            if(!regex.matches(str))
            {
                return false
            }
            else {
                return true
            }
        }
        catch {
            preconditionFailure("Illegal regular expression: .")
        }
    }
}

