require File.dirname(__FILE__) + "/lib/shadows"
require File.dirname(__FILE__) + "/lib/shadows/base"

default_load_path = File.join Rails.root, %w[ app shadows ]
shapes_load_path = File.join Rails.root, %w[ vendor plugins shapes app shadows ]
Shadows::Base.load_paths = [ default_load_path, shapes_load_path ]

ActiveRecord::Base.extend Shadows::Extension rescue nil
ActionController::Base.around_filter Shadows::Filter rescue nil
