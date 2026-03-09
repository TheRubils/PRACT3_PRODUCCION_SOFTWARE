Feature: Gestión de gastos
  Como estudiante
  Quiero registrar mis gastos
  Para controlar cuánto dinero gasto

  Scenario: Crear un gasto y comprobar cual es el total que llevo gastado
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    Then el total de dinero gastado debe ser 5 euros

  Scenario: Eliminar un gasto y comprobar cual es el total que llevo gastado
    Given un gestor con un gasto de 5 euros
    When elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear y eliminar un gasto y comprobar que no he gastado dinero
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear dos gastos diferentes y comprobar que el total que llevo gastado es la suma de ambos
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And añado un gasto de 10 euros llamado Comida
    Then el total de dinero gastado debe ser 15 euros

  Scenario: Crear tres gastos diferentes que sumen 30 euros hace que el total sean 30 euros
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Pan
    And añado un gasto de 10 euros llamado Leche
    And añado un gasto de 15 euros llamado Embutido
    Then el total de dinero gastado debe ser 30 euros


  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Movil
    And añado un gasto de 30 euros llamado Ordenador
    And añado un gasto de 30 euros llamado Television
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Movil
    And añado un gasto de 30 euros llamado Ordenador
    And añado un gasto de 30 euros llamado Television
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear dos gastos de 5 y 10 euros, elimino el ultimo y cambio el unico gasto a 15 euros comprobandolo
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Pelota
    And añado un gasto de 15 euros llamado Bate
    And actualizo el gasto a 10 euros con id 2
    Then el total de dinero gastado debe ser 15 euros

  Scenario: Crear dos gastos de 15 y 20 euros, asignar el nombre del gasto con id 1 del ultimo y borrar el ultimo comprobandolo
    Given un gestor de gastos vacío
    When añado un gasto de 15 euros llamado Cubiertos
    And añado un gasto de 20 euros llamado Tarta
    And actualizo el gasto con id 1 con el titulo Tarta
    And elimino el gasto con id 2
    Then debe haber 1 gastos registrados
    And el gasto con id 1 debe llamarse Tarta

  Scenario: Crear tres gastos de 5, 10 y 15 euros, eliminar el ultimo y cambiar los gastos a 10 euros con valor total a 20 euros
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Manzana
    And añado un gasto de 10 euros llamado Pera
    And añado un gasto de 15 euros llamado Melon
    And elimino el gasto con id 3
    And actualizo el gasto a 10 euros con id 1
    And actualizo el gasto a 10 euros con id 2
    Then el total de dinero gastado debe ser 20 euros