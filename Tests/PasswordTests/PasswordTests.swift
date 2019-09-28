import XCTest
@testable import Password

final class PasswordTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Password().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
