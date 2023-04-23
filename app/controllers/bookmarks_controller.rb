class BookmarksController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    current_user.bookmark(@answer)
    #render turbo_stream: turbo_stream.replace("bookmark-button-#{@answer.id}")
    render turbo_stream: turbo_stream.replace("bookmark-button-#{@answer.id}", partial: 'bookmark/unbookmark', locals: { answer: @answer })
  end
  
  def destroy
    @answer = current_user.bookmarks.find(params[:id]).answer
    current_user.unbookmark(@answer)
    #render turbo_stream: turbo_stream.replace("bookmark-button-#{@answer.id}")
    render turbo_stream: turbo_stream.replace("bookmark-button-#{@answer.id}", partial: 'bookmark/bookmark', locals: { answer: @answer })
  end
 
end
