# frozen_string_literal: true

class PublicationsController < ApplicationController
  before_action :authorize_request!

  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    render
  end

  def create
    publication = Publication.new({
                                    **publication_params,
                                    author_id: current_user.id,
                                    status: :draft,
                                    published_at: Time.now,
                                    region: current_user.user? ? current_user.region : publication_params[:region]
                                  })
    publication.save!

    redirect_to "/publications/#{publication.id}", alert: 'Publication created'
  end

  private

  def publication_params
    params.permit(:title, :region, content: {}, files: [])
  end

  def current_user
    User.find(session[:user_id])
  end
end
