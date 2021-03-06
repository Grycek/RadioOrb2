module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the edit broadcast page/
      edit_broadcast_path(@broadcast)
    when /the broadcast page/
      broadcast_path(@broadcast)
    when /the broadcast_playlist page/
      broadcast_broadcast_playlist_path(@broadcast, @playlist)
    when /the edit broadcast_playlist page/
      edit_broadcast_broadcast_playlist_path(@broadcast, @playlist)
    when /the new broadcast_playlist page/
      new_broadcast_broadcast_playlist_path(@broadcast, @playlist)
    when /the edit_broadcast_broadcast_playlist_comment/
      edit_broadcast_broadcast_playlist_comment_path(@broadcast, @playlist, @comment)
    when /the edit_article page/
      edit_article_path(@article)
    when /the article page/
      article_path(@article)
    when /the edit_article_article_comment/
      edit_article_article_comment_path(@article, @comment)
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
