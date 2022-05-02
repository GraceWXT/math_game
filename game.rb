class Game
  attr_accessor :current_player, :turn
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @turn = 1
  end

  def run
    while player1.life != 0 && player2.life != 0
      question = Question.new

      puts "----- TURN #{turn} -----"
      puts "#{current_player.name}: What is #{question.value1} plus #{question.value2}?"

      answer = gets.chomp.to_i

      if question.correct?(answer)
        puts "#{current_player.name}: YES! You are correct."
        puts "#{player1.name}: #{player1.life}/3 vs #{player2.name}: #{player2.life}/3"
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
        puts "#{player1.name}: #{player1.life}/3 vs #{player2.name}: #{player2.life}/3"
      end

      @turn += 1
      current_player == player1 ? @current_player=(player2) : @current_player=(player1)
    end
    winner = [player1, player2].max_by { |player| player.life }
    puts "#{winner.name} wins with a score of #{winner.life}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end
