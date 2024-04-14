class ImpressionsController < ApplicationController
  before_action :set_impression, only: %i[show update destroy]

  # GET /impressions
  def index
    @impressions = Impression.all

    render json: @impressions
  end

  # GET /impressions/1
  def show
    render json: @impression
  end

  # POST /impressions
  def create
    @impression = Impression.new(impression_params)

    if @impression.save
      render json: @impression, status: :created, location: @impression
    else
      render json: @impression.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /impressions/1
  def update
    if @impression.update(impression_params)
      render json: @impression
    else
      render json: @impression.errors, status: :unprocessable_entity
    end
  end

  # DELETE /impressions/1
  def destroy
    @impression.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_impression
    @impression = Impression.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def impression_params
    params.require(:impression).permit(:devotional_id, :emoji)
  end
end
