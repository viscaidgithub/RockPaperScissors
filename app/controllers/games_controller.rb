class GamesController < ApplicationController
  CHOICES = %w[rock paper scissors].freeze

  def index
    @games = Game.order(created_at: :desc).limit(20) # last 20 rounds
    @score = Game.calculate_score(@games)
  end

  def play
    user_choice = params[:choice]
    unless CHOICES.include?(user_choice)
      redirect_to root_path, alert: 'Invalid choice.' and return
    end

    computer_choice = CHOICES.sample
    result = Game.outcome(user_choice, computer_choice)

    # Save every round to database
    @game = Game.create!(
      user_choice: user_choice,
      computer_choice: computer_choice,
      result: result.to_s
    )

    redirect_to root_path, notice: "You chose #{user_choice}, computer chose #{computer_choice}."
  end

  def reset
    Game.delete_all
    redirect_to root_path, notice: 'History cleared.'
  end

end
