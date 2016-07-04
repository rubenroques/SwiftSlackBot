//
//  main.swift
//  SwiftSlackBot
//
//  Created by Ruben Roques on 12/02/16.
//  Copyright © 2016 Ruben Roques. All rights reserved.
//

import Foundation


func convertStringToDictionary(text: String) -> [String:AnyObject]? {
    if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
        do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
        } catch let error as NSError {
            print(error)
        }
    }
    return nil
}



typealias Message = String
typealias Handler = (Event, Message) -> (Void)

class SlackBot {

    private var token : String = ""
    private var socket = WebSocket()

    var handlerDictionary:[Event:Handler] = [:]

    let slackAPIURL = "https://slack.com/api/rtm.start?"
    let rtmStartMethod = "token="

    func start(forever: Bool = true) throws {

        let url = NSURL(string: slackAPIURL+rtmStartMethod+self.token)!
        print("Wiil request WS URL from address: \(url)")

        let request: NSURLRequest = NSURLRequest(URL: url)
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
        let dataVal: NSData = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: response)

        let str = try NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.AllowFragments) as! [String:AnyObject]

        if let wsAddress = str["url"] as? String {
            print("Wiil connect to WS address: \(wsAddress)")
            self.openConnectionWithAddress(wsAddress, forever: forever)
        }


/*
        //There is an error with the NSURLSession when used in CLI tool?
        //CFNetwork SSLHandshake failed (-9824) NSURLSession/NSURLConnection HTTP load failed (kCFStreamErrorDomainSSL, -9824)

        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            do{
                let str = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [String:AnyObject]

                if let wsAddress = str["url"] as? String {

                    dispatch_async(dispatch_get_main_queue(), {
                        print("Wiil connect to WS address: \(wsAddress)")
                        self.openConnectionWithAddress(wsAddress, forever: forever)
                    })
                }
            }
            catch {

            }
        })
        task.resume()

        if forever {

            // So the program doesn't end
            while true {
                // need to get rid of this somehow...
                NSRunLoop.mainRunLoop().run()
            }
        }
*/

    }

    func openConnectionWithAddress(webSocketAddress:String, forever: Bool = true) {

        socket.event.open = {
            print("WS Connection opened")
        }
        socket.event.close = { code, reason, clean in
            print("WS Connection closed")
        }
        socket.event.error = { error in
            print("WS Connection Failed!\n\(error)")
        }
        socket.event.message = { message in
            guard let messageString = message as? String else {
                return
            }

            guard let jsonMessage = convertStringToDictionary(messageString), let messageType = jsonMessage["type"] as? String else {
                return
            }
            let eventType = eventForMessageType(messageType)

            if let handler = self.handlerDictionary[eventType] {
                handler(eventType,messageString)
            }
        }

        print("Starting WS connection...")
        socket.open(webSocketAddress)

        if forever {
            //Stolen from Taylor @ https://github.com/izqui/Taylor/
            //So the program doesn't end
            while true {
                //need to get rid of this somehow...
                NSRunLoop.mainRunLoop().run()
            }
        }

    }

    init(token:String = ""){
        self.token = token
    }

    subscript(event: Event) -> Handler {
        get {
            guard let handler = self.handlerDictionary[event] else {
                return { _,_ in }
            }
            return handler
        }
        set(newHandler) {
            self.handlerDictionary[event] = newHandler
        }
    }
}


let server = SlackBot(token: "")

server[.Hello] = { _,message in
    print("\(message)")
}


server[.UserTyping] = { _,message in
    print("\(message)")
}


server[.Message] = { _,message in
    print("\(message)")
}


do {
    print("Starting server")
    try server.start()
} catch {
    print("Server start failed \(error)")
}











