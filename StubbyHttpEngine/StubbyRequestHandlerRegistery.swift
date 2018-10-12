//
//  StubbyRequestHandlerRegistery.swift
//  StubbyHttpEngine
//
//  Created by Shane Whitehead on 12/10/18.
//  Copyright © 2018 BeamCommunications. All rights reserved.
//

import Foundation


public class StubbyRequestHandlerRegistery {
	public static let shared: StubbyRequestHandlerRegistery = StubbyRequestHandlerRegistery()
	
	public private(set) var handlers: [RequestHandler] = []
	
	public func add(_ handler: RequestHandler) {
		handlers.append(handler)
	}
	
	public func remove(_ handler: RequestHandler) {
		guard let index = index(of: handler) else {
			return
		}
		handlers.remove(at: index)
	}
	
	func index(of handler: RequestHandler) -> Int? {
		return handlers.firstIndex { $0 === handler }
	}
}
