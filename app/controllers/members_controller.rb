class MembersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @members = Member.paginate(page: params[:page], per_page: 3)
  end
 
  def new
    @member = Member.new
  end

  def edit
  end

  def update
    if @member.update(member_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to activities_path
    else
      render 'edit'
    end
  end

  def show
    @member_activities = @member.activities.paginate(page: params[:page], per_page: 5)
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success] = "Welecom to Gym Buddies #{@member.username}"
      redirect_to activities_path
    else
      render 'new'
    end
  end

  private

  def set_user
      @member = Member.find(params[:id])
  end

  def member_params
      params.require(:member).permit(:username, :email, :password)
  end

  def require_same_user
    if current_member != @member
      flash[:danger] = "You can only edit your won account"
      redirect_to root_path
    end
  end
end
