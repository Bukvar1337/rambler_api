class TagsController < ApplicationController
  before_action :find_tag, only: [:show, :update, :destroy]

  def index
    @tags = Tag.all

    @tags = @tags.where('lower(tags.title) LIKE ?', "%#{params[:search_string].downcase}%") if params[:search_string]

    paginate json: ActiveModelSerializers::SerializableResource.new(
      @tags,
      each_serializer: TagsSerializer::Main,
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
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag.as_json, status: :created
    else
      render json: { success: false, errors: @tag.errors.as_json }, status: :unprocessable_entity
    end
  end

  def update
    if @tag.update(tag_params)
      render json: @tag.as_json, status: :accepted
    else
      render json: { success: false, errors: @tag.errors.as_json }, status: :unprocessable_entity
    end
  end

  def destroy
    if @tag.destroy
      render json: { success: true }, status: :no_content
    else
      render json: { success: false, errors: @tag.errors.as_json }, status: :unprocessable_entity
    end
  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:title)
  end
end
