class RegisteredApplicationsController < ApplicationController
  def index
  	@applications = RegisteredApplication.where(user: current_user)
  end

  def show
  	@application = RegisteredApplication.find(params[:id])
  	authorize @application
  end

  def new
  	@application = RegisteredApplication.new
  	authorize @application
  end

  def create
  	@application = RegisteredApplication.new(application_params)
  	authorize @application
  	@application.user = current_user
  # #10
    if @application.save
  # #11
      flash[:notice] = "Application was saved."
      redirect_to action: :index
    else
  # #12
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :new
    end
  end	

  def edit
  	@application = RegisteredApplication.find(params[:id])
  	authorize @application
  end

  def update
  	@application = RegisteredApplication.find(params[:id])
  	authorize @application
  	@application.assign_attributes(application_params)
 
    if @application.save
      flash[:notice] = "Application was updated."
      redirect_to @application
    else
      flash.now[:alert] = "Error saving Application. Please try again."
      render :edit
    end
  end
	

  def destroy
  	@application = RegisteredApplication.find(params[:id])
    authorize @application
    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the Application."
      render :show
    end
  end

  private
 
  def application_params
    params.require(:registered_application).permit(:name, :url)
  end

end
