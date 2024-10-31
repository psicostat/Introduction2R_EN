# Definition of Functions {#functions}



In Chapter \@ref(functions-def), we introduced the concept of functions and saw how they are used to manipulate objects in R and perform numerous tasks. In Chapter \@ref(packages), we also saw how packages can be used to access new functions, thus greatly extending the possible applications of R. However, in R, it is also possible to define your own functions to perform specific tasks according to your own needs.

This is one of the main advantages of using a programming language, i.e., being able to develop custom functions according to your needs and not being limited to predefined ones. In this chapter, we will describe how to create your own functions in R.

## Creating a Function

The command used to create a function in R is `function()` followed by curly brackets `{ }` within which the function body must be specified:


``` r
function_name = function( ){
  <function-body>
}
```

Note that it is necessary to assign the function to an object, for example `my_function`, which will become the name of our function. To execute the function, simply, as with any other function, specify the function name followed by parentheses, in our case `my_function()`. Let's look at some examples of simple functions:


``` r
# Define the function
my_greetings = function(){
  print("Hello World!")
}

my_greetings()
## [1] "Hello World!"

# Define another function
my_sum = function(){
  x = 7
  y = 3
  x + y
}

my_sum()
## [1] 10
```

When we call our function, R will execute the function body and return the result of the last command executed. However, the functions in the previous example prove to be of little use since they always perform the same operations without allowing us to specify the function inputs. Furthermore, even though they are very simple functions, it might not be clear what output is actually returned by the function.

:::{design title="Function Names" data-latex="[Function Names]"}
When defining the name of a function, it's useful to follow the same guidelines regarding object names (see Chapter \@ref(objects-names)). In this case, to ensure the name is **self-descriptive**, it's common to use verbs that summarize the action performed by the function.
:::

### Defining Inputs and Outputs

Remember that, in general, functions receive objects as inputs, perform specific actions, and return new objects as outputs. Input and output are therefore two fundamental aspects of every function that require special attention.

- **Input** - We have also seen that in R, inputs are specified through the **arguments** of a function (see Chapter \@ref(function-arguments)). To define the arguments of a function, these must be indicated inside the parentheses when creating the function.
- **Output** - To specify the output of a function, the `return()` function is used, indicating between the parentheses the name of the object you wish to return as the result of the function.

The definition of a function with all its elements will follow the following pattern:

``` r
function_name = function(argument_1, argument_2, ...){
  <function-body>
  return(<output-name>)
}
```

Now, we can rewrite the previous functions, allowing the inputs to be customized and highlighting what the returned output is.


``` r
# Redefine my_greetings()
my_greetings = function(name){
  greetings = paste0("Hello ", name, "!")
  return(greetings)
}

my_greetings(name = "Psicostat")
## [1] "Hello Psicostat!"

# Redefine my_sum()
my_sum = function(x, y){
  result = x + y
  return(result)
}

my_sum(x = 8, y = 6)
## [1] 14
```

:::{.design title="User Input" data-latex="[User Input]"}
If necessary, you can make the function itself ask the user to input specific information through the `readline()` function.

Using the `readline()` function, a message set in the `prompt` argument will appear in the console (remember to leave a space at the end). The user will be prompted to type an alphanumeric sequence and then press *enter*. The values entered by the user will be saved as a character variable in the object we specify and can be used later in the function.


``` r
happy_birthday = function(){
  name = readline(prompt = "Enter your name: ")
  message = paste0("Happy Birthday ", name, "!")
  return(message)
}

happy_birthday()
```

Note that this function can only be used in interactive R sessions since direct user input is required.
:::

#### Default Arguments {-}

We have seen how to add arguments that must be defined by the user when using the function. If the user does not specify one or more arguments, R will return an error message indicating that there are unspecified arguments without default values.


``` r
my_sum(x = 5)
## Error in my_sum(x = 5): argument "y" is missing, with no default
```

To assign default values to a function's arguments, simply specify them when creating the function within the parentheses as `argument_name = <default-value>`. If not otherwise specified, the arguments will take their default values. However, users are free to specify the function's arguments according to their needs. For example, let's set a default value for `y = 10` in the `my_sum()` function.


