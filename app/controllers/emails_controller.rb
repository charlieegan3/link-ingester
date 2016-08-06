class EmailsController < ApplicationController
  protect_from_forgery except: :create

  def index
    @emails = Email.all.order(created_at: :desc)
  end

  def show
    @email = Email.find(params[:id])
  end

  def create
    render json: Email.create(email_params)
  end

  def destroy
    Email.find(params[:id]).destroy
    redirect_to emails_path
  end

  private

  def email_params
    params.require(:email).permit(:from_name, :from_email, :subject, :html)
  end
end
