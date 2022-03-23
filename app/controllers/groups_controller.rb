class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index 
    @groups = Group.all
  end

  def new 
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:success] = 'group created succesfully'
      redirect_to user_groups_path

    else
      render 'new'
    end
  end


  def show

  end

  def group_params
    params.require(:group).permit(:name)
  end

end
