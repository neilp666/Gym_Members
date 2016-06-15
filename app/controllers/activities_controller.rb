class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:edit, :show ,:update ,:destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @activities = Activity.paginate(page: params[:page], per_page: 5)
  end


  def new
    @activity = Activity.new
  end

  def show
   
  end

  def edit
    
  end

  def create
     @activity = Activity.new(activity_params)
     @activity.member = current_member
     if @activity.save
       flash[:success] = "Activity was successfully created"
       redirect_to activity_path(@activity)
     else
       render 'new'
     end
  end

  def update
    if @activity.update(activity_params)
      flash[:success] = "Activity was successfully updated"
      redirect_to activity_path(@activity)
    else
      render 'edit'
    end
  end

  def destroy
    @activity.destroy
    flash[:danger] = "Activity was successfully deleted"
    redirect_to activities_path
  end

  private 

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:location, :bio)
  end

  def require_same_user
    if current_member != @activity.member and !current_member.admin?
      flash[:danger] = "You can only edit or delete yout own activities"
      redirect_to root_path
    end
  end

  

end
