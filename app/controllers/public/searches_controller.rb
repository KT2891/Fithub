class Public::SearchesController < ApplicationController
  def index
    @word = params[:word]
    @category = params[:category]
    search_items
    @search_items_count = @search_items.count
  end

  private
    def search_items
      #検索フォームに入力がない場合、元のページにリダイレクト
      redirect_to request.referer, alert: "検索フォームに文字を入力してください" if @word.empty?

      if @category == "user"
        # 商品名検索
        @search_items = User.look(@word)
        @show_items = @search_items.page(params[:page]).per(12)
      elsif @category == "post"
        # 商品ジャンル検索
        @search_items = Post.look(@word)
        @show_items = @search_items.page(params[:page]).per(5)
      end
    end

end
