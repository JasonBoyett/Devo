class CommentImpressionsController < ApplicationController
  before_action :set_comment_impression, only: %i[ show update destroy ]

  # GET /comment_impressions
  def index
    @comment_impressions = CommentImpression.all

    render json: @comment_impressions
  end

  # GET /comment_impressions/1
  def show
    render json: @comment_impression
  end

  # POST /comment_impressions
  def create
    @comment_impression = CommentImpression.new(comment_impression_params)

    if @comment_impression.save
      render json: @comment_impression, status: :created, location: @comment_impression
    else
      render json: @comment_impression.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comment_impressions/1
  def update
    if @comment_impression.update(comment_impression_params)
      render json: @comment_impression
    else
      render json: @comment_impression.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comment_impressions/1
  def destroy
    @comment_impression.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_impression
      @comment_impression = CommentImpression.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_impression_params
      params.require(:comment_impression).permit(:comment_id, :user_id, :emoji)
    end
end
