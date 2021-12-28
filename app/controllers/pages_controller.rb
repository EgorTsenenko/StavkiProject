class PagesController < ApplicationController
  def about
    @heading = 'Страница про нас!'
    @text = 'На этом сайте вы можете составлять собственные прогнозы на спорт'
    @league = "140"
  end
end
