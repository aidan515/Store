class MembersController < ApplicationController
  def show
    @member = current_member
  end
end
