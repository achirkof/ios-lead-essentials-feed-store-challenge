# The `FeedStore` challenge - iOSLeadEssentials.com

[![Build Status](https://travis-ci.com/essentialdevelopercom/ios-lead-essentials-feed-store-challenge.svg?branch=master)](https://travis-ci.com/essentialdevelopercom/ios-lead-essentials-feed-store-challenge)

You are called to build your own persistence infrastructure implementation by creating a new component that conforms to the `<FeedStore>` protocol.

Your custom persistence infrastructure implementation can be backed by any persistence stack you wish, i.e. CoreData, Realm, in memory, etc, as shown in the diagram below.

![Infrastructure Dependency Diagram](infrastructure_dependency_diagram.png)

We advise you to invest some time and effort to produce a clean and well-presented solution to demonstrate your knowledge as it can be **an ideal addition to your project portfolio**!

## Instructions

1. Fork the latest version of [the challenge repo](https://github.com/essentialdevelopercom/ios-lead-essentials-feed-store-challenge).
2. Implement **at least one** `<FeedStore>` implementation of your choice.
3. Use the `Tests/FeedStoreChallengeTests.swift` to validate your implementation. We recommend you to implement one test at a time. Follow the process: Make the test pass, commit, and move to the next one. In the end, all tests **must pass**. 
4. If your implementation has failable operations (e.g., it might fail to load data from disk), uncomment and implement the failable test extensions at the bottom of the `Tests/FeedStoreChallengeTests.swift` test file. 
5. When you’re done implementing your `<FeedStore>` solution, create a Pull Request from your branch to the [main challenge repo](https://github.com/essentialdevelopercom/ios-lead-essentials-feed-store-challenge). Use the name of your implementation as the title for the Pull Request, for example, *“CoreData implementation”*.

## Guidelines

1. Aim to commit your changes every time you add/alter the behavior of your system or refactor your code.
2. The system should always be in a green state, meaning that in each commit all tests should be passing.
3. The project should build without warnings.
4. The code should be carefully organized and easy to read (e.g. indentation must be consistent, etc.).
5. Aim to create short methods respecting the Single Responsibility Principle.
6. Aim to declare dependencies explicitly, instead of implicitly, leveraging dependency injection wherever necessary.
7. Aim **not** to block the main thread. Strive to run operations in a background queue.
8. Aim for descriptive commit messages that clarify the intent of your contribution which will help other developers understand your train of thought and purpose of changes.
9. Make careful and proper use of access control, marking as `private` any implementation details that aren’t referenced from other external components.
10. Aim to write self-documenting code by providing context and detail when naming your components, avoiding explanations in comments.

Finally, add to this README file:

### Comments and remarks you think other developers will find useful.

...

### The Dependency Diagram demonstrating the architecture of your solution. 

...
