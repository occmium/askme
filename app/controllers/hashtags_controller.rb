class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by(name: params[:name])

    if @hashtag
      @questions = @hashtag.questions.order(created_at: :desc)
    else
      redirect_to root_url, notice: 'хештегов ен найдено'
    end
  end
end
