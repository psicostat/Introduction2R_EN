# Factors {#factor}




In this chapter, we will look at *factors*, a special type of vector used to store information about a categorical variable (nominal or ordinal). However, before introducing factors, we will describe what attributes of an object are. This will allow us to better understand the functionality of factors later on.

## Object Attributes {#attributes}

In R, objects have what are called *attributes*, which are useful pieces of information about the object itself, a kind of *metadata*. These pieces of information do not interfere with the values contained in the objects nor are they normally shown in the output of an object. However, they are particularly useful in some circumstances and allow us to provide special information associated with a specific object.

Objects have different attributes depending on their type. However, the most commonly used ones include:

- **Class** (`class`) - the class (or type) of an object. This allows us to verify the type of data structure for a particular object.
- **Names** (`names`) - names of the elements of an object. For example, it allows you to assign names to the elements of a vector or to the rows and columns of a matrix or dataframe.
- **Dimension** (`dim`) - the dimension of the object. This attribute is not available for vectors but will be particularly important in the case of matrices and dataframes.

There are specific functions dedicated to evaluating and possibly modifying the attributes of an object. For example:

- `attributes()` - lists all the attributes of an object
- `class()` - accesses the `class` attribute of an object
- `names()` - accesses the `names` attribute of an object
- `dim()` - accesses the `dim` attribute of an object

Let’s now see some uses of attributes with vectors. The attributes in the case of other object types will be addressed in their respective chapters.


### Attributes of a Vector

Let's see how a generic vector initially does not have any attributes.


``` r
my_vector = 1:10

attributes(my_vector)
## NULL
```


#### Class {-}

By executing the `class()` function, however, we can still get the precise type of vector, in this case, `"integer"`.


``` r
class(my_vector)
## [1] "integer"
```

#### Dimension {-}

As anticipated, the `dim` attribute is not available for vectors, though it will become very important in the case of matrices and dataframes. However, an analogous value for the size of a vector is given by its length, which is evaluated with the `length()` function.


```
## NULL
## [1] 10
```

#### Element Names {-}

Initially, the elements of a vector do not have names.


``` r
names(my_vector)
## NULL
```

To set the names of the elements, we need to assign a character vector to `names(vector_name)`, containing the desired names, with the same length as the vector we are renaming.


``` r
names(my_vector) = paste0("Item_", 1:10)
my_vector
##  Item_1  Item_2  Item_3  Item_4  Item_5  Item_6  Item_7  Item_8  Item_9 Item_10 
##       1       2       3       4       5       6       7       8       9      10
```

This process allows us to create what is called a *named vector*. We can see how the element names now appear among the object’s attributes.


```
## $names
##  [1] "Item_1"  "Item_2"  "Item_3"  "Item_4"  "Item_5"  "Item_6"  "Item_7" 
##  [8] "Item_8"  "Item_9"  "Item_10"
```

:::{.trick title="Selecting Named Vectors" data-latex="[Selecting Named Vectors]"}
A particular use of named vectors is selecting values by their element names. Note that for this to work correctly, all elements must have different names.


``` r
my_vector[c("Item_3", "Item_5")]
## Item_3 Item_5 
##      3      5
```

In the case of vectors, this approach is rarely used, but we will see that it becomes very common for selecting variables in a dataframe.
:::

## Factors

Factors are a special type of vector that, through the use of attributes, allow for the efficient storage of categorical variables (nominal or ordinal). The command used to create a factor in R is `factor()` and contains several arguments:


``` r
factor_name = factor(x, levels = , ordered = FALSE)
```

- `x` - the data for our categorical variable
- `levels`- the possible levels of our categorical variable
- `ordered` - logical value indicating whether it is a nominal (`FALSE`) or ordinal (`TRUE`)

For example, we could create the variable `eye_color` to record the eye color of members of a class:

``` r
# Create the data
my_values = rep(c("green", "brown", "blue"), times = 3)
my_values
## [1] "green" "brown" "blue"  "green" "brown" "blue"  "green" "brown" "blue"

# Create the factor
my_factor = factor(my_values)
my_factor
## [1] green brown blue  green brown blue  green brown blue 
## Levels: blue brown green
```

Note that it is not necessary to specify the `levels` argument. The levels of the variable are automatically determined from the data present and ordered alphabetically. However, specifying the levels when creating a factor allows us to define the order of the levels and even include levels not present in the data.

### Factor Structure

Let's now understand the structure of factors and the use of attributes.


``` r
attributes(my_factor)
## $levels
## [1] "blue"  "brown" "green"
## 
## $class
## [1] "factor"
```

We see that the class of the object is `factor` and that there is an additional `levels` attribute where the possible levels of our variable are stored. But now pay attention to what we get when we evaluate the data type contained in the factor and its structure.


