  class SearchController < ApplicationController

    def index
      query = params[:query]
      @results = Product.search(query)
      search_field = params[:query].present? ? params[:query] : "*";
      filter_field = params[:filter];
      @posts = if filter_field.present?
        Product.search(search_field,fields: %i[product_name product_details],where:{product_details:{ like: "%#{filter_field}%" }},operator: "or")
      else
        Product.search(search_field,fields: %i[product_name product_details])
      end
      render partial: "products/product", collection: @posts, as: :product
    end

    def suggestions
      @results = search_for_posts
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream:
          turbo_stream.update('suggestions',partial: "search/suggestions", collection: @results, as: :product )
        end
      end
    end
    def search_for_posts
      if params[:query].blank?
                      Post.all
      else
        Product.search(params[:query],fields: %i[product_name :product_details],operator: "or")
      end
    end

  end
