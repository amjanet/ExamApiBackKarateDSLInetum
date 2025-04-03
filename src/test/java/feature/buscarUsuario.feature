Feature: Buscar usuario por ID

  Scenario: Obtener usuario por ID
    Given url 'https://serverest.dev/usuarios'
    When method GET
    Then status 200
    And def userId = response.usuarios[0]._id
    Given url 'https://serverest.dev/usuarios/' + userId
    When method GET
    Then status 200
    And match response contains { '_id': '#string' }
    Given url 'https://serverest.dev/usuarios/' + 12345
    When method GET
    Then status 400
    And match response contains { 'message': 'Usuário não encontrado' }