``` r
my_sum = function(x, y = 10){
  result = x + y
  return(result)
}

# Use the default value of y
my_sum(x = 5)
## [1] 15

# Specify the value of y
my_sum(x = 5,  y = 8)
## [1] 13
```

This practice is widely used to specify particular behaviors of functions. Generally, functions are defined with a default behavior, but certain arguments can be specified for particular needs only when necessary.

:::{.trick title="match.arg()" data-latex="[match.arg()]"}
To enforce the selection of an argument from a limited set of values, a vector of possible values can be specified in the argument definition. The selection must then be validated using the `match.arg()` function, as shown in the following example:


``` r
# Redefine my_greetings()
my_greetings = function(name, type = c("Hello", "Goodbye")){
  type = match.arg(type)
  greetings = paste0(type," ", name, "!")
  return(greetings)
}

# Choose type
my_greetings(name = "Psicostat", type = "Goodbye")
## [1] "Goodbye Psicostat!"

# Default value
my_greetings(name = "Psicostat")
## [1] "Hello Psicostat!"

# Invalid value
my_greetings(name = "Psicostat", type = "Guten Tag")
## Error in match.arg(type): 'arg' should be one of "Hello", "Goodbye"
```

The `match.arg()` function allows comparing the specified value against those indicated in the argument definition, returning an error if there is no match. Note how, if unspecified, the default value is the first one indicated in the definition.
:::

### Exercises {-}

Complete the following exercises:

  1. Define a function that converts temperature from Celsius to Fahrenheit: 
  $$
  Fahrenheit = Celsius *1.8 + 32
  $$
  2. Define a function that sends Christmas and Easter greetings to a person.
  3. Define a function that, given a vector of numeric values, calculates the number of elements and their average.
  4. Define an interactive function that calculates the product of two values. The inputs must be obtained using the `readline()` function.
  5. Define a function that calculates the monthly salary based on the hours worked in the month and the hourly wage.


## Working with Functions

Functions are undoubtedly the most useful and advanced aspect of the R language and programming languages in general. The packages developed in R are nothing more than a collection of functions that work together for a specific purpose. Besides the function's purpose, it is important to understand how to handle **errors and unexpected events**. If the function accepts arguments, the end-user or even ourselves can mistakenly use it in the wrong way. Therefore, it is crucial to understand how to read errors but, more importantly, how to create useful error or warning messages for using the function.

Let's take the sum function `+`, for example. Even though it might not seem like it, the `+` operator is actually a function. We have already seen above how we could write a `my_sum()` function that does the same as `+`:


``` r
my_sum = function(x, y){
  res = x + y
  return(res)
}

my_sum(1, 5)
## [1] 6
1 + 5
## [1] 6
```

We have defined a (rather simple) function to calculate the sum of two numbers. What happens if we try to add a number to a string? Clearly, this is an operation that makes no sense, and we expect some kind of error:


``` r
my_sum("any_string", 5)
## Error in x + y: non-numeric argument to binary operator
```

In this case, we see an `Error...` message with the useful information that one of the arguments used is `non-numeric`. It is a simple, targeted message and, most importantly, it does not provide a result because a fundamental condition (summing applies only to numbers) is not met. The `+` function already includes this check, but if we wanted to implement a **check** and provide a **message**, we have several options:

- `stop(<message>, .call = TRUE)`: If placed inside a function, it halts execution and provides the specified message as an `Error`.
- `stopifnot(expr1, expr2, ...)`: If placed inside a function, it halts execution if at least one of a series of conditions is **not TRUE**.
- `warning()`: Provides a message to the user without stopping execution, offering information about a potential issue stemming from the input or a side effect of the function.
- `message()`: Provides a simple message without altering the function's execution, useful for informing about operations performed.

Returning to the sum example, imagine we want to write a function that sums only positive numbers. In other words, we want the `x` and `y` values input to the function to be positive in order for the function to execute. We can then include a `conditional check` and use the `stop()` function if the condition is not met:


