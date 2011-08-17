# 2011-08-17 
# 
# "Example Ruby Project"
# @author get.oren@gmail.com
# 
# how I generated "Virtually Green" testing application
# written as bash script

cd new/
rake db:create

# (as a separate process run `./script/server`)

#-------------------------------------------------------------------------------
# Model
#-------------------------------------------------------------------------------

# create basic Product scaffold
./script/generate scaffold Product\
    name:string\
    title:string\
    image:string\
    description:text

# create basic Review scaffold
./script/generate scaffold Review\
    name:string\
    title:string\
    content:text

# assert basic product-review relationship
sed '2i\
    has_many :reviews'\
    app/models/product.rb > app/models/product.rb.sed
rm app/models/product.rb
mv app/models/product.rb.sed > app/models/product.rb

# assert basic user-product-review relationship
sed '2i\
    belongs_to :product
    belongs_to :user
    validates_uniqueness_of :user_id, :scope => :product_id'\
    app/models/review.rb > app/models/review.rb.sed
rm app/models/review.rb
mv app/models/review.rb.sed > app/models/review.rb

#-------------------------------------------------------------------------------
# Controller
#-------------------------------------------------------------------------------

# make a homepage
./script/generate controller home index

# redirect root to home's index method
# using `map.root :controller => "home"`
sed '2i\
    map.root :controller => "home"'\
    config/routes.rb > config/routes.rb.sed
rm config/routes.rb
mv config/routes.rb.sed > config/routes.rb

#-------------------------------------------------------------------------------
# View
#-------------------------------------------------------------------------------

echo '<h1>Virtually Green</h1>
<p>An exercise in basic Ruby scaffolding.</p>
<%= link_to "Products", products_path %>
<%= link_to "Reviews", reviews_path %>' > app/views/home/index.html.erb