``` r
# Data type
typeof(my_factor)
## [1] "integer"

# Structure
str(my_factor)
##  Factor w/ 3 levels "blue","brown",..: 3 2 1 3 2 1 3 2 1
```

We would have expected to get `character`, thinking that the factor stores the values of our variable as strings. Instead, the factor is made of `integer` values, and the output of the `str()` command reports numeric values (along with the variable levels). How do we explain this?

The solution is simple. When creating a factor, R evaluates the levels present, creating the `levels` attribute, and then replaces each element with a numeric value that indicates the level of the variable. Therefore, in our example, the value `1` is associated with the level `"blue"`, the value `2` with `"brown"`, and the value `3` with `"green"`. This approach optimizes memory usage but may initially seem unintuitive and can lead to errors.

:::{.warning title="Beware of Conversion" data-latex="[Beware of Conversion]"}
One of the main errors involves converting a factor back into a regular vector. If we want to get a vector of characters, we can use the `as.character()` function to get the desired result.

``` r
as.character(my_factor)
## [1] "green" "brown" "blue"  "green" "brown" "blue"  "green" "brown" "blue"
```
However, if we want to get a numeric vector, we need to be particularly careful. Consider the following example where we have the years of education of participants in a study. We might perform some analyses considering this variable as categorical and then convert it back to a numeric variable for further analysis. Watch what happens:

``` r
# Create the variable as a factor
school_years = factor(c(11, 8, 4, 8, 11, 4, 11, 8))
school_years
## [1] 11 8  4  8  11 4  11 8 
## Levels: 4 8 11

# Convert to a numeric vector
as.numeric(school_years)
## [1] 3 2 1 2 3 1 3 2
```
Unexpectedly, we do not get the original values (i.e., 4, 8, 11) but different values. These are actually the numeric values R used to associate each element with its corresponding level. To get the correct values, we must use the following command:

``` r
as.numeric(as.character(school_years))
## [1] 11  8  4  8 11  4 11  8
```
This allows us to first replace the values with the correct *labels*, i.e., the levels of the variable, and then convert everything into a numeric vector.

It's important to be very careful in these cases because a potential error might not be immediately apparent.
:::

### Factor Operations

Now that we understand how factors work, let's look at some common operations.


#### Renaming Levels {-}

It is possible to rename the levels of a factor using the `levels()` function, which allows us to access the current levels and possibly replace them.


``` r
my_factor
## [1] green brown blue  green brown blue  green brown blue 
## Levels: blue brown green
# Current levels
levels(my_factor)
## [1] "blue"  "brown" "green"

# Rename the levels (just replace with Italian color names)
levels(my_factor) = c("blu", "marrone", "verde")
my_factor
## [1] verde   marrone blu     verde   marrone blu     verde   marrone blu    
## Levels: blu marrone verde
```

#### Reordering Levels {-}

It is important not to confuse reordering levels with renaming them. In the first case, only the order of the levels is modified, while in the second case, all the actual values of the elements would be changed. Generally, it is preferable to redefine the factor by specifying the `levels` argument.

Let’s look at an example where we collect data regarding drug dosages:


``` r
dosage = factor(rep(c("medium", "low", "high"), times = 2))
dosage
## [1] medium low    high   medium low    high  
## Levels: high low medium
```

Without specifying the `levels` argument, the levels are automatically defined in alphabetical order. Let’s see what happens if, by mistake, we rename the levels instead of correctly reordering them.


``` r
# Create a copy
dosage_wrong = dosage

# ERROR: rename the levels
levels(dosage_wrong) = c("low", "medium", "high")
dosage_wrong
## [1] high   medium low    high   medium low   
## Levels: low medium high
```

Note that this is a serious mistake because by renaming the levels, we have also changed the actual values of the elements. Now the values are all different and nonsensical.

To correctly reorder the levels, we can reuse the `factor()` function, specifying the levels in the desired order.

``` r
dosage = factor(dosage, levels = c("low", "medium", "high"))
dosage
## [1] medium low    high   medium low    high  
## Levels: low medium high
```
This way, we have reordered the levels as we wished without changing the actual values.

#### Extra {-}

Several other operations are possible with factors. For instance, we might want to remove a certain level of a factor:

- if we make a subset of a factor and no longer have values associated with that level
- if we simply want to remove a level and the respective observations

Let's create a factor including a series of values in {`"a"`, `"b"`, `"c"`}; these values will also be automatically set as the levels by the `factor` function:


``` r
# more compact version is: factor(rep(c("a","b","c"),c(7,4,3)))
my_factor = factor(c("a","a","a","a","a","a","a","b","b","b","b","c","c","c"))
my_factor
##  [1] a a a a a a a b b b b c c c
## Levels: a b c
```

