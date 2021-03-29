//
//  ios_blue_tool_boxTests.swift
//  ios-blue-tool-boxTests
//
//  Created by ELA Innovation on 21/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//
import ios_blue_tool_box
import XCTest


/*

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


*/
