module M1;
end

module M2
  include M1
end

module M3
  prepend M1
  include M2
end

p M3.ancestors     # => [M1, M3, M2]
