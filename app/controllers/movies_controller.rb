class MoviesController < ApplicationController

  def index
    # render :json => params
    # render plain: params[:q].inspect

    query = params[:q]

    # janky way to check for blank search
    if query == ''
      redirect_to root_path
    end

    url = 'http://www.omdbapi.com/?s=' + query
    response = HTTParty.get(url)

    # shows response data from http request
    puts response.body, response.code, response.message, response.headers.inspect

    # this does not work
    # need to figure a way to check response correctly
    if response.code === 200
      @movies = response['Search']
      # render :json => response
    else
      redirect_to root_path
    end
  end

  def show
    query = params[:id]
    url = 'http://www.omdbapi.com/?i=' + query + '&plot=full&tomatoes=true'
    response = HTTParty.get(url)

    render :json => response
  end
end
