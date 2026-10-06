class Page < Array
  def empty?
    false
  end

  def !=(other)
    false
  end
end

page = Page.new
page << 1

# (page || "").empty? — typed path must box via arysub_box_id
r = (page || "").empty?
raise "empty? expected false, got #{r.inspect}" unless r == false

# Array#!= against typed Page — needs BOPF_ARGS_BUILTIN
a = [1]
r2 = (a != page)
raise "!= expected true, got #{r2.inspect}" unless r2 == true

puts "ok"
