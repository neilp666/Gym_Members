class MembersController < ApplicationController
 
  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to activities_path
    else
      render 'edit'
    end
  end

  def show
    @member = Member.find(params[:id])
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

  def member_params
      params.require(:member).permit(:username, :email, :password)
  end

  
end
