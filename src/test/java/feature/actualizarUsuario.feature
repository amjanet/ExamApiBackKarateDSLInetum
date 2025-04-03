Feature: Actualizar usuario

  Scenario: Modificar datos de un usuario
    Given url 'https://serverest.dev/usuarios'
    When method GET
    Then status 200
    And def userId = response.usuarios[0]._id
    Given url 'https://serverest.dev/usuarios/' + userId
    And request { "nome": "Updated User", "email": "updateduser@example.com", "password": "654321", "administrador": "false" }
    When method PUT
    Then status 200
    And match response contains { 'message': 'Registro alterado com sucesso' }
    Given url 'https://serverest.dev/usuarios/' + 123456
    And request { "nome": "Updated User", "email": "updateduser@example.com", "password": "654321", "administrador": "false" }
    When method PUT
    Then status 400
    And match response contains { 'message': 'Este email já está sendo usado' }
