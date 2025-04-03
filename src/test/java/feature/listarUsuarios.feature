Feature: Listar usuarios

  Scenario: Obtener lista de usuarios
    Given url 'https://serverest.dev/usuarios'
    When method GET
    Then status 200
    And match response contains { 'usuarios': '#array' }