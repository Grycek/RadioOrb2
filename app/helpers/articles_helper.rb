module ArticlesHelper
  def authenticate_article_or_comment_author(article, comment)
    return false unless current_user and ((current_user.articles.include? Article.find( article ) ) or current_user.comments.include? Comment.find( comment ) )
    return true
  end
end
