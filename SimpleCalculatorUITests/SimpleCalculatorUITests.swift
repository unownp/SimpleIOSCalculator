import XCTest

final class SimpleCalculatorUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testPositiveNumberZeroDivision() throws {
        let app = XCUIApplication()
        app.launch()
        
        let randomNum=String(Int.random(in:1...9))
        XCTContext.runActivity(named: "Операции") { _ in
            app.buttons[randomNum].tap()
            app.buttons["/"].tap()
            app.buttons["0"].tap()
            app.buttons["="].tap()
        }
        
        XCTContext.runActivity(named: "Скриншот") { _ in
            let attachment=XCTAttachment(screenshot: app.screenshot())
            attachment.name="Positive Number Zero Division"
            attachment.lifetime = .keepAlways
            add(attachment)
        }
        
        XCTAssert(app.staticTexts["inf"].exists)
    }

    func testNegativeNumberZeroDivision() throws {
        let app = XCUIApplication()
        app.launch()
        let randomNum=String(Int.random(in:1...9))
    
        XCTContext.runActivity(named: "Операции)") { _ in
            app.buttons["-"].tap()
            app.buttons[randomNum].tap()
            app.buttons["="].tap()
            app.buttons["/"].tap()
            app.buttons["0"].tap()
            app.buttons["="].tap()
        }
        
        XCTContext.runActivity(named: "Скриншот") { _ in
            let attachment=XCTAttachment(screenshot: app.screenshot())
            attachment.name="Positive Number Zero Division"
            attachment.lifetime = .keepAlways
            add(attachment)
        }
        
        XCTAssert(app.staticTexts["-inf"].exists)
    }
    
    func testZeroByZeroDivision() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTContext.runActivity(named: "Операции") { _ in
            app.buttons["/"].tap()
            app.buttons["0"].tap()
            app.buttons["="].tap()
        }
        
        XCTContext.runActivity(named: "Скриншот") { _ in
            let attachment=XCTAttachment(screenshot: app.screenshot())
            attachment.name="Positive Number Zero Division"
            attachment.lifetime = .keepAlways
            add(attachment)
        }
        
        XCTAssert(app.staticTexts["nan"].exists)
    }
    
    func testRandomNumberExisting() throws {
        let app = XCUIApplication()
        app.launch()
        
        let randomLength=Int.random(in:1...12)
        var randomNum=""
        XCTContext.runActivity(named: "Операции") { _ in
            for _ in 0..<randomLength{
                let randomNumButton=String(Int.random(in:1...9))
                app.buttons[randomNumButton].tap()
                randomNum+=randomNumButton
            }
        }
        
        XCTContext.runActivity(named: "Скриншот") { _ in
            let attachment=XCTAttachment(screenshot: app.screenshot())
            attachment.name="Positive Number Zero Division"
            attachment.lifetime = .keepAlways
            add(attachment)
        }
        
        XCTAssert(app.staticTexts[randomNum].exists)
    }
    
    func testShortSquare() throws {
        let app = XCUIApplication()
        app.launch()
        //print(app.debugDescription)
        
        let randomLength=Int.random(in:1...6)
        var randomNumString=""
        XCTContext.runActivity(named: "Операции") { _ in
            for _ in 0..<randomLength{
                let randomNumButton=String(Int.random(in:1...9))
                app.buttons[randomNumButton].tap()
                randomNumString+=randomNumButton
            }
        }

            if let randomNum=Double(randomNumString){
                print(randomNum)
                XCTContext.runActivity(named: "Операции") { _ in
                    app.buttons["*"].tap()
                    app.buttons["="].tap()
                }
                let squaredRandomNumString=String(randomNum*randomNum)
                
                XCTContext.runActivity(named: "Скриншот") { _ in
                    let attachment=XCTAttachment(screenshot: app.screenshot())
                    attachment.name="Positive Number Zero Division"
                    attachment.lifetime = .keepAlways
                    add(attachment)
                }
                XCTAssert(app.staticTexts[squaredRandomNumString].exists)
            } else {
                XCTContext.runActivity(named: "Скриншот") { _ in
                    let attachment=XCTAttachment(screenshot: app.screenshot())
                    attachment.name="Positive Number Zero Division"
                    attachment.lifetime = .keepAlways
                    add(attachment)
                }
            }
    }
}
