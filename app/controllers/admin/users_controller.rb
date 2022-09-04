class Admin::UsersController < AdminController
  include Pagination

  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    pagination = PaginationService.call(
      cursor: User.all,
      current_page:,
      per_page:,
      path: 'admin_users_path'
    )

    @users = pagination[:cursor]
    @options = pagination[:options]
  end

  # GET /users/1/edit
  def edit; end

  # GET /users/1
  def show; end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  rescue => e
    flash[:error] = e.message
    render :edit, status: :unprocessable_entity
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'User admin was successfully destroyed.'
  rescue => e
    flash[:error] = e.message
    redirect_to admin_user_path(@user)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit!
  end
end
