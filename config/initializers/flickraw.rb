require 'flickraw'

FlickRaw.api_key = Figaro.env.flickr_key
FlickRaw.shared_secret = Figaro.env.flickr_secret