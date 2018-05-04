class Api::V1::LinksController < ApplicationController

  def create
    @link = Link.new(link_params)

    if @link.save
      render json: @link
    else
      render json: @link.errors
    end

  end

private

  def link_params
    params.permit(:given_url, :slug)
  end


end
