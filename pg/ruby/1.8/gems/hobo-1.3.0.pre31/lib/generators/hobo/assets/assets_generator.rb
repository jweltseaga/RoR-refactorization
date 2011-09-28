module Hobo
  class AssetsGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def self.banner
      "rails generate hobo:assets"
    end

    def copy_rapid_files
      template  'application.dryml.erb',        'app/views/taglibs/application.dryml'
      copy_file 'application.css',              'public/stylesheets/application.css'
      copy_file 'dryml-support.js',             'public/javascripts/dryml-support.js'
      copy_file 'dryml_taglibs_initializer.rb', 'config/initializers/dryml_taglibs.rb'
      copy_file 'guest.rb',                     'app/models/guest.rb'
    end

  end
end
