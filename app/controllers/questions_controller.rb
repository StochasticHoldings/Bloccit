class QuestionsController < ApplicationController
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @questions = Question.all
  end
end
