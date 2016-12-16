//
//  DMLServices.swift
//  DBinSwift3
//
//  Created by tops on 12/5/16.
//  Copyright © 2016 N2n. All rights reserved.
//

import UIKit

class DMLServices: NSObject
{
    var strPath = ""
    
    
    func iudQuery(query: String) -> Bool
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        strPath = path + "/LoginAuthDB.sqlite"
        
        var status: Bool = false
        var stmnt: OpaquePointer? = nil

        if sqlite3_open(strPath, &stmnt) == SQLITE_OK
        {
            if sqlite3_prepare_v2(stmnt, query, -1, &stmnt, nil) == SQLITE_OK
            {
                sqlite3_step(stmnt)
                status = true
            }
            sqlite3_finalize(stmnt)
        }
        sqlite3_close(stmnt)
        return status
    }

    func selectQuery(query: String) -> NSMutableArray
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        strPath = path + "/LoginAuthDB.sqlite"
        print(strPath)
        
        let tempArray = NSMutableArray()
        
        //var resultData = [requestedData]()
        
        var stmnt: OpaquePointer? = nil
        
        if sqlite3_open(strPath, &stmnt) == SQLITE_OK
        {
            if sqlite3_prepare_v2(stmnt, query, -1, &stmnt, nil) == SQLITE_OK

            {
                while sqlite3_step(stmnt) == SQLITE_ROW
                {
                    //var tempDict = [String : String]()
                    let tempDict=NSMutableDictionary()
                    
                    // name, username, password, email, contnum, designation, doj<date>, gender, cityone, citytwo, citythree, cityfour, cityfive, citysix
                    
                    //let uid = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement, 0)))
//
//                    let name = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 0)))
//                    let username = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 1)))
//                    let password = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 2)))
//                    let email = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 3)))
//                    let contnum = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 4)))
//                    let designation = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 5)))
//                    let doj = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 6)))
//                    let gender = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 7)))
//                    let cityone = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 8)))
//                    let citytwo = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 9)))
//                    let citythree = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 10)))
//                    let cityfour = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 11)))
//                    let cityfive = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 12)))
//                    let citysix = String.cString(UnsafePointer<CChar>(sqlite3_column_text(stmnt, 13)))
//                    
                    
                    let name = String(cString: sqlite3_column_text(stmnt, 0))
                    let username = String(cString: sqlite3_column_text(stmnt, 1))
                    let password = String(cString: sqlite3_column_text(stmnt, 2))
                    let email = String(cString: sqlite3_column_text(stmnt, 3))
                    let contnum = String(cString: sqlite3_column_text(stmnt, 4))
                    let designation = String(cString: sqlite3_column_text(stmnt, 5))
                    
                    let doj = String(cString: sqlite3_column_text(stmnt, 6))
                    
                    let gender = String(cString: sqlite3_column_text(stmnt, 7))
                    let cityone = String(cString: sqlite3_column_text(stmnt, 8))
                    let citytwo = String(cString: sqlite3_column_text(stmnt, 9))
                    let citythree = String(cString: sqlite3_column_text(stmnt, 10))
                    let cityfour = String(cString: sqlite3_column_text(stmnt, 11))
                    let cityfive = String(cString: sqlite3_column_text(stmnt, 12))
                    let citysix = String(cString: sqlite3_column_text(stmnt, 13))
                    
                    tempDict["name"] = name
                    tempDict["username"] = username
                    tempDict["password"] = password
                    tempDict["email"] = email
                    tempDict["contnum"] = contnum
                    tempDict["designation"] = designation
                    tempDict["doj"] = doj
                    tempDict["gender"] = gender
                    tempDict["cityone"] = cityone
                    tempDict["citytwo"] = citytwo
                    tempDict["citythree"] = citythree
                    tempDict["cityfour"] = cityfour
                    tempDict["cityfive"] = cityfive
                    tempDict["citysix"] = citysix
                    
                    tempArray.add(tempDict)
//                    let objReqData = requestedData()
//                    
//                    objReqData.name = name
//                    objReqData.username = username
//                    objReqData.password = password
//                    objReqData.email = email
//                    objReqData.contnum = contnum
//                    objReqData.designation = designation
//                    objReqData.doj = doj
//                    objReqData.gender = gender
//                    objReqData.cityone = cityone
//                    objReqData.citytwo = citytwo
//                    objReqData.citythree = citythree
//                    objReqData.cityfour = cityfour
//                    objReqData.cityfive = cityfive
//                    objReqData.citysix = citysix
//                    
//                    resultData.append(objReqData)
                    print(tempArray)
                }
            }
            sqlite3_finalize(stmnt)
        }
         sqlite3_close(stmnt)
        return tempArray
    }
}

//class requestedData
//{
//    var name: String = ""
//    var username: String = ""
//    var password: String = ""
//    var email: String = ""
//    var contnum: String = ""
//    var designation: String = ""
//    var doj: String = ""
//    var gender: String = ""
//    var cityone: String = ""
//    var citytwo: String = ""
//    var citythree: String = ""
//    var cityfour: String = ""
//    var cityfive: String = ""
//    var citysix: String = ""
//}
