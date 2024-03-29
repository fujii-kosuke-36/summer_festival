class BookmarksController < ApplicationController

  def index
    @answers = current_user.bookmarked_answers
  end

  def create
    @answer = Answer.find(params[:answer_id])
    current_user.bookmark(@answer)
    render turbo_stream: turbo_stream.replace("bookmark-button-#{@answer.id}", partial: 'bookmarks/unbookmark', locals: { answer: @answer })
  end

  def destroy
    @answer = current_user.bookmarks.find(params[:id]).answer
    current_user.unbookmark(@answer)
    render turbo_stream: turbo_stream.replace("bookmark-button-#{@answer.id}", partial: 'bookmarks/bookmark', locals: { answer: @answer })
  end
end
