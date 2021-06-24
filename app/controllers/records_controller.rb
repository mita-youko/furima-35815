class RecordsController < ApplicationController
    before_action :authenticate_user!

    def index
        @record_address = RecordAddress.new
        @item = Item.find(params[:item_id])
        if current_user.id == @item.user_id
            redirect_to root_path
        end
    end

    def create
        @record_address = RecordAddress.new(record_params)
        if @record_address.valid?
            pay_item
            @record_address.save
            return redirect_to root_path
        else
            @item = Item.find(params[:item_id])
            render :index
        end
    end


    private
        
    def record_params
        params.require(:record_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
        @item = Item.find(params[:item_id])
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
        Payjp::Charge.create(
            amount: @item.price,
            card: record_params[:token],
            currency:'jpy'
        )
    end
end
