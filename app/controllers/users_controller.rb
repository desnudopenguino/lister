class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]

  # GET users/:email
  def show
    @lists = @user.lists
    @newList = List.new
  end

  private 
    # Use callbacks to share common step or constrants between actions.
    def set_user
      @user = User.find(params[:id])
    end 
end
