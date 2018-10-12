//
//  HttpEngine.swift
//  StubbyHttpEngine
//
//  Created by Shane Whitehead on 12/10/18.
//  Copyright © 2018 BeamCommunications. All rights reserved.
//

import Foundation
import HttpEngineCore
import Hydra

enum HttpEngineError: Error {
	case noHandlersAvaliableForRequest(url: URL)
}

open class HttpEngine: HttpEngineCore.HttpEngine {
	
	var url: URL!
	var parameters: [String: String]?
	var progressMonitor: HttpProgressMonitor?
	var headers: [String: String]?
	
	var credentials: Credentials?
	
	public init(url: URL,
								headers: [String: String]? = nil,
								parameters: [String: String]? = nil,
								progressMonitor: HttpProgressMonitor? = nil,
								credentials: Credentials? = nil) {
		self.url = url
		self.headers = headers
		self.parameters = parameters
		self.progressMonitor = progressMonitor
		self.credentials = credentials
	}

	open func get() -> Promise<Data?> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canGet(from: url) {
				return handler.get(from: url)
			}
		}
		return Promise<Data?>(rejected: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func put() -> Promise<Data?> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canPut(to: url) {
				return handler.put(to: url)
			}
		}
		return Promise<Data?>(rejected: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func post(data: Data) -> Promise<Data?> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canPost(to: url) {
				return handler.post(data, to: url)
			}
		}
		return Promise<Data?>(rejected: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func delete() -> Promise<Data?> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canDelete(from: url) {
				return handler.delete(from: url)
			}
		}
		return Promise<Data?>(rejected: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
}
