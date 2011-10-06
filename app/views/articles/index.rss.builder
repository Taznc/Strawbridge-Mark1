xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title (this_blog.site_name)
    xml.description (this_blog.site_name + " Articles")
    xml.link formatted_articles_url(:rss)

    for article in @articles
      xml.item do
        xml.title article.title
        xml.description article.excerpt + article.body
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link article_url(article)
        xml.guid formatted_article_url(article, :rss)
      end
    end
  end
end