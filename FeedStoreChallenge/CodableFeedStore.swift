//
//  CodableFeedStore.swift
//  FeedStoreChallenge
//
//  Created by Andrey Chirkov on 18/05/2019.
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import Foundation

typealias Feed = [CodableFeedImage]

public struct CodableFeedImage: Codable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let url: URL

    public init(_ local: LocalFeedImage) {
        self.id = local.id
        self.description = local.description
        self.location = local.location
        self.url = local.url
    }

    enum CodingKeys: String, CodingKey {
        case id, description, location, url
    }

    var local: LocalFeedImage {
        return LocalFeedImage(id: id, description: description, location: location, url: url)
    }
}

public class CodableFeedStore: FeedStore {
    let fileManager: FileManager
    var timestamp: Date?

    var path: String {
        return getURL().appendingPathComponent(String(describing: FeedStore.self), isDirectory: false).path
    }

    let queue = DispatchQueue(label: "\(CodableFeedStore.self).Queue", qos: .userInitiated, attributes: .concurrent)

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    private func getURL() -> URL {
        if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return directory
        } else {
            fatalError("Couldn't create directory to save")
        }
    }

    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        queue.async(flags: .barrier) {
            if self.fileManager.fileExists(atPath: self.path) {
                do {
                    try self.fileManager.removeItem(atPath: self.path)
                    self.timestamp = nil
                    completion(.none)
                } catch {
                    completion(error)
                }
            } else {
                completion(.none)
            }
        }
    }

    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        queue.async(flags: .barrier) {
            do {
                let data = try JSONEncoder().encode(feed.map(CodableFeedImage.init))
                if self.fileManager.fileExists(atPath: self.path) {
                    try self.fileManager.removeItem(atPath: self.path)
                }
                self.fileManager.createFile(atPath: self.path, contents: data, attributes: nil)
                self.timestamp = timestamp
                completion(.none)
            } catch {
                completion(error)
            }
        }
    }

    public func retrieve(completion: @escaping RetrievalCompletion) {
        queue.async {
            if let data = self.fileManager.contents(atPath: self.path), let time = self.timestamp {
                do {
                    let feed = try JSONDecoder().decode(Feed.self, from: data)
                    completion(.found(feed: feed.map { $0.local }, timestamp: time))
                } catch {
                    completion(.empty)
                }
            } else {
                completion(.empty)
            }
        }
    }
}
