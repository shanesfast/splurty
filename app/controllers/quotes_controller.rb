class QuotesController < ApplicationController
  def index
    @quote = Quote.order(Arel.sql("RANDOM()")).first # Using Arel.sql() as recommended by Rails to prevent error message in console.
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
