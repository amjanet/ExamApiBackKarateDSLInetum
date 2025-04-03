
Feature: Registrar usuario

  Scenario: Crear un usuario válido
    Given url 'https://serverest.dev/usuarios'
    And request { "nome": "Test User", "email": "testuser5@example.com", "password": "123456", "administrador": "true" }
    When method POST
    Then status 201
    And match response contains { 'message': 'Cadastro realizado com sucesso' }
    Given url 'https://serverest.dev/usuarios'
    And request { "nome": "Test User", "email": "testuser@example.com", "password": "123456", "administrador": "true" }
    When method POST
    Then status 400
    And match response contains { 'message': 'Este email já está sendo usado' }