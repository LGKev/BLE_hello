//
//  BLEManager.swift
//  HelloBLE
//
//  Created by Kevin Kuwata on 6/1/17.
//  Copyright © 2017 Kevin Kuwata. All rights reserved.
//

/*:
 Following this guide: http://hatemfaheem.blogspot.com/2014/12/how-would-you-scan-for-nearby-ble.html
 
 because it actually uses MVC and is a barebones example
 
 */

import Foundation
import CoreBluetooth

class BLEManager{
    
    var centralManager: CBCentralManager?
    var bleHandler: BLEHandler // our delegate
    
    
    init(){
        self.bleHandler = BLEHandler()
        self.centralManager = CBCentralManager(delegate: self.bleHandler, queue: nil)
    }
    
    //so after we scan with bleHanlder we should stop scan and connect
    
}


//: MARK: Handles our delegate
class BLEHandler: NSObject, CBCentralManagerDelegate{
    
    var peripheralBLE: CBPeripheral?

    override init(){
        super.init()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch (central.state){
        case .unsupported:
            print("not supported")
        case .unauthorized:
            print("unauthorized")
        case .poweredOn:
            print("ON")
            print("scanning...")
            central.scanForPeripherals(withServices: nil, options: nil) //scan for any peripheral
        case .poweredOff:
            print("OFF")
        default:
            print("default")
        }
        
    }
    
    // scanning found these items
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
//        let device = (advertisementData as NSDictionary)
//            .object(forKey: CBAdvertisementDataLocalNameKey)
//            as? NSString
        if(peripheral.name == nil || peripheral.name == ""){
            return // not valid so we return out
        }
        
        //test 
        
        let device = peripheral.name
        
        
        if device?.contains("KK") == true {
            central.stopScan()
        // must store peripheral or it will fail  with error: API misuse
            self.peripheralBLE = peripheral
        //connect central to the peripheral
            central.connect(peripheral, options: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
        print("You're In Like Flynn`")
    }
    
    
    
    
}




