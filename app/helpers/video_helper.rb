module VideoHelper
  include HTTParty
  require 'json'

  def video_embed(url, width=480, height=320)
    if url[/^.*vimeo\.com/]
      vimeo_embed(url, width, height)
    else
      youtube_embed(url, width, height)
    end
  end

  def video_thumb(url, size=nil, html_class=nil)
    if url[/^.*vimeo\.com/]
      vimeo_thumb(url, size, html_class)
    else
      youtube_thumb(url, size, html_class)
    end
  end

  private

  def youtube_thumb(url, size=nil, html_class=nil)
    if url[/youtu\.be\/([^\?]*)/]
      id = $1
    else
      url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      id = $5
    end
    thumb_url = case size
      when nil then "http://img.youtube.com/vi/#{ id }/default.jpg"
      when "large" then "http://img.youtube.com/vi/#{ id }/0.jpg"
      else "http://img.youtube.com/vi/#{ id }/default.jpg"
    end
    image_tag(thumb_url, :class => "#{html_class}")
  end

  def vimeo_thumb(url, size=nil, html_class=nil)
    if url[/vimeo\.com\/(\d+)/]
      id = $1
    end
    response = HTTParty.get("http://vimeo.com/api/v2/video/#{ id }.json")
    thumb_url = case size
      when "small" then response.parsed_response[0]['thumbnail_small']
      when nil then response.parsed_response[0]['thumbnail_medium']
      when "medium" then response.parsed_response[0]['thumbnail_medium']
      else response.parsed_response[0]['thumbnail_large']
    end
    image_tag(thumb_url, :class => "#{html_class}")
  end

  def youtube_embed(url, width, height)
    if url[/youtu\.be\/([^\?]*)/]
      id = $1
    else
      url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      id = $5
    end
    "<iframe title=\"YouTube video player\" width=\"#{ width }\" height=\"#{ height }\" src=\"http://www.youtube.com/embed/#{ id }\" frameborder=\"0\" allowfullscreen></iframe>".html_safe
  end

  def vimeo_embed(url, width, height)
    if url[/vimeo\.com\/(\d+)/]
      id = $1
    end
    "<iframe title=\"Vimeo video player\" width=\"#{ width }\" height=\"#{ height }\" src=\"http://player.vimeo.com/video/#{ id }\" frameborder=\"0\" allowfullscreen></iframe>".html_safe
  end
end