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
	public func request(to url: URL) -> HttpEngineCore.HttpRequestBuilder {
		return HttpRequestBuilder(url: url)
	}
}

public class HttpRequestBuilder: BaseHttpEngineBuilder {
	public override func build() throws -> HttpEngineCore.HttpEngine {
		
		return HttpEngine(url: url,
											headers: headers,
											parameters: parameters,
											progressMonitor: progressMonitor,
											credentials: credentials)
	}
}
