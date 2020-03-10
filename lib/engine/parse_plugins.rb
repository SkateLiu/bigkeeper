module BigKeeper
  class ParsePlugins
    @@plugins_file_path
    @@plugins = []

    def self.parse_plugin(path)
      if !path.empty?
          plugins_file_path = path + '/BigkeeperPlugins'

          if File::directory?(plugins_file_path) 
            @@plugins_file_path = plugins_file_path
            Dir.entries(File.join(plugins_file_path)).each { |file_name| 
              @@plugins << file_name
            }
          end
      end
    end

    def self.execute(plugin_name)  
      Dir.chdir(@@plugins_file_path) do
        if plugin_name.end_with?(".rb")
          system "ruby #{plugin_name}"
        elsif plugin_name.end_with?(".py")
          system "python #{plugin_name}"
        elsif plugin_name.end_with?(".sh")
          system("sh #{plugin_name}")
        else
  
        end
      end
    end
  end
end