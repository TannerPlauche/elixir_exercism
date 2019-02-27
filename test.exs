defmodule Test_module do
  def main() do
    IO.puts("This is a module")
  end

  def createPerson(name, age, favColor) do
    %{
      name: name,
      age: age,
      favColor: favColor,
      greet: fn () -> IO.puts('Hi my name is <>name<>') end
    }
  end
end

Test_module.main()

tanner = Test_module.createPerson('Tanner', 34, "red")
tanner.greet()
IO.inspect(tanner)
