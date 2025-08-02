defmodule Secrets do
  def secret_add(secret) do
    secret = fn x -> 
      x + secret
    end
  end

  def secret_subtract(secret) do
    secret = fn x ->
      x - secret
    end
  end

  def secret_multiply(secret) do
    secret = fn x ->
      x * secret
    end
  end

  def secret_divide(secret) do
    secret = fn x ->
      div(x, secret)
    end
  end

  def secret_and(secret) do
    secret = fn x ->
      Bitwise.band(x, secret)
    end
  end

  def secret_xor(secret) do
    secret = fn x ->
      Bitwise.bxor(x, secret)
    end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn(x) ->
      c = secret_function1.(x)
      secret_function2.(c)
    end
  end
end
