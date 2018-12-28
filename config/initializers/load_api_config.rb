API_CONFIG = YAML.load(ERB.new(File.read("#{Rails.root}/config/api.yml")).result)

api_key = API_CONFIG['api']['api_key']
language = API_CONFIG['api']['language']

if api_key.blank?
  raise "Precisa de uma API key"
end

if language.blank?
  language = 'pt-BR'
end

Rails.application.config.x.api_key = api_key
Rails.application.config.x.language = language
