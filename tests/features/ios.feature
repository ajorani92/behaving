Feature: Mobile

    Background:
        Given the iOS app at "ios/build/rntest/Build/Products/Debug-iphonesimulator/rntest.app"
        Given iOS as the default browser

    @mobile
    Scenario: Element visibility
        Given a browser
        When I press "Visibility"
        Then I should see "Visibility mobile tests" within 2 seconds
        And I should not see "Inexistent text"
        And I should see an element with accessibility id "TouchableOpacity"

    @mobile
    Scenario: Pressing buttons and opacities
        Given a browser
        When I press "Touches"
        Then I should see "Touch mobile tests" within 2 seconds
        And I press "Normal button"
        Then I should see "Normal button pressed"
        When I press "TouchableOpacity"
        Then I should see "Touchable opacity pressed"
        When I press the element with iOS class chain "**/XCUIElementTypeButton[`name ENDSWITH "button"`]"
        Then I should see "Normal button pressed"
        When I tap at 188 354
        Then I should see "Tap at 50.5, 50.5"
        When I toggle "switch"
        Then I should see "Switch pressed"

    @mobile
    Scenario: Text inputs
        Given a browser
        When I press "Input"
        Then I should see "Input mobile tests" within 2 seconds
        When I fill in "Text Input" with "Testing 123..."
        Then I should see "You typed: Testing 123..."
        When I clear field "Text Input"
        Then I should not see "Testing 123..."
        When I fill in "Text Input" with "Testing 456..."
        Then I should see "You typed: Testing 456..."
        When I clear field "Prefilled Input"
        When I fill in "Prefilled Input" with "Testing prefilled..."
        Then I should see "You typed: Testing prefilled..."

    @mobile
    Scenario: Scroll
        Given a browser
        When I press "Scroll"
        Then I should see an element with accessibility id "Mary"
        And I should not see an element with accessibility id "Olivia"
        When I scroll the element with accessibility id "Mary" by 0 -500
        Then I should see an element with accessibility id "Olivia"

    @mobile
    Scenario: TouchId/FaceId
        Given a browser
        When I toggle the TouchId enrollment
        And I press "Auth"
        Then I should see "TouchId/FaceId mobile tests" within 2 seconds
        When I press "Request TouchId"
        Then I should see "to test TouchId"
        When I match the TouchId fingerprint
        Then I should see "TouchId success"
        When I press "Request TouchId"
        Then I should see "to test TouchId"
        When I mismatch the TouchId fingerprint
        Then I should see "to test TouchId"
        When I press "Cancel"
        Then I should see "TouchId failure"
