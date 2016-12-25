//
//  SwiftClass2.swift
//  JSON2Model
//
//  Created by Rdxer on 2016/12/25.
//  Copyright © 2016年 LXF. All rights reserved.
//

import Cocoa

class SwiftClass2 : NSObject{
    
    var varList = [SwiftVar]()
    
    @objc static func model_InitWith(_ dict:NSDictionary)->SwiftClass2{
        
        return SwiftClass2(dict as! [String : NSObject?])
    }
    
    public init(_ dict:[String:NSObject?]) {
        for item in dict {
            let v = SwiftVar()
            varList.append(v)
            v.name = item.key
//            if item.value == nil {
//                v.type = "Any?"
//            }
//            else if item.value is String {
//                v.type =
//            }
            
//            print(value_)
            switch item.value {
            case is String:
                v.type = "String?"
                break
            
            case is Double,is Float,is Int:
                
                if let valueNumber = item.value as? Int{
                    if Double(valueNumber) == Double(item.value as! Double){
                        v.type = "Int?"
                        break
                    }
                }
                
                v.type = "Double?"
                
            default:
                if let clazz = item.value?.classForKeyedArchiver{
                    v.type = "\(clazz)"
                    break
                }
                v.type = "Any?"
                break
                
            }
        }
    }
    
    func makeInterfaceCode()->String{
        var res = ""
        for varItem in varList {
            res = res.appending("    "+varItem.makeVarCode()+"\n")
        }
        return res
    }
}


class SwiftVar: NSObject {
    var name:String?
    var type:String?
    var isOpretion:Bool?
    
    
//    init(name:String,type:String,isOpretion:Bool) {
//        self.name = name
//        self.type = type
//        self.isOpretion
//    }
    
    func makeVarCode()->String{
        var code = ""
        code = code.appendingFormat("var %@:%@", name!,type!)
        if isOpretion == true{
            code = code.appending("?")
        }
        return code
    }
    
//    override var description : String {
//        return "<\(self.classForCoder)-\(self.hash)>:\(dictionaryWithValuesForKeys(propertyList()).description)"
//    }
}
