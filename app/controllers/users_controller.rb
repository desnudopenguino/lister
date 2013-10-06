class UsersController < ApplicationController

  # GET users/:email
  def show

  end

  private 
    # Use callbacks to share common step or constrants between actions.
    def set_user
      @user = User.find(params[:email])
    end 
end
