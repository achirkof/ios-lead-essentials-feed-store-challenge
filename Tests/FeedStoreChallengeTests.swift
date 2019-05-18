//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import XCTest
import FeedStoreChallenge

class FeedStoreChallengeTests: XCTestCase, FeedStoreSpecs {
	
//
//   We recommend you to implement one test at a time.
//   Uncomment the test implementations one by one.
// 	 Follow the process: Make the test pass, commit, and move to the next one.
//

	func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = makeSUT()

        assertThatRetrieveDeliversEmptyOnEmptyCache(on: sut)
	}

	func test_retrieve_hasNoSideEffectsOnEmptyCache() {
        let sut = makeSUT()

        assertThatRetrieveHasNoSideEffectsOnEmptyCache(on: sut)
	}

	func test_retrieve_deliversFoundValuesOnNonEmptyCache() {
        let sut = makeSUT()

        assertThatRetrieveDeliversFoundValuesOnNonEmptyCache(on: sut)
	}

	func test_retrieve_hasNoSideEffectsOnNonEmptyCache() {
        let sut = makeSUT()

        assertThatRetrieveHasNoSideEffectsOnNonEmptyCache(on: sut)
	}

	func test_insert_deliversNoErrorOnEmptyCache() {
        let sut = makeSUT()

        assertThatInsertDeliversNoErrorOnEmptyCache(on: sut)
	}

	func test_insert_deliversNoErrorOnNonEmptyCache() {
        let sut = makeSUT()

        assertThatInsertDeliversNoErrorOnNonEmptyCache(on: sut)
	}

	func test_insert_overridesPreviouslyInsertedCacheValues() {
        let sut = makeSUT()

        assertThatInsertOverridesPreviouslyInsertedCacheValues(on: sut)
	}

	func test_delete_deliversNoErrorOnEmptyCache() {
        let sut = makeSUT()

        assertThatDeleteDeliversNoErrorOnEmptyCache(on: sut)
	}

    func test_delete_hasNoSideEffectsOnEmptyCache() {
        let sut = makeSUT()

        assertThatDeleteHasNoSideEffectsOnEmptyCache(on: sut)
    }

	func test_delete_deliversNoErrorOnNonEmptyCache() {
        let sut = makeSUT()

        assertThatDeleteDeliversNoErrorOnNonEmptyCache(on: sut)
	}

    func test_delete_emptiesPreviouslyInsertedCache() {
        let sut = makeSUT()

        assertThatDeleteEmptiesPreviouslyInsertedCache(on: sut)
    }

	func test_storeSideEffects_runSerially() {
        let sut = makeSUT()

        assertThatSideEffectsRunSerially(on: sut)
	}
	
	// - MARK: Helpers
	
	private func makeSUT() -> FeedStore {
		let sut = CodableFeedStore()
        return sut
	}
	
}

//
// Uncomment the following tests if your implementation has failable operations.
// Otherwise, delete the commented out code!
//

//extension FeedStoreChallengeTests: FailableRetrieveFeedStoreSpecs {
//
//	func test_retrieve_deliversFailureOnRetrievalError() {
////		let sut = makeSUT()
////
////		assertThatRetrieveDeliversFailureOnRetrievalError(on: sut)
//	}
//
//	func test_retrieve_hasNoSideEffectsOnFailure() {
////		let sut = makeSUT()
////
////		assertThatRetrieveHasNoSideEffectsOnFailure(on: sut)
//	}
//
//}

//extension FeedStoreChallengeTests: FailableInsertFeedStoreSpecs {
//
//	func test_insert_deliversErrorOnInsertionError() {
////		let sut = makeSUT()
////
////		assertThatInsertDeliversErrorOnInsertionError(on: sut)
//	}
//
//	func test_insert_hasNoSideEffectsOnInsertionError() {
////		let sut = makeSUT()
////
////		assertThatInsertHasNoSideEffectsOnInsertionError(on: sut)
//	}
//
//}

//extension FeedStoreChallengeTests: FailableDeleteFeedStoreSpecs {
//
//	func test_delete_deliversErrorOnDeletionError() {
////		let sut = makeSUT()
////
////		assertThatDeleteDeliversErrorOnDeletionError(on: sut)
//	}
//
//	func test_delete_hasNoSideEffectsOnDeletionError() {
////		let sut = makeSUT()
////
////		assertThatDeleteHasNoSideEffectsOnDeletionError(on: sut)
//	}
//
//}
