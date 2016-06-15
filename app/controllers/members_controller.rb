class MembersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

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
      session[:member_id] = @member.id
      flash[:success] = "Welecom to Gym Buddies #{@member.username}"
      redirect_to member_path(@member)
    else
      render 'new'
    end
  end

    def destroy
      @member = Member.find(params[:id])
      @member.destroy
      flash[:danger] = "User & all activities created by user have been deleted"
      redirect_to members_path
    end


  private

  def set_user
      @member = Member.find(params[:id])
  end

  def member_params
      params.require(:member).permit(:username, :email, :password)
  end

  def require_same_user
    if current_member != @member and !current_member.admin?
      flash[:danger] = "You can only edit your won account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_member.admin?
      flash[:danger] = "only admin users can perform that action"
      redirect_to root_path
    end
  end
end
