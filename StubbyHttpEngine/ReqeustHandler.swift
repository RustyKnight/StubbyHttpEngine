//
//  ReqeustHandler.swift
//  StubbyHttpEngine
//
//  Created by Shane Whitehead on 12/10/18.
//  Copyright © 2018 BeamCommunications. All rights reserved.
//

import Foundation
import Hydra

public protocol RequestHandler: class {
	func canGet(from: URL) -> Bool
	func canPost(to: URL) -> Bool
	func canPut(to: URL) -> Bool
	func canDelete(from: URL) -> Bool
	
	func get(from url: URL) -> Promise<Data?>
	func post(to url: URL) -> Promise<Data?>
	func put(to url: URL) -> Promise<Data?>
	func delete(from url: URL) -> Promise<Data?>
}
