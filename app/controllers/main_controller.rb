class MainController < ApplicationController
  def index
    @newLists = List.limit(5).order("updated_at ASC").all
  end
end
