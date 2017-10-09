/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

import XCTest
import Foundation
import Kitura
import TypeSafeContracts

@testable import TypeSafeKituraClient

struct Employee: Codable {
    let id: String
    let name: String
}

extension Employee: Persistable {
    // Users of this library should only have to make their 
    // models conform to Persistable protocol by adding this extension
    // Note that the Employee structure definition as shown above (in a real
    // world case would be shared between the server and the client)
}

class PersistableExtTests: XCTestCase {

//    static var allTests: [(String, (MainTests) -> () throws -> Void)] {
//        return [
//            ("testCreate", testCreate)
//        ]
//    }

    private let controller = Controller(store: initialStore)
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        Kitura.addHTTPServer(onPort: 8080, with: controller.router)
        Kitura.start()
        
    }
    
    override func tearDown() {
        Kitura.stop()
        super.tearDown()
    }
//
//    func testCreate() {
//
//        let expectation1 = expectation(description: "An employee is created successfully.")
//
//        let emp1 = Employee(id: "5", name: "Kye Maloy")
//        let emp2 = try Employee.create(model: emp1) { (emp: Employee?, error: Error?) -> Void in
//            guard let emp = emp else {
//                XCTFail("Failed to create employee")
//            }
//        }
//
//        XCTAssertEqual(emp1, emp2)
//        expectation1.fulfill()
//        waitForExpectations(timeout: 3.0, handler: nil)
//    }

}
