class ThemesController < ApplicationController
  def show
    @themes = @event.themes
  end
end
