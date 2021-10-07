require 'pagy/extras/overflow'
require 'pagy/extras/array'
Pagy::VARS[:overflow] = :empty_page

# global default "per_page" value
Pagy::VARS[:items] = 50
