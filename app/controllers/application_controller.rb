class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json(include: :baked_goods)
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc )
    baked_goods.to_json()
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.order(price: :desc).limit(1)[0]
    baked_goods.to_json(only: [:name, :price])
  end


end


# GET /baked_goods/by_price: returns an array of baked goods as JSON, sorted by price in descending order. (HINT: how can you use Active Record to sort the baked goods in a particular order?)

# GET /baked_goods/most_expensive: returns the single most expensive baked good as JSON. (HINT: how can you use Active Record to sort the baked goods in a particular order?)