class Api::V1::ShelvesController < ApplicationController
  # before_action :set_shelf, only: [:destroy]
  before_action :set_user, only: %i[create]

  def index
    user = User.find_by(username: params[:username])
    @shelves = Shelf.includes(:book).where(user_id: user.id).order(id: :desc)
    response_data = @shelves.map do |shelf|
      {
        id: shelf.id,
        userId: shelf.user_id,
        bookName: shelf.Book.name
      }
    end

    render json: response_data
  end

  def create
    existing_shelf = Shelf.find_by(book_id: params[:book_id])

    if existing_shelf
      render json: { error: 'Shelf for this book already exists' }, status: :unprocessable_entity
    else
      @shelf = @user.shelves.build(shelf_params)

      if @shelf.save
        render json: @shelf, status: :created
      else
        render json: @shelf.errors, status: :unprocessable_entity
      end
    end
  end

  # Other actions and private methods
  def destroy
    if @shelf.destroy
      render json: { message: 'Shelf deleted successfully!' }
    else
      render json: { error: 'Failed to delete the shelf' }, status: :unprocessable_entity
    end
  end

  private

  def set_shelf
    @shelf = Shelf.find(params[:id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
    return if @user

    render json: { error: 'User not found' }, status: :not_found
  end

  def shelf_params
    params.require(:shelf).permit(:user_id, :book_id)
  end
end