``` r
my_positive_sum = function(x, y){
  if(x < 0 | y < 0){
    stop("The arguments must be positive numbers!")
  }
  res = x + y
  return(res)
}

my_positive_sum(10, 5)
## [1] 15
my_positive_sum(10, -5)
## Error in my_positive_sum(10, -5): The arguments must be positive numbers!
```

A faster way to manage execution halts is by using `stopifnot()`. However, the logic is slightly different from using `if` + `stop()`. In the previous example, the logic is: *"if x or y is less than 0, stop."* With `stopifnot()`, we use reverse logic, meaning we specify what we want to be `TRUE` and halt the execution if it is `FALSE`. In our case, we use `stopifnot(x > 0, y > 0)`, which means to stop if `x` or `y` *is NOT* greater than `0`. Unlike `stop()`, this does not provide a customized message but returns the first condition that is not met:


``` r
my_positive_sum = function(x, y){
  stopifnot(x > 0, y > 0)
  res = x + y
  return(res)
}
my_positive_sum(10, -5)
## Error in my_positive_sum(10, -5): y > 0 is not TRUE
```

Similarly, let's imagine (with a bit of imagination) that our function is not reliable for numbers less than 10, meaning it might occasionally produce incorrect results. In this case, we don't want to halt execution but provide a `warning` message:


``` r
my_positive_sum = function(x, y){
  # Error
  if(x < 0 | y < 0){
    stop("The arguments must be positive numbers!")
  }
  # Warning
  if(x < 10 | y < 10){
    warning("For some strange reason, the function doesn't handle numbers below 10 very well, be careful! :)")
  }
  res = x + y
  return(res)
}

my_positive_sum(15, 4)
## Warning in my_positive_sum(15, 4): For some strange reason, the function
## doesn't handle numbers below 10 very well, be careful! :)
## [1] 19
```

As you can see, we get the result (which is, of course, correct), but also a `warning` message that alerts us to this possible (but not critical) issue.

Lastly, we can accompany the result with a message under certain conditions, providing additional information using the `message()` function:


``` r
my_positive_sum = function(x, y){
  # Error
  if(x < 0 | y < 0){
    stop("The arguments must be positive numbers!")
  }
  # Warning
  if(x < 10 | y < 10){
    warning("For some strange reason, the function doesn't handle numbers below 10 very well, be careful! :)")
  }
  res = x + y
  message("Great job! :)")
  return(res)
}

my_positive_sum(12, 10)
## Great job! :)
## [1] 22
```

One last important aspect concerns what happens when we assign the result of a function in the presence of errors, warnings, or messages. In general, except in cases where errors occur (hence using the `stop()` function), the output remains the same, and the message is simply printed to the console:


``` r
res1 = my_positive_sum(10,5)
## Warning in my_positive_sum(10, 5): For some strange reason, the function
## doesn't handle numbers below 10 very well, be careful! :)
## Great job! :)
res2 = my_positive_sum(10,23)
## Great job! :)
res3 = my_positive_sum(10,-1)
## Error in my_positive_sum(10, -1): The arguments must be positive numbers!

res1
## [1] 15
res2
## [1] 33
res3 # no output
## Error: object 'res3' not found
```

As you can see, when an error occurs and we stop execution, the function, despite being expected to return an output, does not provide any result because it was interrupted.

## Function Environment

The concept of *environment* in R is quite complex. In simple terms, all the operations we normally perform in the console or in a script happen within what is called the *global environment*. When we write and execute a function, we are creating a function object (in the *global environment*), which in turn creates an internal environment to perform the specified operations. Let's imagine we have this function `my_fun()` that takes a value `x` and adds it to a value `y`, which is not an argument.


``` r
my_fun = function(x){
  return(x + y)
}

my_fun(10)
## Error in my_fun(10): object 'y' not found
```
Clearly, we get an error because the object `y` was not created. However, if we create the `y` object inside the function, it will perform the addition correctly, but it will not create the `y` object in the global environment.


