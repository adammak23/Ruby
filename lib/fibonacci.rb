

def fib(n)
(n==0 or n==1) ? 1 : fib(n-1)+fib(n-2)
end



class Integer
  def fact1
  zero? ? 1 : self * fact(self-1)
  end
end



$i = 1
$num = 32
while $i < $num  do
#   puts("4/√Φ)=#{4/Math.sqrt(fib($i)/fib($i-1).round(20))}")
#   puts("E^^PI=#{Math.exp(1)**Math.acos(-1)}")
# Euler-Binet:
  puts("#{(1/Math.sqrt(5))*((1+Math.sqrt(5))/2)**$i-(1/Math.sqrt(5)*((1-Math.sqrt(5))/2)**$i)}")
   $i +=1
end
