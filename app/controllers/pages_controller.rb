class PagesController < ApplicationController
  def about
    @heading = 'Страница про нас!'
    @text = 'какой-то текст'
  end
end
