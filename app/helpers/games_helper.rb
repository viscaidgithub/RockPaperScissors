module GamesHelper
  def rps_icon(number)
    case number
    when "rock"
      content_tag(:b, "✊ Rock")

    when "paper"
      content_tag(:b, "✋ Paper")

    when "scissors"
      content_tag(:b, "✌️ Scissors")

    else
      content_tag(:b, "", class: "fa-regular fa-question-circle text-gray-500")
    end
  end
end
