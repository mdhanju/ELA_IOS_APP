//
//  ConvertionToolbox.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 20/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import Foundation

/**
 * \fn NSRegularExpression
 * \brief function to calculate regex more easily
 * \param [in] String : hexadecimal from frame
 * \return Bool
 **/

public extension NSRegularExpression {
     func matches(_ string: String) -> Bool {
         let range = NSRange(location: 0, length: string.utf16.count)
         return firstMatch(in: string, options: [], range: range) != nil
     }
 }

public class ConvertionToolbox : NSObject {

    
 
    
    
    
    /**
     * \fn ANG
     * \brief function to calculate x or y or z aceleration
     * \param [in] String : hexadecimal from frame Index : position of string hexadecimal to start
     * \return String
     **/

    static func ANG(str :String,index : Int)->String
    {
        if( str == "")
        {
            return str
        }
        
        
        var sumA : String = ""
        var sumB : String = ""
        var cpt : Int = 0
        var a : Int = index
        var b : Int = a + 2
            
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
        print("\n" + sumA)
        return sumA
    }

    /**
     * \fn convertHexaToEtat
     * \brief take a string and give bool value if last digit is 0 or 1
     * \param [in] String : hexadecimal
     * \return Bool
     **/

    
    static func convertHexaToEtat(str : String)-> Bool
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

    
    static func convertHexaToEtatInv(str : String)-> Bool
    {
       if(str.suffix(1) == "1")
           {
            return true
           }
       else
           {
            return false
           }
    }
    
    /**
     * \fn convertHexaToSumExpo
     * \brief sum of pow of 2 for the string
     * \param [in] String : hexadecimal
     * \return Int
     **/
    
    static func convertHexaToSumExpo(str : String)-> Int
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
    
    static func ConvertHexaToDecimal(str :String) -> Int
    {
        if(str == "")
        {
            return 0
        }
             var LSB : String = String(str.prefix(2))
             var MSB : String = String(str.suffix(2))
             var str : String =  MSB + LSB
          
          //print("la valeur de la chaine : "+str)
          // Hexadecimal to decimal
          
         /*   if(str == ">)Op")
                {
                    return 0
                }
 */
            if( str == "ilni")
                {
                  return 0
                }
            var decimal = Int(str, radix: 16)!
             
            //print("la valeur en decimal : " + String(decimal)) // 163
            return decimal
              
    }
    
 
    
    /**
     * \fn convertTemperature
     * \brief string of hexa to temperature in decimal
     * \param [in] String : hexadecimal
     * \return Float
     **/
    /*
   static func ConvertTemperature(str :String) -> Float
      {
           
       //split string on second letter
      // var str = "abcdef"
       
       //delete 0x of hexadecimal
       var hexa  = str.dropFirst().dropFirst()
          
          var LSB : String = String(hexa.prefix(2))
          var MSB : String = String(hexa.suffix(2))
          var str : String =  MSB + LSB
       
       print("la valeur de la chaine : "+str)
       // Hexadecimal to decimal
       

          var decimal = Int(str, radix: 16)!
          print(decimal)
          // print("la valeur en decimal : " + String(decimal)) // 163
       

           
       // Hexadecimal to binary
       
          let binary = String(Int(str, radix: 16)!, radix: 2)
      // print("la valeur en binaire" + binary) // "1111101011001110"
       

           

           
       // check si le premier digit de la string est 1 ou un 0
         
          str = String(binary.prefix(1))
          if(str != "0")
              {
        //   print("est un nombre negatif")
                  decimal = decimal * -1
           }
          return Float(decimal) / 100.0
           
      }
    */
   public  static func ConvertTemperature(str :String) -> Float
      {

          
          if(str == "")
          {
              return 0
          }
           
       //split string on second letter
      // var str = "abcdef"
          var LSB : String = String(str.prefix(2))
          var MSB : String = String(str.suffix(2))
          var str : String =  MSB + LSB
       
     //  print("la valeur de la chaine : "+str)
       // Hexadecimal to decimal
       

          var decimal = Int(str, radix: 16)!
          
          // print("la valeur en decimal : " + String(decimal)) // 163
       

           
       // Hexadecimal to binary
       
          var binary = String(Int(str, radix: 16)!, radix: 2)
      // print("la valeur en binaire" + binary) // "1111101011001110"
       

           

           
       // check si le premier digit de la string est 1 ou un 0
         
          str = String(binary.prefix(1))
          if(str != "0")
              {
        //   print("est un nombre negatif")
               //   decimal = decimal * -1
              
             //  var test = UInt8(binary)! &+ 1
            // print(test)
      //       var ta =  Double(Int16(bitPattern: UInt16(str, radix: 16)!) &+ 1)
               
              // unsafeBitCast(UInt16(ta/2 + 1), Int16.self
               let random = Int((~UInt16(decimal) + 1)) * (-1)
               return Float(random) / 100.0
                
              // print(UInt8(UInt8(binary)! &+ 1))
             //  var a = Int(binary)! &+ 1
              // print(a)
            // let a = str
              // var b : Int = Int(str, radix: 16)!
             //let a = UInt8(UInt8?(binary) &+ 1)
             
           }
          return Float(decimal) / 100.0
           

    }

    
      /**
       * \fn convertHexaToSumExpo
       * \brief sum of pow of 2 for the string
       * \param [in] String : hexadecimal
       * \return Int
       **/
      
      static func ConvertMagnetique(str : String)-> Int
      {

      if(str == "")
          {
           return 0
          }
        
    var LSB : String = String(str.prefix(2))
    var MSB : String = String(str.suffix(2))
    var str : String =  MSB + LSB
          
     str = String(Int(str, radix: 16)!, radix: 2)

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
    
    
       static func ConvertHumidite(str :String) -> Int
        {
            if(str == "")
            {
                return 0
            }
              
              
              //print("la valeur de la chaine : "+str)
              // Hexadecimal to decimal
              
             /*   if(str == ">)Op")
                    {
                        return 0
                    }
     */
                if( str == "ilni")
                    {
                      return 0
                    }
                var decimal = Int(str, radix: 16)!
                 
                //print("la valeur en decimal : " + String(decimal)) // 163
                return decimal
                  
        }
 
    
    
    /**
     * \fn hexaToBinary
     * \brief convert hexa to binary
     * \param [in] String : hexadecimal
     * \return Int
     **/
    
    static func hexaToBinary(str : String)->String
    {
        

        
       
       // var hexa  = str.dropFirst().dropFirst()
        
        if( str == "")
         {
            return str
         }
         let binary = String(Int(str, radix: 16)!, radix: 2)
         return binary
    }
    
    
    /**
     * \fn isHexa
     * \brief check if the string in input is hexadecimal
     * \param [in] String : hexadecimal
     * \return Bool
     **/
    
    static func isHexa(str:String)-> Bool
    {
        do {
             var regex = try NSRegularExpression(pattern: "0[xX][0-9a-fA-F]+")
              if(!regex.matches(str))
              {
                 var str1 = ""
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
    
    static func isBinary(str:String)-> Bool
    {
        do {
             var regex = try NSRegularExpression(pattern: "^[01]+$")
              if(!regex.matches(str))
              {
                 var str1 = ""
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
