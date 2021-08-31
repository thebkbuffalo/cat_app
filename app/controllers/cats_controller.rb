class CatsController < ApplicationController
  include ActionController::MimeResponds
  def index
    @cats = Cat.all.order(created_at: :desc)
    format.json {render json: {status: 200, cats: @cats}}
  end
  

  def show
    @cat = Cat.find(params[:id])
    render json: {status: 200, cat: @cat}
  end

  def create
    cat = Cat.new(cat_params)
    if cat.save
      render json: {status: 200, message: "cat img saved"}
    else
      # get status code
      render json: {status: 400, message: "something went wrong"}
    end
  end

  def update

  end

  def delete
    cat = Cat.find(params[:id])
    if cat.destroy
      render json: {status: 200, message: "cat img deleted"}
    else
      # figure out how to get status code
      render json: {status: 400, message: "something went wrong"}
    end
  end

  private
    def cat_params
      params.require(:cat).permit(:image)
    end
end
