module Forem
  class CategoriesController < ApplicationController
    load_and_authorize_resource
    layout 'forem'

    def show
      @category = Category.find(params[:id])
    end
  end
end
