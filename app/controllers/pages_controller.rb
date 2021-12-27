class PagesController < ApplicationController
  def about
    @heading = 'Страница про нас!'
    @text = 'какой-то текст'
    @league = "140"
  end
end
