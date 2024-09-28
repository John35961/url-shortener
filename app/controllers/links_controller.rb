class LinksController < ApplicationController
  before_action :set_link, only: [:show, :redirect]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def show; end

  def create
    @link = Link.new(link_params)
    @link.slug = slug

    if @link.save
      redirect_to links_path, notice: 'Link was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def redirect
    if @link.active?
      redirect_to @link.original_url, allow_other_host: true
      @link.increment!(:click_count)
    else
      redirect_to root_path, alert: 'This link has expired.'
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url, :expires_at)
  end

  def set_link
    @link = Link.find_by(slug: params[:slug])

    redirect_to root_path, alert: 'Link not found.' if @link.nil?
  end

  def slug
    slug = params[:link][:slug]
    return slug if slug.present?

    SecureRandom.uuid[0..5]
  end
end
