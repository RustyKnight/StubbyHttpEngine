//
//  HttpRequestBuilder.swift
//  StubbyHttpEngine
//
//  Created by Shane Whitehead on 12/10/18.
//  Copyright © 2018 BeamCommunications. All rights reserved.
//

import Foundation
import HttpEngineCore

public class HttpRequestBuilderFactory: HttpEngineCore.HttpRequestBuilderFactory{
	
	public init() {}
	
	public func request(to url: URL) -> HttpEngineCore.HttpRequestBuilder {
		return HttpRequestBuilder(to: url)
	}
}

public class HttpRequestBuilder: BaseHttpRequestBuilder {
	public override func build() throws -> HttpEngineCore.HttpEngine {
		
		return HttpEngine(url: url,
											headers: headers,
											parameters: parameters,
											progressMonitor: progressMonitor,
											credentials: credentials)
	}
}
