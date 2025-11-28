class Game < ApplicationRecord

  def self.calculate_score(games)
    {
      user: games.where(result: 'user_win').count,
      computer: games.where(result: 'computer_win').count,
      ties: games.where(result: 'tie').count
    }
  end

  def self.outcome(user, comp)
    return :tie if user == comp

    wins = {
      'rock' => 'scissors',
      'paper' => 'rock',
      'scissors' => 'paper'
    }

    wins[user] == comp ? :user_win : :computer_win
  end
end
