class Api::V1::ListsController < ApplicationController
    
    #desplay all the list crated 
    def index 
        @lists = List.all

    #render the list in the json format 
        render json: @lists, status: 200
    end

    def show 
        @list = List.find(params[:id])

        render json: @list, status: 200
    end

    def create 
        @list = List.create(list_params)

        render json: @list, status: 200
    end

    #updates the params 
    def update
        @list = List.find(params[:id])
        @list.update(list_params)

        render json: @list, status: 200
    end

    def destroy
        @list = List.find(params[:id])
        @list.delete

        render json: {listId: @list.id}
    end

    # pass the list params 
    private 
    def list_params
        params.require(:list).permit(:body)
    end
end