``` r
my_fun = function(x){
  y = 1
  return(x + y)
}

my_fun(10)
## [1] 11
ls() # we only have our function as an object
## [1] "my_fun"          "my_greetings"    "my_positive_sum" "my_sum"         
## [5] "res1"            "res2"
```

From this, it's clear that what happens inside the function is somewhat compartmentalized compared to the global environment. The only way to influence the global environment is to assign the result of the function, thus creating a new object:


``` r
res = my_fun(10)
ls()
## [1] "my_fun"          "my_greetings"    "my_positive_sum" "my_sum"         
## [5] "res"             "res1"            "res2"
```

Another important point, especially for managing side effects, is the fact that the function does **not** modify and does **not** interfere with objects in the *global environment* that have the same names as objects within the *function environment*:


``` r
y = 10 # global environment

my_fun = function(x){
  y = 1 # function environment
  return(x + y) # this uses the function's y
}

my_fun(1)
## [1] 2
y
## [1] 10
```

As you can see, we created an object `y` inside the function. If executed in the same environment, this would have overwritten the previous value. The result is based on the value of `y` created in the function environment, and the global `y` was not modified.

One final important point concerns the relationship between the function environment and the global environment. We have seen their independence, but this is not absolute. If, inside the function, we use a variable defined only in the global environment, the function will automatically use that value (if not specified internally). This is useful for allowing functions and global variables to work together, but it is always preferable to create an independent function environment and provide **arguments** for all the necessary objects.


``` r
y = 10

my_fun = function(x){
  return(x + y) # no "y" exists in the local function environment, therefore, "y" from global environment is used
}

my_fun(1)
## [1] 11
```

The key points to remember when defining and using functions are:

- Every time a function is executed, the internal environment is recreated, so it's like starting from scratch.
- Objects created inside the function take precedence over those in the external environment.
- If the function uses an object not defined internally, it will automatically look for it in the main environment.

