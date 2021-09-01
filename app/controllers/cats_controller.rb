class CatsController < ApplicationController
  include ActionController::MimeResponds
  def index
    @cats = Cat.all.order(created_at: :desc).map{|c| {id: c.id, created_at: c.created_at.strftime('%d/%m/%y'), url: c.get_image_url}}
    render json: {status: 200, cats: @cats}
  end
  

  def show
    @cat = Cat.find(params[:id])
    render json: {status: 200, cat: @cat}
  end

  def create
    cat = Cat.new(image: cat_params)
    if cat.save
      render json: {status: 200, message: "cat img saved"}
    else
      # get status code
      render json: {status: 400, message: "something went wrong"}
    end
  end

  def update

  end

  def destroy
    binding.pry
    
  end

  private
    def cat_params
      params.permit(:image).require(:image)
    end
end
