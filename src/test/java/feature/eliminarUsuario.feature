Feature: Eliminar usuario

  Scenario: Eliminar un usuario
    Given url 'https://serverest.dev/usuarios'
    When method GET
    Then status 200
    And def userId = response.usuarios[0]._id
    Given url 'https://serverest.dev/usuarios/' + userId
    When method DELETE
    Then status 200
    And match response contains { 'message': 'Registro excluído com sucesso' }
    Given url 'https://serverest.dev/usuarios/' + 123456
    When method DELETE
    Then status 400
    And match response contains { 'message': 'Não é permitido excluir usuário com carrinho cadastrado' }