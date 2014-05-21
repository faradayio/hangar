class PostsController < ApplicationController
  def handle
    render nothing: true, status: :ok
  end
  alias_method :create, :handle
  alias_method :new, :handle
  alias_method :update, :handle
  alias_method :delete, :handle
  alias_method :show, :handle
  alias_method :index, :handle
end