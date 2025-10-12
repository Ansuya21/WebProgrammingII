Feature: Employee Authentication and Security

  As an employee of the Happy Tails system
  I want to register and login
  So that I can access protected resources

  Background:
    Given the authentication API is available at "http://localhost:8080/SpringMvcHelloWorld"

  Scenario: Successful User Registration
    When I register a new user with the following credentials:
      | username | register.test@happy-tails.com |
      | password | HappyTails2024!              |
    Then the registration response status code should be 201
    And the registration response should indicate success
    And the registration response should contain message "User registered successfully"

  Scenario: Successful User Login
    Given a user exists with username "login.user@happytails.com" and password "LoginPass123!"
    When I login with username "login.user@happytails.com" and password "LoginPass123!"
    Then the login response status code should be 200
    And the login response should contain a JWT token
    And the login response should indicate success

  Scenario: Failed Login with Invalid Credentials
    When I attempt to login with username "invaliduser@happytails.com" and password "wrong password"
    Then the login response status code should be 401
    And the login response should contain message "Invalid username or password"

  Scenario: Unauthorized Access to Protected Endpoint Without Token
    When I attempt to access protected endpoint "/api/employees" without a token
    Then the protected endpoint response status code should be 403
    And the protected endpoint response should indicate access failure

  Scenario: Access Protected Endpoint With Valid Token
    Given a user exists with username "protected.user@happytails.com" and password "ProtectedPass123!"
    And I have a valid JWT token for user "protected.user@happytails.com"
    When I access protected endpoint "/api/employees" with valid token
    Then the protected endpoint response status code should be 200
    And the protected endpoint response should indicate success

  Scenario: Complete Authentication Flow
    When I register a new user with username "flow.test@happytails.com" and password "FlowPass123!"
    Then the registration should be successful
    When I login with username "flow.test@happytails.com" and password "FlowPass123!"
    Then the login should be successful
    And I should receive a JWT token
    When I use the JWT token to access protected endpoint "/api/employees"
    Then I should be able to access the protected resource
