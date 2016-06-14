class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:edit, :show ,:update ,:destroy]

  def index
    @activities = Activity.all
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

  

end
