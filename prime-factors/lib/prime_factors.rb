class PrimeFactors
  def self.generate(n)
    primes = []
    candidate = 2
    while n > 1
      while n % candidate == 0
        primes << candidate
        n /= candidate
      end
      candidate += 1
    end
    primes
  end
end