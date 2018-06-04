//
//  main.swift
//  SwiftSlackBot
//
//  Created by Ruben Roques on 12/02/16.
//  Copyright © 2016 Ruben Roques. All rights reserved.
//

import Foundation

func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
    if let data = text.data(using: String.Encoding.utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
        } catch let error as NSError {
            print(error)
        }
    }
    return nil
}



print("Starting server")
print("Insert bot token:", terminator:"")

if let token = readLine() {
    
    let server = SlackBot(token: token)
    
    server[.hello] = { _,message in
        print("\(message)")
    }
    
    server[.userTyping] = { _,message in
        print("\(message)")
    }
    
    server[.message] = { _,message in
        print("\(message)")
    }
    
    do {
        print("Starting server")
        try server.start()
    } catch {
        print("Server start failed \(error)")
    }

} else {
    print("Cannot run the command line tool without a token")
}













