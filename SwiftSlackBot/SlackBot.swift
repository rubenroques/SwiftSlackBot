//
//  SlackBot.swift
//  SwiftSlackBot
//
//  Created by Ruben Roques on 12/02/16.
//  Copyright © 2016 Ruben Roques. All rights reserved.
//

import Foundation

typealias Message = String
typealias Handler = (Event, Message) -> (Void)

class SlackBot {

    fileprivate var token : String = ""
    fileprivate var socket = WebSocket()

    var handlerDictionary:[Event:Handler] = [:]

    let slackAPIURL = "https://slack.com/api/rtm.start?"
    let rtmStartMethod = "token="

    init(token:String = ""){
        self.token = token
    }

    func start(_ forever: Bool = true) throws {

        let url = URL(string: slackAPIURL+rtmStartMethod+self.token)!
        print("Wiil request WS URL from address: \(url)")

        let request: URLRequest = URLRequest(url: url)
        let response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
        let dataVal: Data = try! NSURLConnection.sendSynchronousRequest(request, returning: response)

        let str = try JSONSerialization.jsonObject(with: dataVal, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]

        if let wsAddress = str["url"] as? String {
            print("Wiil connect to WS address: \(wsAddress)")
            self.openConnectionWithAddress(wsAddress, forever: forever)
        }
    }

    func openConnectionWithAddress(_ webSocketAddress:String, forever: Bool = true) {

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
                RunLoop.main.run()
            }
        }
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
