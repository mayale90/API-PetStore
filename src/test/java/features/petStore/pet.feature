Feature: PetStore endpoint Test

  Background:
    * def pet = 'v2/pet';


  Scenario: Add pet at store
    # Añadir una mascota a la tienda

    * def body = read('classpath:data/request/file_body.json')

    Given url petstore
    And path pet
    And request body
    When method POST
    Then status 200
    And match response.id == body.id
    And match response.name == body.name


  @searchPet
  Scenario: Search for pet ID created before
    #Consultar la mascota ingresada previamente (Búsqueda por ID)
    * def body = read('classpath:data/request/file_body.json')
    Given url petstore
    And path pet, body.id
    When method GET
    Then status 200


  @updatePet
  Scenario: Update pet name and status
    # Actualizar el nombre de la mascota y el estatus de la mascota a “sold”
    * def new_name = 'Dohko Jr'
    * def status_sold = 'sold'
    * def body = read('classpath:data/request/file_body.json')
    * body.name = new_name
    * body.status = status_sold
    Given url petstore
    And path pet
    And request body
    When method PUT
    Then status 200
    And match response.name == new_name


  Scenario: Find pet by Status
    # Consultar la mascota modificada por status sold

    * def search_name = [{name: 'Dohko Jr'}]
    * def new_name = 'Dohko Jr'
    * def status_sold = 'sold'
    * def body = read('classpath:data/request/file_body.json')
    * body.name = new_name
    * body.status = status_sold
    When url petstore
    And path pet, 'findByStatus'
    And param status = 'sold'
    When method GET
    Then status 200
    And match $ contains body
