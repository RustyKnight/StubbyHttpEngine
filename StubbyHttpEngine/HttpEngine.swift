//
//  HttpEngine.swift
//  StubbyHttpEngine
//
//  Created by Shane Whitehead on 12/10/18.
//  Copyright © 2018 BeamCommunications. All rights reserved.
//

import Foundation
import HttpEngineCore
import PromiseKit

enum HttpEngineError: Error {
	case noHandlersAvaliableForRequest(url: URL)
}

struct DefaultRequestResponse: RequestResponse {
	var responseHeaders: [AnyHashable : Any]?
	
	var statusCode: Int
	var statusDescription: String
	var data: Data?
}

open class HttpEngine: HttpEngineCore.HttpEngine {
  public func post(formData: [MultipartFormItem]) -> Promise<RequestResponse> {
    fatalError("Not implemented")
  }
  
	
	
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
	
	public func get(data: Data) -> Promise<RequestResponse> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canGet(from: url) {
				return handler.get(from: url, using: data)
			}
		}
		return Promise<RequestResponse>(error: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func get() -> Promise<RequestResponse> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canGet(from: url) {
				return handler.get(from: url)
			}
		}
		return Promise<RequestResponse>(error: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func put(data: Data) -> Promise<RequestResponse> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canPut(to: url) {
				return handler.put(data, to: url)
			}
		}
		return Promise<RequestResponse>(error: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func put() -> Promise<RequestResponse> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canPut(to: url) {
				return handler.put(to: url)
			}
		}
		return Promise<RequestResponse>(error: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func post(data: Data) -> Promise<RequestResponse> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canPost(to: url) {
				return handler.post(data, to: url)
			}
		}
		return Promise<RequestResponse>(error: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func post() -> Promise<RequestResponse> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canPost(to: url) {
				return handler.post(to: url)
			}
		}
		return Promise<RequestResponse>(error: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func delete() -> Promise<RequestResponse> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canDelete(from: url) {
				return handler.delete(from: url)
			}
		}
		return Promise<RequestResponse>(error: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
	open func delete(data: Data) -> Promise<RequestResponse> {
		for handler in StubbyRequestHandlerRegistery.shared.handlers {
			if handler.canDelete(from: url) {
				return handler.delete(from: url)
			}
		}
		return Promise<RequestResponse>(error: HttpEngineError.noHandlersAvaliableForRequest(url: url))
	}
	
}
