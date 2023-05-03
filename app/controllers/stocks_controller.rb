class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])

      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash.now[:alert] = "Please enter a valid symbol to search"
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      end
    else
      flash.now[:alert] = "Please enter a symbol to search"
      respond_to do |format|
        format.js { render partial: 'users/result' }
      end
    end
  end

end