class Person
  ["sad", "happy", "worried", "terrified"].each do |emotion|
    define_method "make_#{emotion}" do
      instance_variable_set "is_#{emotion}", true
    end

    define_method "make_#{emotion}_because" do |reason|
      send("make_#{emotion}")
      instance_variable_set "@#{emotion}_reason"
    end

    define_method "#{emotion}?" do
      [instance_variable_get("@is_#{emotion}") ? "Yeah" : "Nope", instance_variable_get("@#{emotion}_reason")].compact.join(", ")
    end
  end

p = Person.new
puts p.sad?
p.make_sad
pust p.sad?
p.make_sad_because("Java")
puts p.sad?

puts p.happy?
p.make_happy
puts p.happy?
p.make_happy_because("Ruby")
puts p.happy?
