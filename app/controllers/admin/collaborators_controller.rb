class Admin::CollaboratorsController < AdminController
  include Pagination

  before_action :set_collaborator, only: %i[show edit update destroy]

  # GET /collaborators
  def index
    pagination = PaginationService.call(
      cursor: Collaborator.includes(:team, :user),
      current_page:,
      per_page:,
      path: 'admin_collaborators_path'
    )

    @collaborators = pagination[:cursor]
    @options = pagination[:options]
  end

  # GET /collaborators/new
  def new
    @collaborator = Collaborator.new(id: nil)
  end

  # GET /collaborators/1/edit
  def edit; end

  # POST /collaborators
  def create
    @collaborator = Collaborator.new(collaborator_params)

    if @collaborator.save
      redirect_to admin_collaborator_path(@collaborator), notice: 'Collaborator was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  rescue => e
    flash[:error] = e.message
    render :new, status: :unprocessable_entity
  end

  # GET /collaborators/1
  def show; end

  # PATCH/PUT /collaborators/1
  def update
    if @collaborator.update(collaborator_params)
      redirect_to admin_collaborator_path(@collaborator), notice: 'Collaborator was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  rescue => e
    flash[:error] = e.message
    render :edit, status: :unprocessable_entity
  end

  # DELETE /collaborators/1
  def destroy
    @collaborator.destroy
    redirect_to admin_collaborators_path, notice: 'Collaborator admin was successfully destroyed.'
  rescue => e
    flash[:error] = e.message
    redirect_to admin_collaborator_path(@collaborator)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collaborator
    @collaborator = Collaborator.includes(:team, :user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def collaborator_params
    params.require(:collaborator).permit!
  end
end
