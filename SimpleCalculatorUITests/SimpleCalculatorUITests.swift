import XCTest

final class SimpleCalculatorUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPositiveNumberZeroDivision() throws {
        let app = XCUIApplication()
        app.launch()
        let randomNum=String(Int.random(in:1...9))
        app.buttons[randomNum].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        let attachment=XCTAttachment(screenshot: app.screenshot())
        attachment.name="Positive Number Zero Division"
        attachment.lifetime = .keepAlways
        add(attachment)
        XCTAssert(app.staticTexts["inf"].exists)
    }

    func testNegativeNumberZeroDivision() throws {
        let app = XCUIApplication()
        app.launch()
        let randomNum=String(Int.random(in:1...9))
        app.buttons["-"].tap()
        app.buttons[randomNum].tap()
        app.buttons["="].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()

        let attachment=XCTAttachment(screenshot: app.screenshot())
        attachment.name="Positive Number Zero Division"
        attachment.lifetime = .keepAlways
        add(attachment)
        XCTAssert(app.staticTexts["-inf"].exists)
    }
    
    func testZeroByZeroDivision() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        let attachment=XCTAttachment(screenshot: app.screenshot())
        attachment.name="Positive Number Zero Division"
        attachment.lifetime = .keepAlways
        add(attachment)
        XCTAssert(app.staticTexts["nan"].exists)
    }
    
    func testRandomNumberExisting() throws {
        let app = XCUIApplication()
        app.launch()
        let randomLength=Int.random(in:1...12)
        var randomNum=""
        for _ in 0..<randomLength{
            let randomNumButton=String(Int.random(in:1...9))
            app.buttons[randomNumButton].tap()
            randomNum+=randomNumButton
        }
        print(randomNum)
        let attachment=XCTAttachment(screenshot: app.screenshot())
        attachment.name="Positive Number Zero Division"
        attachment.lifetime = .keepAlways
        add(attachment)
        XCTAssert(app.staticTexts[randomNum].exists)
    }
    
    func testShortSquare() throws {
        let app = XCUIApplication()
        app.launch()
        let randomLength=Int.random(in:1...6)
        var randomNumString=""
        for _ in 0..<randomLength{
            let randomNumButton=String(Int.random(in:1...9))
            app.buttons[randomNumButton].tap()
            randomNumString+=randomNumButton
        }
        //randomNumString+=".0"
        if let randomNum=Double(randomNumString){
            print(randomNum)
            app.buttons["*"].tap()
            app.buttons["="].tap()
            let squaredRandomNumString=String(randomNum*randomNum)
            
            let attachment=XCTAttachment(screenshot: app.screenshot())
            attachment.name="Positive Number Zero Division"
            attachment.lifetime = .keepAlways
            add(attachment)
            XCTAssert(app.staticTexts[squaredRandomNumString].exists)
        }
    }
}
