class DevotionalsController < ApplicationController
  before_action :set_devotional, only: %i[show update destroy]
  before_action :authorized

  # GET /devotionals
  def index
    @devotionals = Devotional.where(user: @user.id).all

    render json: @devotionals
  end

  # GET /devotionals/1
  def show
    @devotional = Devotional.includes(:comments, :impressions).find(params[:id])

    render json: @devotional, include: {
      comments: { include: :comment_impressions },
      impressions: {}
    }
  end

  # GET /all_devotionals
  def show_all
    @deviotionals = Devotional.where(is_public: true).all

    render json: @devotionals
  end

  # POST /devotionals
  def create
    scriptures = devotional_params[:scriptures].map(&:downcase)
    devotional_params[:scriptures] = scriptures

    @devotional = Devotional.new(devotional_params)

    # Check if all scriptures are valid
    if params[:devotional][:scriptures].all? { |scripture| valid_scripture?(scripture) }
      if @devotional.save
        render json: @devotional, status: :created, location: @devotional
      else
        render json: @devotional.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Invalid scripture format' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /devotionals/1
  def update
    @devotional = Devotional.find(params[:id])

    # Check if all scriptures are valid
    if params[:devotional][:scriptures].all? { |scripture| valid_scripture?(scripture) }
      if @devotional.update(devotional_params)
        render json: @devotional
      else
        render json: @devotional.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Invalid scripture format' }, status: :unprocessable_entity
    end
  end

  # DELETE /devotionals/1
  def destroy
    @devotional.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_devotional
    @devotional = Devotional.find(params[:id])
  end

  def valid_scripture?(scripture)
    pattern = /\A[a-zA-Z\s]+\s\d+:\s?\d+(?:-\d+)?\z/
    match = scripture.match(pattern)
    !match.nil?
  end

  # Only allow a list of trusted parameters through.
  def devotional_params
    params.require(:devotional).permit(
      :title,
      :body,
      :is_markdown,
      :is_public,
      :template,
      :user_id,
      scriptures: []
    )
  end
end