*Note*: For a more in-depth discussion of the "Environments" topic, [Chapter 7](https://adv-r.hadley.nz/environments.html) from Hadley Wickham's book *Advanced R* is an excellent resource.

## Best Practices

Writing functions is certainly the most important aspect when writing code. It allows you to automate operations, reduce the amount of code, make your script clearer, and reuse a certain portion of code in other contexts. However, there are some conventions and best practices for writing excellent and versatile functions:

- When is a function necessary?
- Choosing the name
- Simplifying the number of operations and outputs
- Commenting and documenting

### When is a Function Necessary?

[Hadley Wickam](https://r4ds.had.co.nz/functions.html#when-should-you-write-a-function) suggests that if we repeat a series of operations more than twice, it might be better to write a function. Let's imagine we have a series of objects and want to perform the same operation on all of them. For example, we want to *center* (i.e., subtract the mean from all the values of a numeric vector) a numeric vector:


``` r
vect1 = runif(10)
vect2 = runif(10)
vect3 = runif(10)
```

In previous chapters, we saw how to use the `apply` family and how a function can be applied to a series of objects. But let's imagine a case where we have a very long script and at various points, we perform a certain operation:


``` r
# Mean centering
vect1 - mean(vect2)
##  [1] -0.36983657  0.02930042  0.28700326  0.06053033  0.48756396  0.11816595
##  [7]  0.02949155  0.40480046  0.20157434 -0.22178678
vect2 - mean(vect2)
##  [1] -0.05166315 -0.21703672  0.39817875 -0.42441668 -0.39888306 -0.21679081
##  [7]  0.23825572  0.04177470  0.19494606  0.43563521
vect3 - mean(vect3)
##  [1] -0.039659570 -0.020985145  0.390100614  0.170242907  0.080847578
##  [6] -0.082188131  0.217626136  0.004661362 -0.222537699 -0.498108053
```

The operation is performed correctly and is also easy to understand. However, we are always doing the same thing, just changing an input (the very definition of a function), so we can:


``` r
my_fun = function(x){
  return(x - mean(x))
}

my_fun(vect1)
##  [1] -0.47251726 -0.07338028  0.18432256 -0.04215036  0.38488327  0.01548526
##  [7] -0.07318914  0.30211977  0.09889365 -0.32446747
my_fun(vect2)
##  [1] -0.05166315 -0.21703672  0.39817875 -0.42441668 -0.39888306 -0.21679081
##  [7]  0.23825572  0.04177470  0.19494606  0.43563521
my_fun(vect3)
##  [1] -0.039659570 -0.020985145  0.390100614  0.170242907  0.080847578
##  [6] -0.082188131  0.217626136  0.004661362 -0.222537699 -0.498108053
```

The code hasn't changed much in terms of lines or complexity. However, imagine realizing an error or wanting to change or extend the operations on `vect1`, `vect2`, and `vect3`. In the first case, you would have to go line by line through the script and modify the code. In the case of a function, simply changing the operations will apply them every time the function is called. Let's imagine that we also want to *standardize* (subtract the mean and divide by the standard deviation) our vectors:


``` r
my_fun = function(x){
  res = (x - mean(x)) / sd(x)
  return(res)
}

my_fun(vect1)
##  [1] -1.79382948 -0.27857544  0.69974850 -0.16001649  1.46114230  0.05878708
##  [7] -0.27784983  1.14694509  0.37543251 -1.23178424
my_fun(vect2)
##  [1] -0.1651397 -0.6937513  1.2727663 -1.3566351 -1.2750176 -0.6929653
##  [7]  0.7615772  0.1335316  0.6231392  1.3924948
my_fun(vect3)
##  [1] -0.16168763 -0.08555409  1.59039653  0.69406127  0.32960652 -0.33507181
##  [7]  0.88723740  0.01900385 -0.90726129 -2.03073077
```

Of course, the combination of functions and the `apply` family allows everything to be even more compact and efficient:


``` r
my_list = list(vect1, vect2, vect3)
lapply(my_list, my_fun)
## [[1]]
##  [1] -1.79382948 -0.27857544  0.69974850 -0.16001649  1.46114230  0.05878708
##  [7] -0.27784983  1.14694509  0.37543251 -1.23178424
## 
## [[2]]
##  [1] -0.1651397 -0.6937513  1.2727663 -1.3566351 -1.2750176 -0.6929653
##  [7]  0.7615772  0.1335316  0.6231392  1.3924948
## 
## [[3]]
##  [1] -0.16168763 -0.08555409  1.59039653  0.69406127  0.32960652 -0.33507181
##  [7]  0.88723740  0.01900385 -0.90726129 -2.03073077
```

### Choosing the Name of a Function

This might seem like a marginal topic, but the choice of names, both for variables and especially for functions, is extremely important. It allows you to:

- Read your code clearly and make it understandable to others;
- Easily organize a group of functions. When you have multiple functions, using appropriate naming allows you to take advantage of RStudio's suggestions more effectively. For example, the [`stringr`](https://stringr.tidyverse.org/) package, which provides tools for working with strings, uses all functions named as `str_`, making it easier to find the desired function.

It is useful to use **verbs** to name functions and **nouns** to name arguments. For example, an appropriate name for our last function might be `center_var()`, while the name of the new vector could be `centered_vect` or `c_vect`. If we find `center_var` in a script, it is immediately clear what that function does, even without looking at the code inside it.

### Simplifying the Number of Operations and Outputs

This is a very important yet varied point. There are different programming styles, so there are no fixed rules or practices better than others. We said that a function is a way to abstract, reuse, and simplify a series of operations. Therefore, we can write very complex functions that receive various inputs, perform multiple operations, and return several outputs. However, it's good practice to write functions that:

- Reduce the number of internal operations
- Provide a single (or limited) output
- Have a limited number of inputs

If we have designed a function with too many outputs, it's too complex, or it has too many inputs, we might consider breaking the function into sub-functions.

Let's take an example with our `center_vect()`. We can think of various alternatives and extensions of this function. For instance, we might want to create a function that either centers or standardizes the vector. We might also choose to center it using the mean or the median. So, we can think of a macro function `trans_vect()` that transforms the vector based on the arguments:


``` r
trans_vect = function(x, what = c("center_mean", "center_median", "standardize")){
  if(match.arg(what) == "center_mean"){
    res = x - mean(x)
  }else if(match.arg(what) == "center_median"){
    res = x - median(x)
  }else if(match.arg(what) == "standardize"){
    res = (x - mean(x))/sd(x)
  }
  return(res)
}

vect = runif(10)
trans_vect(vect, "center_mean")
##  [1] -0.01685312  0.03561925 -0.44988394  0.16989126  0.27071852  0.28677051
##  [7]  0.28406441  0.16317788 -0.29286456 -0.45064020
trans_vect(vect, "center_mean")
##  [1] -0.01685312  0.03561925 -0.44988394  0.16989126  0.27071852  0.28677051
##  [7]  0.28406441  0.16317788 -0.29286456 -0.45064020
trans_vect(vect, "standardize")
##  [1] -0.05708267  0.12064482 -1.52378757  0.57543328  0.91694206  0.97131125
##  [7]  0.96214552  0.55269461 -0.99195224 -1.52634908
```

The function is very clear, but it still contains some weaknesses. The user must insert a string to perform the operation. There are multiple `if` conditions, and the function's purpose might be too broad. A better solution might be to write 3 simpler, more focused, and easier-to-maintain functions:


``` r
center_vect_mean = function(x){
  return(x - mean(x))
}

center_vect_median = function(x){
  return(x - median(x))
}

standardize_vect = function(x){
  return((x - mean(x)) / sd(x))
}

vect = runif(10)
center_vect_mean(vect)
##  [1]  0.006809197  0.196881751 -0.494676807 -0.165383886  0.195228727
##  [6] -0.525544918  0.365640589  0.297810968  0.250922612 -0.127688232
center_vect_median(vect)
##  [1] -0.09420977  0.09586279 -0.59569577 -0.26640285  0.09420977 -0.62656388
##  [7]  0.26462163  0.19679201  0.14990365 -0.22870719
standardize_vect(vect)
##  [1]  0.02121864  0.61351766 -1.54149866 -0.51536485  0.60836655 -1.63768905
##  [7]  1.13939944  0.92803059  0.78191835 -0.39789866
```

This way, the code is much more readable and clear, both inside the functions and when the functions are used. Another alternative would be to group the "centering" functions, specifying whether to use the mean or the median, and separate the standardization.

### Commenting and Documenting

Documentation is perhaps the most important part of writing code. We can classify it into *formal* and *informal* documentation, depending on the purpose. *Formal* documentation is the one we find when using `help(function)` or `?function`. It is standardized and necessary when creating functions in a package that other users need to use. *Informal* documentation is what we put in our scripts and inside functions as `# comment`. Both are very important and allow us to describe the general purpose of the function, the individual arguments, and the steps taken.

## Importing a Function

We have already seen that the `library()` command loads a certain package, making the contained functions available for use. Without the need to create a package, we can still organize our functions effectively. We have two options:

- Write the functions in the same script where they are used.
- Write a separate script and import all the functions it contains.

In this case, it is mainly a matter of style and convenience. Generally:

- If we have many functions, it's better to write them in one or more separate files and then import them at the beginning of the main script.
- If we have few functions, we can keep them in the main script, perhaps in a dedicated section at the start.

In the second case, it's enough to write the function, and it will be saved as an object in the main environment. As for the first scenario, you can use the `source("path/script.R")` function. The `source()` function takes the path to an R script, which will then be executed in the background. So, if your directory is organized like this:

```
- working directory/
|-- main_script.R
|-- functions/
    |-- my_functions.R
```
Where the `my_functions.R` script is a script where all the functions are declared:

```r
fun1 = function(x){
  # do
}

fun2 = function(x){
  # do
}

fun3 = function(x){
  # do
}

...
```

By writing at the beginning of your main script `source("functions/my_functions.R")`, all the functions will be loaded into the working environment.

<!-- TODO print vs cat (aspetto nel return) -->
