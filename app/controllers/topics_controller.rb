class TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :update, :destroy]
  SORTABLE_COLUMNS = %w(created_at id)

  def index
    @topics = Topic.includes([:rubric, :tags]).all

    @topics = @topics.where(rubric_id: params[:rubric_id]) if params[:rubric_id]
    @topics = @topics.where(tags: { id: params[:tag_id] }) if params[:tag_id]
    @topics = @topics.where(id: params[:id]) if params[:id]

    if params[:sort]
      query = Sorter::Main.new(params[:sort], SORTABLE_COLUMNS).call
      @topics = @topics.order(query)
    end

    paginate json: ActiveModelSerializers::SerializableResource.new(
      @topics,
      each_serializer: TopicsSerializer::Main,
      include: [
        :rubric,
        :tags
      ]
    ).as_json
  end

  def show
    render json: ActiveModelSerializers::SerializableResource.new(
      @topic,
      serializer: TopicsSerializer::Main,
      include: [
      ]
    ).as_json if @topic

  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      render json: @topic.as_json(
        include: [
          :rubric,
          :tags
        ]
      ), status: :created
    else
      render json: { success: false, errors: @topic.errors.as_json }, status: :unprocessable_entity
    end
  end

  def update
    if @topic.update(topic_params)
      render json: @topic.as_json(
        include: [
          :rubric,
          :tags
        ]
      ), status: :accepted
    else
      render json: { success: false, errors: @topic.errors.as_json }, status: :unprocessable_entity
    end
  end

  def destroy
    if @topic.destroy
      render json: { success: true }, status: :no_content
    else
      render json: { success: false, errors: @topic.errors.as_json }, status: :unprocessable_entity
    end
  end

  private

  def find_topic
    @topic = Topic.find_by(urn: "/#{params[:urn]}")
  end

  def topic_params
    params.require(:topic).permit(
      :heading, :announcement, :cover, :body, :urn, :rubric_id,
      tags_attributes: [
        :id, :title, :_destroy
      ],
      tag_topics_attributes: [
        :tag_id
      ]
    )
  end
end
