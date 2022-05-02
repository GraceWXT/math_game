require "./game"
require "./question"
require "./player"

player1 = Player.new("Alice")
player2 = Player.new("Bob")

game = Game.new(player1, player2)

game.new_turn
