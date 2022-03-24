class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.where(user_id: current_user.id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      flash[:success] = 'group created succesfully'
      redirect_to user_groups_path(current_user)
    else
      render 'new'
    end
  end

  def show; end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
