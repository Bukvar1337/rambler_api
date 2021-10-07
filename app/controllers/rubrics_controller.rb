class RubricsController < ApplicationController
  before_action :find_rubric, only: [:show, :update, :destroy]

  def index
    @rubrics = Rubric.all

    @rubrics = @rubrics.where('lower(rubrics.title) LIKE ?', "%#{params[:search_string].downcase}%") if params[:search_string]

    paginate json: ActiveModelSerializers::SerializableResource.new(
      @rubrics,
      each_serializer: RubricsSerializer::Main,
      include: [
      ]
    ).as_json
  end

  def show
    render json: ActiveModelSerializers::SerializableResource.new(
      @tag,
      serializer: RubricsSerializer::Main,
      include: [
      ]
    ).as_json
  end

  def create
    @rubric = Rubric.new(rubric_params)
    if @rubric.save
      render json: @rubric.as_json, status: :created
    else
      render json: { success: false, errors: @rubric.errors.as_json }, status: :unprocessable_entity
    end
  end

  def update
    if @rubric.update(rubric_params)
      render json: @rubric.as_json, status: :accepted
    else
      render json: { success: false, errors: @rubric.errors.as_json }, status: :unprocessable_entity
    end
  end

  def destroy
    if @rubric.destroy
      render json: { success: true }, status: :no_content
    else
      render json: { success: false, errors: @rubric.errors.as_json }, status: :unprocessable_entity
    end
  end

  private

  def find_rubric
    @rubric = Rubric.find(params[:id])
  end

  def rubric_params
    params.require(:rubric).permit(:title)
  end
end

