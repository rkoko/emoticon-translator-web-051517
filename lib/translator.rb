require 'yaml'
require 'pry'

def load_library(filepath)
  hash = YAML.load_file(filepath)
  emoticons = {}
  emoticons["get_emoticon"] = {}
  emoticons["get_meaning"] = {}
    hash.each do |key, symbol|
      emoticons["get_meaning"][symbol[1]] = key
      emoticons["get_emoticon"][symbol[0]] = symbol[1]
    end
  emoticons
end

def get_japanese_emoticon(filepath, emoticon)
  emoticons = load_library(filepath)
  if emoticons["get_emoticon"][emoticon].nil?
    return "Sorry, that emoticon was not found"
  else
    emoticons["get_emoticon"][emoticon]
  end
end

def get_english_meaning(filepath, emoticon)
  emoticons = load_library(filepath)
  if emoticons["get_meaning"][emoticon].nil?
    return "Sorry, that emoticon was not found"
  else
    emoticons["get_meaning"][emoticon]
  end
end
