# refinement 细化,  using StringExtensions
module StringExtensions
  refine String do
    def reverse
      "esrever"
    end
  end
end

module StringStuff
  using StringExtensions
  "my_string".reverse    #=> "esrever"
end

p "my_string".reverse      #=> "gnirts_ym"
