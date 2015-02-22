require 'digest/sha2'

class HomeController < ApplicationController

  # GET /
  def new
    @content = Content.new
  end

  # GET /p/:key
  def show
    set_content
  end

  # POST /create.json
  # expected to be called by AJAX
  def create
    @content = Content.new(content_params)

    #TODO create hash value from time, body and name
    key = Digest::SHA256.hexdigest(@content.id.to_s + @content.body + Time.now.to_i.to_s)
    @content.key = key

    if @content.save
      Rails.logger.info "content.id : #{@content.id}"
      #render :show, status: :created, location: @content
      render json: @content, status: :created
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      #@content = Content.find(params[:key])
      @content = Content.where(key: params[:key]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:body, :name)
    end
end
