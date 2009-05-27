railsapp Mash.new unless attribute?("railsapp")
railsapp[:app_name] = "radiant" unless railsapp.has_key?(:app_name)
railsapp[:revision] = "HEAD" unless railsapp.has_key?(:revision)
railsapp[:branch] = "HEAD" unless railsapp.has_key?(:branch)
railsapp[:environment] = "production" unless railsapp.has_key?(:environment)
railsapp[:migrate_command] = "rake #{railsapp[:environment]} db:migrate" unless railsapp.has_key?(:migrate)
railsapp[:migrate] = false unless railsapp.has_key?(:migrate)
railsapp[:action] = "nothing" unless railsapp.has_key?(:action)

