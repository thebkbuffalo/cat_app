class CatsController < ApplicationController
  def index
    #gets all cats and adds the publicly available url for each cat in the json response
    binding.pry
    @cats = Cat.all.order(created_at: :desc).map{|c| {id: c.id, created_at: c.created_at.strftime('%d/%m/%y'), url: c.get_image_url}}
    render json: {status: response.status, cats: @cats}
  end
  

  def show
    #returns singular cat based on id param
    @cat = Cat.find(params[:id])
    render json: {status: response.status, cat: {id: @cat.id, created_at: @cat.created_at.strftime('%d/%m/%y'), url: @cat.get_image_url}}
  end

  def create
    #creates a new cat image
    cat = Cat.new(image: params[:image])
    if cat.save
      render json: {status: response.status, message: "cat img saved"}
    else
      render json: {status: response.status, message: "something went wrong"}
    end
  end

  def update
    #update an existing cat image
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(image: params[:image])
      render json: {status: response.status, message: 'cat img has been updated'}
    else
      render json: {status: response.status, message: 'something went wrong'}
    end
  end

  def destroy
    #deletes a cat image
    @cat = Cat.find(params[:id])
    if @cat.destroy
      render json: {status: response.status, message: 'cat img deleted'}
    else
      render json: {status: response.status, message: 'something went wrong'}
    end
  end
end
