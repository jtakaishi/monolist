class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      response = Amazon::Ecs.item_search(params[:q] , 
                                  :search_index => 'All' , 
                                  :response_group => 'Medium' , 
                                  :country => 'jp')
      @amazon_items = response.items
      #binding.pry
      #@amazon_items.title        = amazon_items.get('ItemAttributes/Title')
      #@amazon_items.small_image  = amazon_items.get("SmallImage/URL")
      #@amazon_items.medium_image = amazon_items.get("MediumImage/URL")
      #@amazon_items.large_image  = amazon_items.get("LargeImage/URL")
      #@amazon_items.detail_page_url = amazon_items.get("DetailPageURL")
      #@amazon_items.raw_info        = amazon_items.get_hash
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
