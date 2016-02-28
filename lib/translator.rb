require 'pry'
require 'yaml'

def load_library(path)
  hash = YAML.load_file("lib/emoticons.yml")
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  list = []
  counter = 1
  hash.each do |emotion, emojis|
    emojis.each do |emoji|
      list.push(emoji)
    end
    emojis.each do |emoji|
      if counter.even? == true
        emoticons["get_meaning"][emoji] = emotion
        counter += 1
      else
        emoticons["get_emoticon"][emoji] = list[counter]
        counter += 1
      end
    end
  end
  emoticons
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  emoticons["get_emoticon"].each do |west, japan|
    if emoticon == west
      return japan
    else
      nil
    end
  end
  return 'Sorry, that emoticon was not found'
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  emoticons["get_meaning"].each do |japan, meaning|
    if emoticon == japan
      return meaning
    else
      nil
    end
  end
  return "Sorry, that emoticon was not found"
end