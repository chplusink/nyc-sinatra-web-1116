class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    @figure.titles << @title
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
    redirect '/figures'
  end

  get '/figures' do
    @figures=Figure.all
      erb :'figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
      erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    # binding.pry
    @figure.update(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark])
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
      erb :'figures/show'
  end

end
