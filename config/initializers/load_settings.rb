module Settings
  YAML.load_file(Rails.root.join 'config', 'settings.yml')[Rails.env]
  .each do |setting, value|
    const_set setting.upcase, value
  end
end