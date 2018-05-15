//
//  DBHandler.swift
//  DemoSQlite
//
//  Created by iexm01 on 15/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class DBHandler: NSObject {

    //MARK: - Get Document Directory Path
    class func getDBPath() -> String {
        let doumentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let str = doumentDirectoryPath.object(at: 0) as! NSString;
        let destinationPath = str.appendingPathComponent("demoSQlite.sqlite")
        return destinationPath
    }

    //MAR: - Open the database connection
    class func openDatabase() -> OpaquePointer {
        var db: OpaquePointer? = nil
        if sqlite3_open(getDBPath(), &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(getDBPath())")
            return db!
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
            return db!
        }
    }
    
    //MAR: - Auto increment the databse table row id
    class func get_NextRowID_fromTableName(tableName: String, columnName: String) -> Int{
        let db = openDatabase()
        var nextid = 0;
        let queryStatementString = "SELECT max(\(columnName)) FROM \(tableName);"
        var queryStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                nextid = Int(sqlite3_column_int(queryStatement, 0))
                print("Query Result:")
                print("\(nextid)")
                print("\(nextid+1)")
            };
        } else {
            print("SELECT statement could not be prepared")
        }
        print("next id\(nextid)")
        sqlite3_finalize(queryStatement)
        sqlite3_close(db)
        return (nextid+1)
    }

    //MARK: - Sample Query to insert record in DB
    class func insert_UserDetails_inDB(dict: NSMutableDictionary) -> String {
        var inserStatus = ""
        let rowID = get_NextRowID_fromTableName(tableName: "USERACCOUNT", columnName: "SNO")
        let db = openDatabase()
        let insertStatementString = "INSERT INTO USERACCOUNT (USERID, USERNAME, PASSWORD) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        // 1
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let id: Int32 = Int32(rowID)
            let userName: NSString = dict .value(forKey: "USERNAME") as! NSString
            let userPswd: NSString = dict .value(forKey: "PASSWORD") as! NSString
            
            // 2
            sqlite3_bind_int(insertStatement, 1, id)
            // 3
            sqlite3_bind_text(insertStatement, 2, userName.utf8String, -1, nil)
            // 4
            sqlite3_bind_text(insertStatement, 3, userPswd.utf8String, -1, nil)
            // 5
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
                inserStatus = "YES"
            } else {
                print("Could not insert row.")
                inserStatus = "NO"
            }
        } else {
            print("INSERT statement could not be prepared.")
            inserStatus = "WRONG Query"
        }
        // 5
        sqlite3_finalize(insertStatement)
        
        sqlite3_close(db)
        return inserStatus
    }
    
    //MARK: - Sample query to fetch/get datas from the DB
    class func get_userDetails_FromDB() -> NSMutableArray{
        let arrDetails = NSMutableArray()
        let db = openDatabase()
        var dict = NSMutableDictionary()
        let queryStatementString = "SELECT * FROM USERACCOUNT;"
        print(queryStatementString)
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let queryResultCol1 = sqlite3_column_text(queryStatement, 0)
                let userid = String(cString: ((queryResultCol1))!)
                let queryResultCol2 = sqlite3_column_text(queryStatement, 1)
                let username = String(cString: queryResultCol2!)
                let queryResultCol3 = sqlite3_column_text(queryStatement, 2)
                let password = String(cString: queryResultCol3!)
                dict = NSMutableDictionary()
                dict = ["userID": "\(userid)",
                    "userName": "\(username)",
                    "password": "\(password)"]
                arrDetails.add(dict)
            };
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        sqlite3_close(db)
        print(arrDetails)
        return arrDetails
    }
    
    class func update_userDetails_inDB(columnName: String, updateEmpID: String, changeValue: String) -> String {
        var updateStatus = ""
        let db = openDatabase()
        let updateStatementString = "UPDATE USERACCOUNT SET \(columnName) = '\(changeValue)' where USERID = '\(updateEmpID)';"
        var updateStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            print(updateStatement as Any)
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully updated row.")
                updateStatus = "YES"
            } else {
                print("Could not update row.")
                updateStatus = "NO"
            }
        } else {
            print("UPDATE statement could not be prepared.")
            updateStatus = "WRONG Query"
        }
        sqlite3_finalize(updateStatement)
        sqlite3_close(db)
        return updateStatus
    }
    
    class func delete_userDetail_FromDB(strID: String) -> String {
        var deleteStatus = ""
        let db = openDatabase()
        let deleteStatementString = "DELETE from USERACCOUNT where USERID = '\(strID)';"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            print(deleteStatementString)
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
                deleteStatus = "YES"
            } else {
                print("Could not delete row.")
                deleteStatus = "NO"
            }
        } else {
            print("DELETE statement could not be prepared.")
            deleteStatus = "WRONG Query"
        }
        sqlite3_finalize(deleteStatement)
        sqlite3_close(db)
        return deleteStatus
    }
    
    class func getProjectDetails_ForResource_FromDB (strResourceID: String) -> NSMutableArray {
        var dict = NSMutableDictionary()
        let arrResProjDetails = NSMutableArray()
        let db = openDatabase()
        let queryStatementString = "SELECT USERACCOUNT.USERNAME, IFNULL(PROJECTDETAIL.PROJECTID,''),IFNULL(PROJECTDETAIL.PROJECTNAME,''),IFNULL(PROJECTDETAIL.PROJECTDOMAIN,'') FROM PROJECTDETAIL INNER JOIN USERACCOUNT ON PROJECTDETAIL.USERID=USERACCOUNT.USERID WHERE USERACCOUNT.SNO  = '\(strResourceID)';"
        print(queryStatementString)
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let queryResultCol1 = sqlite3_column_text(queryStatement, 0)
                let username = String(cString: queryResultCol1!)
                let queryResultCol2 = sqlite3_column_text(queryStatement, 1)
                let projectID = String(cString: queryResultCol2!)
                let queryResultCol3 = sqlite3_column_text(queryStatement, 2)
                let projectName = String(cString: queryResultCol3!)
                let queryResultCol4 = sqlite3_column_text(queryStatement, 3)
                let projectDomain = String(cString: queryResultCol4!)
                
                dict = ["userName": "\(username)",
                    "projectID": "\(projectID)",
                    "projectName": "\(projectName)",
                    "projectDomain": "\(projectDomain)"]
                print(dict)
                arrResProjDetails.add(dict)
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        sqlite3_close(db)
        return arrResProjDetails
    }
}
