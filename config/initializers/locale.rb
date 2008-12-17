# in config/initializer/locale.rb

# tell the I18n library where to find your translations
I18n.load_path += Dir[ File.join(RAILS_ROOT, 'config', 'locales', '*.{rb,yml}') ]

# you can omit this if you're happy with English as a default locale
I18n.default_locale = :'cz'