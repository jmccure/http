Feature: Fruit list
  In order to make a great smoothie
  I need some fruit.

Scenario: List fruit
  Given the system knows about the following fruit:
    |  name       | colour |
    |  banana     | yellow |
    |  strawberry | red    |
  When the client requests GET /fruits
  Then the response should be JSON:
  """
  [
    {"name": "banana", "colour": "yellow"},
    {"name": "strawberry", "colour": "red"}
  ]
  """


  Scenario: Add fruit
    Given the system knows about the following fruit:
      |  name       | colour |
      |  banana     | yellow |
      |  strawberry | red    |
    When the client adds fruit via POST /add_fruit:
      |  name       | colour |
      |  cumquat    | black  |
      |  squash     | white  |
    Then the response JSON from GET /fruits:
    """
  [
    {"name": "banana", "colour": "yellow"},
    {"name": "strawberry", "colour": "red"},
    {"name": "cumquat", "colour": "black"},
    {"name": "squash", "colour": "white"}
  ]
  """