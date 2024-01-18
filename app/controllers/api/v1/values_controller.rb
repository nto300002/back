module Api
  module V1
    class Api::V1::ValuesController < ApplicationController
      before_action :set_value, only: [:edit, :update, :destroy]

      # 新規作成のアクションを無効化
      before_action :redirect_if_new, only: [:new, :create]

      def index
        @values = Value.all
        render json: @values
      end
    
      def create
        if Value.exists?
          render json: { error: 'Creation is not allowed. Record already exists.' }, status: :unprocessable_entity
        else
          @value = Value.new(value_params)
          if @value.save
            render json: @value, status: :created, location: @value
          else
            render json: @value.errors, status: :unprocessable_entity
          end
        end
      end
    
      def update
        if @value.update(value_params)
          render json: @value
        else
          render json: @value.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @value.destroy
        redirect_to values_url, notice: 'value was successfully destroyed.'
      end
    
      private
    
      def set_value
        @value = Value.find(params[:id])
      end
    
      def value_params
        params.require(:value).permit(:job, :human_relations, :growth, :leisure_time)
      end

    end
  end
end
