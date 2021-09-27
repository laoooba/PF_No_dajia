class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@content, @method).page(params[:page]).per(5)
  end

  private
  def search_for(content, method)
    method = 'partial'
    Post.where('title LIKE ?', '%' + content + '%')
  end
end
