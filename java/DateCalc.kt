object DateCalc{
  @JvmStatic
  fun main(args : Array<String>){
    println("Loading")
    Thread.sleep(4000L)
    print(".")
    Thread.sleep(4000L)
    print(".")
    Thread.sleep(4000L)
    print(".")
    println("Done!")
    println("\n")
    println("Simple Exact Date Calculator")
    println("By: MaxDistructo")
    println("Input date number 1 in mm/dd/yyyy format.") 
    val scanner = Scanner(System.`in`)
    val startDate = scanner.nextString()
    println("Input number of days to add onto the start date.")
    val days = scanner.nextInt()
    println("Calculating...")
    val dateInputAsArray = startDate.split("/")
    val startDateNew = LocalDate.of(dateInputAsArray[2], 
    Thread.sleep(4000L)
    println(output)
  }
}
