class ListsController < ApplicationController
    before_action :set_list, :only => [:edit, :update, :destroy]
    def index
      @lists = List.all
    end
    # create a new record
    def new
      @lists = List.new
    end

    def create
      @lists = List.new(list_params)
      @lists.save

      redirect_to lists_url
    end
    # update a new record
    def update
        if @lists.update_attributes(list_params)
            redirect_to lists_url
        else
            render :edit
        end
    end
    # delete a new record
    def destroy
      @lists.destroy

      redirect_to lists_url
    end

    private
    def set_list
      @lists = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :due_date, :note)
    end
end
