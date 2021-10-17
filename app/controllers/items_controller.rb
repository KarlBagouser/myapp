class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
        if params.key?("search")
            @items = Item.where("name like '%#{params[:search]}%'")
        else
            @items = Item.all
        end
        @items
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        check_admin
        @item = Item.new
    end

    def create
        check_admin
        @item = Item.new(item_params)

        if @item.save
            redirect_to @item
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        check_admin
        @item = Item.find(params[:id])
    end
    
    def update
        check_admin
        @item = Item.find(params[:id])

        if @item.update(item_params)
            redirect_to @item
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        check_admin
        @item = Item.find(params[:id])
        @item.destroy
    
        redirect_to root_path
    end
    
    private
    def item_params
      params.require(:item).permit(:name, :description, :price, :image)
    end

    def check_admin
        if !current_user.admin
            raise ActionController::RoutingError.new('Not Found')
        end
    end

    
end
