//
//  MusicalRoomUITests.swift
//  MusicalRoomUITests
//
//  Created by Алена Захарова on 27.03.2022.
//

import XCTest

class MusicalRoomUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Scenario 1
    func testShouldCreateReservation() {
//        let app = XCUIApplication()
//        app.launch()
//        
//        let validUserName = "qweqwe"
//        let validUserPassword = "qweqwe"
//        
//        app.buttons["Login"].tap()
//        
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//        
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//        
//        app.staticTexts["Log In"].tap()
//        
//        app.tabBars["Tab Bar"].buttons["Reserve"].tap()
//        app.buttons["Select Room"].tap()
//
//        app/*@START_MENU_TOKEN@*/.tables.staticTexts["Room 1"]/*[[".otherElements[\"drop_down\"].tables",".cells.staticTexts[\"Room 1\"]",".staticTexts[\"Room 1\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        
//        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
//        textField.tap()
//        textField.tap()
//        app.datePickers.pickerWheels["8"].swipeUp()
//        app.toolbars["Toolbar"].buttons["Done"].tap()
//        app.buttons.containing(.staticText, identifier:"Reserve").element.tap()
//        
//        XCTAssertEqual(app.alerts.element.label, "Woohoo. You successfully reserved a room")
    }
    
//    // Scenario 2
//    func testShouldNotCreateReservation() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let validUserName = "qweqwe"
//        let validUserPassword = "qweqwe"
//
//        app.buttons["Login"].tap()
//
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//
//        app.staticTexts["Log In"].tap()
//
//        app.staticTexts["Log In"].tap()
//
//        app.tabBars["Tab Bar"].buttons["Reserve"].tap()
//        app.buttons["Select Room"].tap()
//
//        app/*@START_MENU_TOKEN@*/.tables.staticTexts["Room 1"]/*[[".otherElements[\"drop_down\"].tables",".cells.staticTexts[\"Room 1\"]",".staticTexts[\"Room 1\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//
//        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
//        textField.tap()
//        app.toolbars["Toolbar"].buttons["Done"].tap()
//        app.buttons.containing(.staticText, identifier:"Reserve").element.tap()
//
//        XCTAssertEqual(app.alerts.element.label, "It seems like you've entered incorrect date")
//    }
//
//    // Scenario 3
//    func testShouldDeleteReservation() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let validUserName = "qweqwe"
//        let validUserPassword = "qweqwe"
//
//        app.buttons["Login"].tap()
//
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//
//        app.staticTexts["Log In"].tap()
//
//        let tabBar = app.tabBars["Tab Bar"]
//        let profileButton = tabBar.buttons["Profile"]
//        profileButton.tap()
//
//        let myReservationsButton = app.buttons["My Reservations"]
//        myReservationsButton.tap()
//        let rowCountBefore = app.tables.cells.count
//        app.tables/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
//        app.alerts["Delete reservation?"].scrollViews.otherElements.buttons["Ok"].tap()
//        sleep(5)
//        let rowCountAfter = app.tables.cells.count
//        XCTAssertEqual(rowCountAfter, rowCountBefore-1)
//    }
//
//    // Scenario 4
//    func testShouldChangeStatusLabel() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let validUserName = "admin"
//        let validUserPassword = "password"
//
//        app.buttons["Login"].tap()
//
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//        app.staticTexts["Log In"].tap()
//
//        sleep(2)
//
//        app.tables.buttons["Confirm"].firstMatch.tap()
//
//        let okButton = app.alerts["Confirm reservation?"].scrollViews.otherElements.buttons["Ok"]
//        okButton.tap()
//
//        let table = app.tables.element
//        let tableCellContainer = table.cells.element(boundBy: 0)
//        sleep(2)
//        let cell = tableCellContainer.staticTexts["Confirmed"]
//        XCTAssert(cell.exists)
//    }
//
//    // Scenario 5
//    func testShouldAddRoom() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let validUserName = "admin"
//        let validUserPassword = "password"
//
//        app.buttons["Login"].tap()
//
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//
//        app/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let tabBar = app.tabBars["Tab Bar"]
//        tabBar.buttons["Rooms"].tap()
//
//        let nameTextField = app.textFields["Name"]
//        nameTextField.tap()
//        nameTextField.typeText("New Room")
//
//        let descriptionTextField = app.textFields["Description"]
//        descriptionTextField.tap()
//        descriptionTextField.typeText("Description")
//
//        let priceTextField = app.textFields["Price"]
//        priceTextField.tap()
//        priceTextField.typeText("100")
//        app.buttons["done"].tap()
//
//        app.buttons["Add Room"].tap()
//
//        XCTAssertEqual(app.alerts.element.label, "Room was added successfully")
//    }
//
//    // Scenario 6
//    func testShouldNotAddRoom() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let validUserName = "admin"
//        let validUserPassword = "password"
//
//        app.buttons["Login"].tap()
//
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//
//        app/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let tabBar = app.tabBars["Tab Bar"]
//        tabBar.buttons["Rooms"].tap()
//
//        let nameTextField = app.textFields["Name"]
//        nameTextField.tap()
//        nameTextField.typeText("New Room")
//
//        let descriptionTextField = app.textFields["Description"]
//        descriptionTextField.tap()
//        descriptionTextField.typeText("Description")
//
//        let priceTextField = app.textFields["Price"]
//        priceTextField.tap()
//        app.buttons["done"].tap()
//
//        app.buttons["Add Room"].tap()
//
//        XCTAssertEqual(app.alerts.element.label, "Ooops!")
//    }
//
//    // Scenario 7
//    func testShouldDeleteRoom() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let validUserName = "admin"
//        let validUserPassword = "password"
//
//        app.buttons["Login"].tap()
//
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//
//        app/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        app.tabBars["Tab Bar"].buttons["Rooms"].tap()
//        app.buttons["View Rooms"].tap()
//
//        let rowCountBefore = app.tables.cells.count
//        app.tables/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
//
//        app.alerts["Delete room?"].scrollViews.otherElements.buttons["Ok"].tap()
//
//        sleep(5)
//        let rowCountAfter = app.tables.cells.count
//        XCTAssertEqual(rowCountAfter, rowCountBefore-1)
//    }
//
//    // Scenario 8
//    func testShouldAddInstrument() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let validUserName = "admin"
//        let validUserPassword = "password"
//
//        app.buttons["Login"].tap()
//
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//
//        app/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let tabBar = app.tabBars["Tab Bar"]
//        tabBar.buttons["Instruments"].tap()
//
//        let nameTextField = app.textFields["Name"]
//        nameTextField.tap()
//        nameTextField.typeText("New Instrument")
//
//        let descriptionTextField = app.textFields["Description"]
//        descriptionTextField.tap()
//        descriptionTextField.typeText("Description")
//        app.buttons["done"].tap()
//
//        app.buttons["Add Instrument"].tap()
//
//        XCTAssertEqual(app.alerts.element.label, "Instrument was added successfully")
//    }
//
//    // Scenario 9
//    func testShouldNotAddInstrument() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let validUserName = "admin"
//        let validUserPassword = "password"
//
//        app.buttons["Login"].tap()
//
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//
//        app/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let tabBar = app.tabBars["Tab Bar"]
//        tabBar.buttons["Instruments"].tap()
//
//        let nameTextField = app.textFields["Name"]
//        nameTextField.tap()
//        nameTextField.typeText("New Instrument")
//
//        let descriptionTextField = app.textFields["Description"]
//        descriptionTextField.tap()
//        app.buttons["done"].tap()
//
//        app.buttons["Add Instrument"].tap()
//
//        XCTAssertEqual(app.alerts.element.label, "Ooops!")
//    }
//
//    // Scenario 10
//    func testShouldDeleteInstrument() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let validUserName = "admin"
//        let validUserPassword = "password"
//
//        app.buttons["Login"].tap()
//
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText(validUserName)
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText(validUserPassword)
//        app.buttons["done"].tap()
//
//        app/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        app.tabBars["Tab Bar"].buttons["Instruments"].tap()
//        app.buttons["View Instruments"].tap()
//
//        let rowCountBefore = app.tables.cells.count
//        app.tables/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
//
//        app.alerts["Delete instrument?"].scrollViews.otherElements.buttons["Ok"].tap()
//
//        sleep(5)
//        let rowCountAfter = app.tables.cells.count
//        XCTAssertEqual(rowCountAfter, rowCountBefore-1)
//    }
}
