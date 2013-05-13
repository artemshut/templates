module PostsHelper

  def truncate_hundred_words(post)
    post.content.split(/\s+/, 100+1)[0...100].join(' ')
  end

end
