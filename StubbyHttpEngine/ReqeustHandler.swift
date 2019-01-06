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
    func get(from url: URL, using: Data) -> Promise<Data?>
	func post(_ data: Data, to url: URL) -> Promise<Data?>
	func put(_ data: Data, to url: URL) -> Promise<Data?>
	func delete(from url: URL) -> Promise<Data?>
}
