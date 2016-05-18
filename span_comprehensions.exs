defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, to) when from <= to, do: [from | span(from + 1, to)]

  def prime_from_2_to(n) do
    range = span(2,n)
    not_prime = for a <- range, a <-  do: 1 + x
  end

  def primes_to(n) do
    nums = span(2,n)
    not_prime = for a <- nums, b <- span(2, div(a, 2)), rem(a, b) == 0, do: a
    nums -- not_prime
  end
end

