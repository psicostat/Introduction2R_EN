# Conditional Programming {#conditionals}



One of the main constructs of programming is conditional expressions. The simple idea behind this is to perform certain operations or execute operations in a particular way depending on certain *conditions*. Conditions are just expressions that always return a *boolean* value, that is, either `TRUE` or `FALSE`.

The classic example is the umbrella scenario: imagine you're writing code for a video game and you've written a function to make your character take and open the umbrella. Clearly, to make everything believable, you should execute this operation only when needed, that is, when it's raining. In programming terms, you must first check a certain condition (the rain) and then execute (or not execute) a series of operations accordingly.

## Conditional Structures

There are several possibilities in R, but the logic of executing operations only when certain conditions are met is always the same. Figure \@ref(fig:plot-if-chart) represents the general structure of a conditional control flow.

### if


```r
knitr::include_graphics("images/if_chart.png")
```

<div class="figure" style="text-align: center">
<img src="images/if_chart.png" alt="'if' chart" width="65%" />
<p class="caption">(\#fig:plot-if-chart)'if' chart</p>
</div>

#### 'if' Structure {-}

Per scrivere la struttura condizionale della Figura \@ref(fig:plot-if-chart) si usa la seguente sintassi in R:


```r
  ...
  if (<test>) {
     <code-to-execute>
  }
  ...
```

#### Example {-}

- Single 'if'


```r
my_function = function(value){
  if(value > 0){
    cat("The value is greater than 0\n")
  }
  cat("End of function\n")
}

my_function(5)
## The value is greater than 0
## End of function
my_function(-5)
## End of function
```

- Multiple 'if'

```r
my_function = function(value){
  if(value > 0){
    cat("The value is greater than 0\n")
  }
  if(value > 10){
    cat("The value is greater than 10\n")
  }
  cat("End of function\n")
}

my_function(5)
## The value is greater than 0
## End of function
my_function(15)
## The value is greater than 0
## The value is greater than 10
## End of function
my_function(-5)
## End of function
```


### if...else

Using a simple `if` might not be sufficient in some situations. This is because an `if` can be seen as a temporary deviation from the main script (clearly illustrated in Figure \@ref(fig:plot-if-chart)) that is taken only if a condition is true; otherwise, the script continues. If you want a more "symmetric" structure, you can execute some operations if the condition is true (`if`) and others for all other scenarios (`else`). Figure \@ref(fig:plot-ifelse-chart) clearly shows this different structure in the flow.


```r
knitr::include_graphics("images/ifelse_chart.png")
```

<div class="figure" style="text-align: center">
<img src="images/ifelse_chart.png" alt="'if...else' chart" width="65%" />
<p class="caption">(\#fig:plot-ifelse-chart)'if...else' chart</p>
</div>

#### 'if...else' structure {-}

In R, this is implemented as follows:


```r
  ...
  if (<test>) {
    <code-to-execute>
  } else {
    <code-to-execute>
  }
  ...
```

#### Example {-}

- single 'if...else'

```r
my_function = function(value){
  if(value >= 0){
    cat("The value is greater than or equal to 0\n")
  } else {
    cat("The value is less than 0\n")
  }
  cat("End of function\n")
}

my_function(5)
## The value is greater than or equal to 0
## End of function
my_function(-5)
## The value is less than 0
## End of function
```

- multiple 'if...else'

```r
my_function = function(value){
  if(value > 0){
    cat("The value is greater than 0\n")
  } else if (value > 10){
    cat("The value is greater than 10\n")
  } else {
    cat("The value is less than or equal to 0\n")
  }
  cat("End of function\n")
}

my_function(5)
## The value is greater than 0
## End of function
my_function(15)
## The value is greater than 0
## End of function
my_function(-5)
## The value is less than or equal to 0
## End of function
```

It is important to understand the difference between using multiple `if` and `else if` compared to using a simple `else`. If you want to specify a **finite** set of alternatives, the best and clearest choice is to use `else if` because, unlike `else`, it requires you to specify the condition. If, on the other hand, you're only interested in certain conditions while applying the same operation to everything else, you can conclude your flow with an `else`.

### Nested

In addition to chaining a series of `if` and `else if`, you can nest one or more `if` inside another. This allows you to check conditions that depend on the previous check and thus cannot be executed in series.


```r
knitr::include_graphics("images/ifnested.png")
```

<div class="figure" style="text-align: center">
<img src="images/ifnested.png" alt="Nested 'if'" width="65%" />
<p class="caption">(\#fig:plot-ifnested)Nested 'if'</p>
</div>

#### Nested 'if' structure {-}


```r
  ...
  if (<test>) {
    if(<test>) {
      <code-to-execute>
    } else {
      <code-to-execute>
    }
  }
  ...
```

#### Example {-}


```r
my_function = function(value){
  if(value > 0){
    if(value > 10) {
      cat("The value is greater than 10\n")
    } else {
      cat("The value is greater than 0\n")
    }
  } else {
    cat("The value is less than or equal to 0\n")
  }
  cat("End of function\n")
}

my_function(5)
## The value is greater than 0
## End of function
my_function(15)
## The value is greater than 10
## End of function
my_function(-5)
## The value is less than or equal to 0
## End of function
```

### Exercises {-}

Complete the following exercises:
  
  1. Define a function to assign a grade based on the percentage of correct answers (*score*) using the following criteria:
  
    - score < .55 - insufficient
    - .55 <= score < .65 - sufficient
    - .65 <= score < .75 - good
    - .75 <= score < .85 - very good
    - .85 <= score - excellent
  2. Define a function that determines if a number is even or odd.
  3. Define a function that determines if a number is a multiple of 3, 4, or 5.
  4. Define a function to calculate the monthly salary considering overtime, which is paid 1.5 times the normal hourly wage. Use the parameters: hours worked in the month, hourly wage, and the work hour threshold beyond which overtime is counted.

## Other Conditional Operators

### switch

The `switch` operator is a useful alternative when we want to execute a portion of code conditionally on input without using a series of `if`.

#### `switch` structure {-}


```r
switch(my_value,
       case1 = action1,
       case2 = action2,
       ... )
```

In this case, if the input value (`my_value`) matches one of the cases considered (for example `case1`), the corresponding code (`action1`) is executed.

There are a few rules to consider when using a `switch` statement:

- If the input value is a string, R will look for a match like `input == argument`.
- If more than one match is found, the first one is used.
- There's no option to insert a default value.
- If no match is found, `NULL` is returned. However, by inserting a `case` without a corresponding value, it will be used instead of `NULL`.

#### Example {-}


```r
my_colors = function(color){
  new_color = switch(color,
       "red" = "red",
       "blue" = "blue",
       "green" = ,
       "aqua green" = "green",
       "Not Found") # value not found
  return(new_color)
}

my_colors("blue")
## [1] "blue"
my_colors("green")
## [1] "green"
my_colors("orange")
## [1] "Not Found"
```

### ifelse

The `if`, `else`, and `else if` statements work only for a single value. In other words, you can't test the same condition on a series of elements. In the next chapter, we will discuss iterative programming, which allows you to repeat a series of operations. However, using the `ifelse()` function, you can implement a vectorized version of conditional operations. The structure is as follows:


```r
ifelse(test = , yes = , no = )
```

Where:

- `test` is the condition to evaluate, corresponding to what was previously between parentheses in `if(test){...}`.
- `yes` is the code executed if the condition is `TRUE`.
- `no` is the code executed if the condition is `FALSE`.

#### Example {-}

Imagine we have a vector of numbers representing ages, and we want to execute something based on whether the age is greater than or less than 18 years, for example, simply displaying "adult" or "minor". Using a simple `if`, we see:


```r
age = c(18, 19, 11, 10, 23, 55, 33, 26, 10)
if(age < 18){
    print("Minor")
}else{
    print("Adult")
}
## Error in if (age < 18) {: the condition has length > 1
```

An error is incurred because `age` is not a single value, and therefore only the first value is used. This demonstrates that `if` doesn't work on a list of elements. Instead, using `ifelse`:


```r
age = c(18, 19, 11, 10, 23, 55, 33, 26, 10)
ifelse(age < 18, yes = print("Minor"), no = print("Adult"))
## [1] "Minor"
## [1] "Adult"
## [1] "Adult" "Adult" "Minor" "Minor" "Adult" "Adult" "Adult" "Adult" "Minor"
```

In this case, the idea is to execute the previous code for each value in our input vector. This is possible because the < operation is vectorized.
