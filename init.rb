default_load_path = File.join Rails.root, %w[ app shadows ]
additional_load_path = File.join Rails.root, %w[ vendor plugins shapes app shadows ]

# if shadows is already defined just include additional_load_path
# else do the whole plugin initialisation

if defined? Shadows::Base
  Shadows::Base.load_paths << additional_load_path
else
  require File.dirname(__FILE__) + "/lib/shadows"
  require File.dirname(__FILE__) + "/lib/shadows/base"
  Shadows::Base.load_paths = [ default_load_path, additional_load_path ]
  ActiveRecord::Base.extend Shadows::Extension rescue nil
  ActionController::Base.around_filter Shadows::Filter rescue nil
  ActiveRecord::Base.extend Shadows::Extension rescue nil
  ActionController::Base.around_filter Shadows::Filter rescue nil
end




