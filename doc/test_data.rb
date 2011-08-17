products = [
    { "name"=>"CFMG2010_PID", "title"="Coffee Mug","image"=>"mug.png","description" => "a great way to drink coffee." },
    { "name"=>"BIKE2088_PID", "title"="Lightweight Bike","image"=>"bike.png","description" => "great for getting places." },
    { "name"=>"GBAG1996_PID", "title"="Green Handbag","image"=>"bag.png","description" => "bags can really free up your hands." }
]

products.each { |product|
    p = Product.new(
        :name => product["name"],
        :title => product["title"],
        :image => product["image"],
        :description => product["description"]
    )
    p.save()
}
