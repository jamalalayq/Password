import XCTest
@testable import Password

final class PasswordTests: XCTestCase {
    
    func testValidation() {
        var password: Password = "qqqqqq"
        let confirmed = "qqqqqq"
        password.confirmation = confirmed
        password.length = 6
        XCTAssertTrue(password.isValid)        
    }
    
    /*static var allTests = [
        ("testExample", testExample),
    ]*/
}
