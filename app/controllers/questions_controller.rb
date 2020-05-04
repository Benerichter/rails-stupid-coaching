class QuestionsController < ApplicationController
  def ask
  end

  def answer
    @question = params[:question]
    return @answer = coach_answer_enhanced(@question) if @question.present?

    @answer = "Sorry i didn't understood you. Please repeat"
  end

  def coach_answer(your_message)
    if your_message.downcase == 'i am going to work right now!'
      'You better do :)'
    elsif your_message.end_with?('?')
      'Silly question, get dressed and go to work!'
    else
      "I don't care, get dressed and go to work!"
    end
  end

  def coach_answer_enhanced(your_message)
    answer = coach_answer(your_message)
    if answer != 'You better do :)'
      if your_message.upcase == your_message
        "I can feel your motivation! #{answer}"
      else
        answer
      end
    else
      'You better do :)'
    end
  end
end
