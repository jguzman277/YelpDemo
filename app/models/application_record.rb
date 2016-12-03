class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Document < ActiveRecord::Base
	include ElasticSearch::Model
end