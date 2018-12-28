API_CONFIG = YAML.load_file("#{Rails.root}/config/api.yaml")

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
