//
//  ios_blue_tool_boxTests.swift
//  ios-blue-tool-boxTests
//
//  Created by ELA Innovation on 21/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//
import ios_blue_tool_box
import XCTest




class ios_blue_tool_boxTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
     func hexaToBinary_01() throws
       {
        XCTAssertEqual(ConvertionToolbox.hexaToBinary(str: "5f5f"),"101111101011111");
        
       }
    
       /*
         func testEx_02() throws
       {
           XCTAssertEqual(ConvertionToolbox.hexaToBinary(nil),"")
       }
 */
       
       func hexaToBinary_03() throws
         {
             XCTAssertEqual(ConvertionToolbox.hexaToBinary(str: ""),"")
         }
     
    /*   func testEx_04() throws
         {
             XCTAssertEqual(ConvertionToolbox.hexaToBinary(str: "5f5f"),"")
         }
 */
       func HexaToBinary_05() throws
       {
           XCTAssertEqual(ConvertionToolbox.hexaToBinary(str: "5F5F5"),"1011111010111110101")
       }
    
       
      /* func testEx_06() throws
       {
           XCTAssertEqual(ConvertionToolbox.hexaToBinary(str: "azerty"),"")
       }
 */
    
    
    func testConvertTemperature1() throws
        {
        XCTAssertEqual(ConvertionToolbox.ConvertTemperature(str: "AB0A"),-27.31)
        }
    
    func testConvertTemperature3() throws
        {
        XCTAssertEqual(ConvertionToolbox.ConvertTemperature(str: "745e"),-27.31)
        }
    
    func testConvertTemperature2() throws
        {
      XCTAssertEqual(ConvertionToolbox.ConvertTemperature(str: ""),0)
        }
    
    func testisHexa0() throws
        {
        XCTAssertEqual(ConvertionToolbox.isHexa(str: "05af"), false)
        }
    func testisHexa1() throws
        {
        XCTAssertEqual(ConvertionToolbox.isHexa(str: "0x5af"), true)
        }
    
    func testANG() throws
        {
        XCTAssertEqual(ConvertionToolbox.ANG(str: "",index: 0), "")
        }
    
    func testANG0() throws
        {
        XCTAssertEqual(ConvertionToolbox.ANG(str: "ff0adfbfdfbf",index: 0), "0aff")
        }
    func testANG1() throws
        {
        XCTAssertEqual(ConvertionToolbox.ANG(str: "ff0adfbfdfbf",index: 4), "bfdf")
        }
    
    
    func testANG2() throws
        {
        XCTAssertEqual(ConvertionToolbox.ANG(str: "ff0adfbfcfba",index: 8), "bacf")
        }
    func testconvertHexaToEtat() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtat(str: ""),false)
        }
    func testconvertHexaToEtat1() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtat(str: "1"),false)
        }
    func testconvertHexaToEtat2() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtat(str: "010100101"),false)
        }
    func testconvertHexaToEtat3() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtat(str: "010100100"),true)
        }
    
    func testconvertHexaToEtat4() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtat(str: "0"),true)
        }
    func testisBinary() throws
        {
            XCTAssertEqual(ConvertionToolbox.isBinary(str: ""),false)
        }
    func testisBinary1() throws
        {
            XCTAssertEqual(ConvertionToolbox.isBinary(str: "a0"),false)
        }
    func testisBinary2() throws
        {
            XCTAssertEqual(ConvertionToolbox.isBinary(str: "0a"),false)
        }
    func testisBinary3() throws
        {
            XCTAssertEqual(ConvertionToolbox.isBinary(str: "0101"),true)
        }
    func testisBinary4() throws
        {
            XCTAssertEqual(ConvertionToolbox.isBinary(str: "0"),true)
        }
    
    
    
    func testconvertHexaToEtatInv() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtatInv(str: ""),false)
        }
    func testconvertHexaToEtatInv1() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtatInv(str: "0"),false)
        }
    func testconvertHexaToEtatInv2() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtatInv(str: "010100101"),true)
        }
    func testconvertHexaToEtatInv3() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtatInv(str: "010100100"),false)
        }
    
    func testconvertHexaToEtatInv4() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToEtatInv(str: "1"),true)
        }
    func testconvertHexaToSumExpo() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToSumExpo(str: "A"),5)
        }
    func testconvertHexaToSumExpo1() throws
        {
            XCTAssertEqual(ConvertionToolbox.convertHexaToSumExpo(str: ""),0)
        }
    func testConvertHexaToDecimal() throws
        {
            XCTAssertEqual(ConvertionToolbox.ConvertHexaToDecimal(str: "3000"),48)
        }

    func testConvertMagnetique() throws
          {
              XCTAssertEqual(ConvertionToolbox.ConvertMagnetique(str: "0000"),0)
          }
    
    func testConvertMagnetique1() throws
        {
            XCTAssertEqual(ConvertionToolbox.ConvertMagnetique(str: "FB0A"),1405)
        }
  
    func testConvertHexaToSumExpo1() throws
        {
             XCTAssertEqual(ConvertionToolbox.convertHexaToSumExpo(str: ""),0)
        }

    func testConvertHexaToBinary4() throws
        {
             XCTAssertEqual(ConvertionToolbox.hexaToBinary(str: ""),"")
        }
    func testConvertHexaToBinary() throws
        {
             XCTAssertEqual(ConvertionToolbox.hexaToBinary(str: "acab"),"1010110010101011")
        }
    
    func testConvertHumidite() throws
        {
            XCTAssertEqual(ConvertionToolbox.ConvertHumidite(str: "30"),48)
        }
    func testConvertHumidite1() throws
        {
            XCTAssertEqual(ConvertionToolbox.ConvertHumidite(str: "00"),0)
        }
    
    
    
    

}


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
     
        let binary = String(Int(str, radix: 16)!, radix: 2)
    // print("la valeur en binaire" + binary) // "1111101011001110"
     
   
         

         
     // check si le premier digit de la string est 1 ou un 0
       
        str = String(binary.prefix(1))
        if(str != "0")
            {
      //   print("est un nombre negatif")
                var complement = Int(binary)! &+ 1
                decimal = complement
                    //decimal = decimal * -1
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
