//
//  Input.swift
//  Quiz
//
//  Created by Fernando Castor on 03/07/15.
//  Copyright (c) 2015 UFPE. All rights reserved.
//

import Foundation

func input() -> String {
  
  
  let keyboard = NSFileHandle.fileHandleWithStandardInput()
  let inputData = keyboard.availableData
  var result : NSString = ""
  if let res = NSString(data: inputData, encoding:NSUTF8StringEncoding) {
    result = res
  }
  return result.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}