Now, let's copy this factor into a new one, but retaining only the values `"a"` and `"b"`. As you can see, even though there are no more `"c"` values, the factor still retains all the initial levels (including `"c"`), because they are part of the attributes that were copied from the original object: 


``` r
# Keep only the values 'a' and 'b'
new_my_factor = my_factor[1:10]
new_my_factor
##  [1] a a a a a a a b b b
## Levels: a b c
```

In these cases, we can use the `droplevels(x, exclude = ...)` function to remove certain levels. We can either specify the particular levels to be removed using the `exclude` argument, or even indicate no specific levels to be excluded. In the latter case, levels associated with no observations in the vector will automatically be excluded: 


``` r
# Explicitly indicate which levels should be removed
droplevels(new_my_factor, exclude="c")
##  [1] a a a a a a a b b b
## Levels: a b

# Indicate no levels to be removed; it will automatically drop levels associated with no observations
droplevels(new_my_factor)
##  [1] a a a a a a a b b b
## Levels: a b
```

If you use `droplevels` to forcibly remove a level that is associated with actual values in the vectors (such as `"a"`), the corresponding values will become `NA`:


``` r
droplevels(new_my_factor, exclude = "a")
##  [1] <NA> <NA> <NA> <NA> <NA> <NA> <NA> b    b    b   
## Levels: b
```

Just as it is possible to remove a level, it is also possible to add a level to a factor simply by using the `factor()` command and specifying all the old levels plus the new one:


``` r
factor(my_factor, levels = c(levels(my_factor), "newlevel"))
##  [1] a a a a a a a b b b b c c c
## Levels: a b c newlevel
```

In this case, we used the `c(old_levels, new_levels)` function to create a vector of new levels to use, including all the previous levels plus the new one(s). Alternatively, we can also use the assignment method `levels(x) =` by specifying a vector of levels:


``` r
# more compact version is: factor(rep(c("a","b","c"),c(7,4,3)))
my_factor = factor(c("a","a","a","a","a","a","a","b","b","b","b","c","c","c"))
levels(my_factor) = c("a","b","c","newlevel")
my_factor
##  [1] a a a a a a a b b b b c c c
## Levels: a b c newlevel
```

You can also combine two factors to obtain a single factor, merging the levels and their respective numeric values. Simply use the `c(fac1, fac2)` command:


``` r
fac1 = factor(c("a","a","a","a","b","b","c"))
fac2 = factor(c("d","d","d"))
c(fac1, fac2)
##  [1] a a a a b b c d d d
## Levels: a b c d
```

<!-- TODO rbind() with new levels  -->

### Ordinal Factors

Finally, let’s look at an example of an ordinal categorical variable. Going back to the previous example regarding drug dosage, it’s clear that there is an ordinal relationship between the various levels of the variable. To create an ordinal variable, we can specify the `ordered = TRUE` argument:


``` r
dosage_ord = factor(dosage, levels = c("low", "medium", "high"), ordered = TRUE)
dosage_ord
## [1] medium low    high   medium low    high  
## Levels: low < medium < high
```

We notice that the ordinal nature of the levels is specified both when the levels are reported and in the object’s class.


``` r
# Nominal categorical variable
class(dosage)
## [1] "factor"

# Ordinal categorical variable
class(dosage_ord)
## [1] "ordered" "factor"
```

:::{.tip title="Variable Type Coding" data-latex="[Variable Type Coding]"}
In R, it’s important to correctly code different variables by specifying their type. By appropriately distinguishing categorical variables (nominal and ordinal) from numerical variables and simple character variables, we gain numerous advantages. In R, many packages and functions adopt specific behaviors depending on the variable type, providing us with outputs and results consistent with the nature of the variable.

Note, for example, how the output of the `summary()` function changes depending on the variable type.

``` r
# Numerical variable
summary(1:15)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     1.0     4.5     8.0     8.0    11.5    15.0

# Categorical variable
summary(dosage)
##    low medium   high 
##      2      2      2
```

This will be particularly important when performing statistical analyses and creating charts and tables.
:::

### Exercises {-}

Complete the following exercises ([solutions](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-08-factors.R)):

1.Create the categorical variable `gender` as defined below:

```
## [1] M F M F M F F F M
## Levels: F M
```
2. Rename the levels of the `genere` variable to `"women"` and `"men"`, respectively.
3. Create the categorical variable `treatment` as defined below:

```
## [1] CBT            Psychoanalysis CBT            Psychoanalysis CBT           
## [6] Psychoanalysis Control        Control        CBT           
## Levels: CBT Control Psychoanalysis
```
4. Correct the 7th and 8th observations in the `treatment` variable to `Medication`.
5. Add the following new observations to the `treatment` variable:

```
## [1] "Medication" "Control"    "Medication"
```
    
    
    
