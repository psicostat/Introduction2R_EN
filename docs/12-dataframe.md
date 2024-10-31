# Dataframe {#dataframe}



*Dataframes* are one of the most commonly used objects in R for representing data. Similar to a `matrix`, a `dataframe` is a **two-dimensional** structure where data is organized in rows and columns. It can be helpful to think of a data frame just like a regular table you might create in a spreadsheet (e.g., Excel) where you can enter your data. The term "data" here is intentionally broad because, unlike matrices, data frames can contain different types of data within the same object (e.g., *names*, *dates*, and *numbers*).

The basic structure of a `dataframe` is thus the same as a matrix, but it allows us to include various data types in the same object, such as characters and numerical values. This enables us to store all the features of statistical units (e.g., numerical, categorical, nominal variables, etc.) that we aim to analyze later. A crucial point is that dataframes are designed to handle complex and heterogeneous data, typical in real data analysis. If you use other programming languages geared toward data analysis (e.g., Matlab), you'll notice the lack of a powerful and intuitive object like the `dataframe`.

Generally, in a `dataframe`, rows represent statistical units (e.g., people or observations), and columns represent variables, which are properties measured on those units. However, there are two main dataframe formats depending on how the data is organized: **wide** dataframes and **long** dataframes. Let's evaluate the difference between the two formats by considering data where, for each subject, we measure age, gender, and responses to three items in a questionnaire.

#### Wide Dataframe {-}

In the **wide** format, each row of the `dataframe` represents a subject, and each of their responses or measured variables is reported in a different column. Even repeated responses to the same type of variable, such as questionnaire items, experimental trials, or the same variable measured at multiple time points are presented in different columns, so that whatever has been collected for a single participant is reported in one and a single row. The wide format is arguably the most familiar to researchers who routinely perform analyses with the SPSS software. In Table \@ref(tab:table-wide-db), some example data is presented in wide format: notice how responses to different items are reported in multiple columns.

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-wide-db)(\#tab:table-wide-db)Dataframe in wide format</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Id </th>
   <th style="text-align:center;"> age </th>
   <th style="text-align:center;"> gender </th>
   <th style="text-align:center;"> item_1 </th>
   <th style="text-align:center;"> item_2 </th>
   <th style="text-align:center;"> item_3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> subj_1 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 0 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_2 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_3 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
</tbody>
</table>



We see that each subject is identified by a code in the *Id* variable, and their responses to the three items are reported in three different variables *item_1*, *item_2*, and *item_3*.

#### Long Dataframe {-}

In the **long** format, each row represents a single observation. Therefore, the data for each subject is spread across multiple rows, and variables that don’t change across observations are repeated. In Table \@ref(tab:table-long-db), the example data is presented in long format.

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-long-db)(\#tab:table-long-db)Dataframe in long format</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Id </th>
   <th style="text-align:center;"> age </th>
   <th style="text-align:center;"> gender </th>
   <th style="text-align:center;"> item </th>
   <th style="text-align:center;"> response </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> subj_1 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_1 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_1 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_2 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_2 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_2 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_3 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_3 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_3 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
</tbody>
</table>



We observe that each subject's responses are spread across multiple rows. The characteristics that do not vary are repeated in each row (*Id*, *age*, and *gender*), while the responses to the items are recorded using two columns: *item*, which represents the item number, and response, which records the subject’s actual response to that specific item.

:::{.tip title="Long or Wide?" data-latex="[Long or Wide?]"}
Long and wide data formats have different properties, especially in terms of usage. The type of data and the final result are the same; however, some software or R packages work only with datasets organized in a certain way (e.g., `lme4` package for fitting mixed-models and `ggplot2` for data visualization mostly require **long** format dataframes, while `lavaan` package for structural equation modeling mostly require **wide** format dataframes.)

There isn’t a "correct" or "incorrect" format; it depends on the type of analysis and the software or package you're using. Some operations or analyses require the dataset in **long** format, while others require it in **wide** format.

However, it’s advisable to become accustomed to thinking in **long** format because most modern data analysis and visualization packages require the data in this structure. There are also functions for quickly switching from one format to another (e.g., the `reshape()` function).
:::

Note that in the previous examples, we used both numeric and character columns. This wasn’t possible with matrices. However, keep in mind that, just like matrices, dataframes require that all columns (variables) have the same number of elements.

Now we’ll see how to create dataframes in R, how to perform common selection operations, and describe some simple manipulations with dataframes. As we’ll see, there are many similarities between using dataframes and matrices. When necessary, we’ll refer to the previous chapter to highlight common aspects and differences between these two data structures.

## Creating a dataframe

In most cases, you will probably upload existing data (e.g., from a `.csv` file containing some collected experimental data) rather than creating a dataframe from scratch in R. However, let's now see how to create a new dataframe. The command to create a dataframe is `data.frame()`:


``` r
nome_df = data.frame(
  variable1 = c(...),
  variable2 = c(...),
  ...)
```

Creating a dataframe is slightly different from matrices. Intuitively, it's like combining several columns (where one may contain names, another dates, and so on) rather than inserting values by row or column as in matrices. In fact, to create a `dataframe`, you need to specify the columns one by one, indicating `column_name = values` within the `data.frame()` command. Let's see an example in R:


``` r
my_data = data.frame(
  Id = c(1:5),
  names = c("Alice", "Bruno", "Carla", "Diego", "Elisa"),
  gender = factor(c("F","M","F", "M", "F")),
  age = c(22, 25, 23, 22, 24),
  faculty = factor(c("Psychology", "Engineering", "Medicine", "Arts", "Psychology"))
)

my_data
##   Id names gender age     faculty
## 1  1 Alice      F  22  Psychology
## 2  2 Bruno      M  25 Engineering
## 3  3 Carla      F  23    Medicine
## 4  4 Diego      M  22        Arts
## 5  5 Elisa      F  24  Psychology
```

In this case, we’ve created a hypothetical dataframe where each row represents a subject, and each column represents a certain characteristic of that subject, like gender, age, and so on.

:::{.tip title="ID" data-latex="[ID]"}
It's always recommended to define a column (e.g., `Id`) where you assign a unique identifier to each subject. This allows you to identify them without risking errors. For example, using a name (or even first and last names) may not be ideal because multiple people could have the same name, making it difficult to distinguish between them. While this may not seem strictly needed when using *wide* dataframes, as different rows always represent different individuals, that becomes crucial when using *long* dataframes, as multiple rows may or may not represent data from the same individual.
:::

:::{.warning title="stringsAsFactors" data-latex="[stringsAsFactors]"}
A character variable within a DataFrame is considered by default as a simple sequence of characters. You can specify the argument `stringsAsFactors = TRUE` to automatically convert all character variables to categorical variables (see Chapter \@ref(factor)

Note that the default behavior depends on the version of R. Versions prior to R 4.0 had `stringsAsFactors = TRUE` by default, while from R 4.0 onwards, the default is `stringsAsFactors = FALSE`. So, pay attention when using code written before version 4.0.
:::

### Exercises {-}

Perform the following exercises ([solutions](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-10-dataframe.R)):

1. Create the `data_wide` dataframe shown in Table \@ref(tab:table-wide-db).
2. Create the `data_long` dataframe shown in Table \@ref(tab:table-long-db).

## Selecting Elements {#sel-df}

To select one or more values from a dataframe, you can use row and column indices within square brackets, similar to matrices:


``` r
dataframe_name[<row-index>, <column-index>]
```

Remember that the order `[<row-index>, <column-index>]` is fixed and must be followed for the selection to work correctly. You can perform various types of selections depending on your needs, using the same procedures seen for matrices. For example, using the `my_data` dataframe created earlier, we can select:




``` r
my_data
##    Id    names gender age     faculty
## 1   1    Alice      F  22  Psychology
## 2   2    Bruno      M  25 Engineering
## 3   3    Carla      F  23    Medicine
## 4   4    Diego      M  22        Arts
## 5   5    Elisa      F  24  Psychology
## 6   6 Fabrizio      M  35        Arts
## 7   7   Gloria      F  26 Engineering
## 8   8   Herman      M  20  Psychology
## 9   9    Irene      F  23  Statistics
## 10 10     Luca      M  22 Engineering

# Value in 3rd row and 2nd column
my_data[3,4]
## [1] 23

# All variables of the 1st and 3rd rows
my_data[c(2,3), ]
##   Id names gender age     faculty
## 2  2 Bruno      M  25 Engineering
## 3  3 Carla      F  23    Medicine

# All values of the 5th variable
my_data[ , 5]
##  [1] Psychology  Engineering Medicine    Arts        Psychology  Arts       
##  [7] Engineering Psychology  Statistics  Engineering
## Levels: Arts Engineering Medicine Psychology Statistics

# Values of the 2nd and 4th variables for the 3rd and 5th rows
my_data[c(3,5), c(2,4)]
##   names age
## 3 Carla  23
## 5 Elisa  24
```

However, when working with dataframes, it's more common to refer to the column names and use logical conditions to select values of interest. 

#### Selecting Columns by Variable Names {-} 

One significant difference between matrices and dataframes is that you can access columns using the `$` operator and the column name, using the following syntax:


``` r
dataframe_name$variable_name
```

This allows you to access that specific column directly without using indices and square brackets. For example:


``` r
# Select the "names" variable
my_data$names
##  [1] "Alice"    "Bruno"    "Carla"    "Diego"    "Elisa"    "Fabrizio"
##  [7] "Gloria"   "Herman"   "Irene"    "Luca"

# Select the "faculty" variable
my_data$faculty
##  [1] Psychology  Engineering Medicine    Arts        Psychology  Arts       
##  [7] Engineering Psychology  Statistics  Engineering
## Levels: Arts Engineering Medicine Psychology Statistics
```

Alternatively, you can use the usual square bracket selection method by specifying the column names instead of column indices. This allows you to select multiple variables at once. For example:


``` r
# Select only the "names" variable
my_data[ , "names"]
##  [1] "Alice"    "Bruno"    "Carla"    "Diego"    "Elisa"    "Fabrizio"
##  [7] "Gloria"   "Herman"   "Irene"    "Luca"

# Select the "names", "gender", and "faculty" variables
my_data[ , c("names", "gender", "faculty")]
##       names gender     faculty
## 1     Alice      F  Psychology
## 2     Bruno      M Engineering
## 3     Carla      F    Medicine
## 4     Diego      M        Arts
## 5     Elisa      F  Psychology
## 6  Fabrizio      M        Arts
## 7    Gloria      F Engineering
## 8    Herman      M  Psychology
## 9     Irene      F  Statistics
## 10     Luca      M Engineering
```

Note that the variable names must be provided as strings.

#### Selecting Rows with Logical Conditions {-}

We’ve seen earlier how to construct logical propositions to select only values that meet a certain condition in the case of vectors and matrices. Now, this function becomes particularly useful as it allows us to *query* the dataframe in a simple and intuitive way. By using a logical condition, we can *filter* the observations that satisfy a given condition and retrieve only the information of interest.

In the canonical syntax `[<row-index>, <column-index>]`, the row indices are replaced with a logical condition to filter the rows, and the column indices are replaced with the names of the variables of interest. We use the following syntax:


``` r
dataframe_name[<logical_condition_rows>, <variable_names>]
```

Here are some examples of selection:


``` r
# All data for "Diego" (Id == 4)
my_data[my_data$Id == 4 , ]
##   Id names gender age faculty
## 4  4 Diego      M  22    Arts

# All data for females
my_data[my_data$gender == "F" , ]
##   Id  names gender age     faculty
## 1  1  Alice      F  22  Psychology
## 3  3  Carla      F  23    Medicine
## 5  5  Elisa      F  24  Psychology
## 7  7 Gloria      F  26 Engineering
## 9  9  Irene      F  23  Statistics

# Faculties of subjects older than 24 years
my_data[my_data$age > 24 , c("age", "faculty")]
##   age     faculty
## 2  25 Engineering
## 6  35        Arts
## 7  26 Engineering
```

Note that when defining a logical condition using the dataframe's variables, it’s still necessary to include the dataframe name. In the previous example, we would have encountered an error by simply using `age > 24`, as this would refer to the object `age` (which doesn’t exist), not the `age` variable contained in `my_data`.


``` r
my_data[age > 24 , c("age", "faculty")]
## Error: object 'age' not found
```

Similarly to what we saw with vectors, using the condition `my_data$age > 24` returns a vector of `TRUE` and `FALSE` values depending on whether the condition is met or not.

By using logical operators **AND** (`&`), **OR** (`|`), and **NOT** (`!`), we can combine multiple logical operations to create more complex, yet still intuitive, indexing queries. For example, to select "subjects between 20 and 25 years old enrolled in psychology," we would write:


``` r
my_data[my_data$age>=20 & my_data$age<=25 & my_data$faculty=="Psychology" , ]
##   Id  names gender age    faculty
## 1  1  Alice      F  22 Psychology
## 5  5  Elisa      F  24 Psychology
## 8  8 Herman      M  20 Psychology
```

By using this indexing method, we can appreciate the true power of dataframes. We now have a very simple and intuitive method for working with complex data structures that contain different data types.

:::{.design title="Selection Output" data-latex="[Selection Output]"}
Two important aspects regarding the result of a selection are the type of output obtained and how to save it.

#### Output Type {-}

Similarly to matrices, selection commands do not always return the same type of object. When we select a single variable, the result is a vector, while selecting two or more variables returns a dataframe.


``` r
# Single variable
class(my_data$age)
## [1] "numeric"

# Multiple variables
class(my_data[ , c("names", "age")])
## [1] "data.frame"
```

#### Saving the Selection {-}

As with other types of objects, selection operations do not modify the original object. Therefore, if you wish to keep the changes, you need to save the result of the selection. It’s advisable to create a new object and not overwrite the original one, as this will allow you to make new selections or operations on the original data. It's good practice to always keep one copy of the dataframe containing the original version of the data.
:::

### Advanced Selection Uses

Let's now look at some advanced uses of selecting elements from a dataframe.

#### Modifying Elements {-}

Similar to other objects, we can modify values by selecting the old value in the dataframe and using the `=` (or `<-`) operator to assign the new value.


``` r
my_data[1:5 , ]
##   Id names gender age     faculty
## 1  1 Alice      F  22  Psychology
## 2  2 Bruno      M  25 Engineering
## 3  3 Carla      F  23    Medicine
## 4  4 Diego      M  22        Arts
## 5  5 Elisa      F  24  Psychology

# Replace the name in the 4th row with "Davide"
my_data[4 , "names"] = "Davide"

my_data[1:5 , ]
##   Id  names gender age     faculty
## 1  1  Alice      F  22  Psychology
## 2  2  Bruno      M  25 Engineering
## 3  3  Carla      F  23    Medicine
## 4  4 Davide      M  22        Arts
## 5  5  Elisa      F  24  Psychology
```


#### Remove Rows or Columns {-}

Similarly to matrices, to remove rows (or columns) from a `dataframe`, you need to indicate the row (or column) indices to remove within square brackets, preceded by the `-` (*minus*) operator.

``` r
# Remove the first 5 observations/rows
my_data[-c(1:5) , ]
##    Id    names gender age     faculty
## 6   6 Fabrizio      M  35        Arts
## 7   7   Gloria      F  26 Engineering
## 8   8   Herman      M  20  Psychology
## 9   9    Irene      F  23  Statistics
## 10 10     Luca      M  22 Engineering

# Remove the third column
my_data[ , -3]
##    Id    names age     faculty
## 1   1    Alice  22  Psychology
## 2   2    Bruno  25 Engineering
## 3   3    Carla  23    Medicine
## 4   4   Davide  22        Arts
## 5   5    Elisa  24  Psychology
## 6   6 Fabrizio  35        Arts
## 7   7   Gloria  26 Engineering
## 8   8   Herman  20  Psychology
## 9   9    Irene  23  Statistics
## 10 10     Luca  22 Engineering
```

You can also exclude (and in a sense remove) information using logical operators such as *NOT* (i.e., `!`) and *not equal to* (`!=`). In the following examples, only rows where the `faculty` information is *not equal to* (i.e., *different from*) `Psychology` are kept (so, observations associated with `Psychology` are practically removed from the dataframe): 


``` r
# Select everything except psychology students
my_data[my_data$faculty != "Psychology" , ]
##    Id    names gender age     faculty
## 2   2    Bruno      M  25 Engineering
## 3   3    Carla      F  23    Medicine
## 4   4   Davide      M  22        Arts
## 6   6 Fabrizio      M  35        Arts
## 7   7   Gloria      F  26 Engineering
## 9   9    Irene      F  23  Statistics
## 10 10     Luca      M  22 Engineering
```

Removing multiple categories, such as both `Psychology` and `Statistics` while keeping the rest may be a bit more difficult. Here are two possible methods, the second one may be more efficient when writing: 

``` r
# method 1 : keep rows where "faculty" is not "Psychology" AND not "Statistics"
my_data[my_data$faculty != "Psychology" & my_data$faculty != "Statistics" , ]
##    Id    names gender age     faculty
## 2   2    Bruno      M  25 Engineering
## 3   3    Carla      F  23    Medicine
## 4   4   Davide      M  22        Arts
## 6   6 Fabrizio      M  35        Arts
## 7   7   Gloria      F  26 Engineering
## 10 10     Luca      M  22 Engineering

# method 2 : keep all rows but NOT those in the vector c("Psychology", "Statistics")
my_data[!my_data$faculty %in% c("Psychology","Statistics") , ]
##    Id    names gender age     faculty
## 2   2    Bruno      M  25 Engineering
## 3   3    Carla      F  23    Medicine
## 4   4   Davide      M  22        Arts
## 6   6 Fabrizio      M  35        Arts
## 7   7   Gloria      F  26 Engineering
## 10 10     Luca      M  22 Engineering
```

A strategy similar to the second method shown just above could be used for removing multiple columns by names. Actually, the `-` (*minus*) will not work when listing columns by name. Let's say we want to visualize the `my_data` dataframe but removing the columns related to `gender` and `age`. We may proceed as follow:

``` r
# Select all column names that are NOT in the vector c("gender","age")
my_data[ , !colnames(my_data) %in% c("gender","age")]
##    Id    names     faculty
## 1   1    Alice  Psychology
## 2   2    Bruno Engineering
## 3   3    Carla    Medicine
## 4   4   Davide        Arts
## 5   5    Elisa  Psychology
## 6   6 Fabrizio        Arts
## 7   7   Gloria Engineering
## 8   8   Herman  Psychology
## 9   9    Irene  Statistics
## 10 10     Luca Engineering
```

Note that the "removal" operation is actually a "selection" operation. Therefore, if you want to keep the changes, you need to save the result.

:::{.warning title="Be Careful When Removing" data-latex="[Be Careful When Removing]"}
Using the `-` operator is somewhat risky, especially if the object created (or overwritten) is then used in other operations. Removing information, unless strictly necessary, is not a good practice. If you need to select part of the data, it's always better to create a new dataframe (or a new object in general) while keeping a version of the original data available.
:::

### Exercises {-}

Referring to the `data_long` and `data_wide` dataframes created earlier, complete the following exercises
([solutions](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-10-dataframe.R)): 

1. Using **numeric indices** for rows and columns, select the data for the subject `subj_2` regarding the `item` and `response` variables from the `data_long` dataframe.
2. Perform the same selection as the previous exercise, but this time use a logical condition for the row indices and specify the column names directly.
3. In the `data_wide` dataframe, select the `Id` and `gender` variables for subjects who responded with 1 to the `item_1` variable.
4. In the `data_long` dataframe, select only the data for girls older than 20 years.
5. Remove the observations regarding `subj_2` and the `"gender"` variable from the `data_long` dataframe.

## Functions and Operations

Now, let's look at some commonly used functions and operations performed with dataframes (see Table \@ref(tab:table-df-functions)).

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-df-functions)(\#tab:table-df-functions)Functions and operations with dataframes</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Function </th>
   <th style="text-align:left;"> Description </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nrow(nome_df) </td>
   <td style="text-align:left;"> Number of observations in the dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ncol(nome_df) </td>
   <td style="text-align:left;"> Number of variables in the dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> colnames(nome_df) </td>
   <td style="text-align:left;"> Column names of the dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rownames(nome_df) </td>
   <td style="text-align:left;"> Row names of the dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nome_df &amp;lt;-&lt;br&gt; cbind(nome_df, dati) &lt;br&gt; nome_df$nome_var &amp;lt;-&lt;br&gt; dati </td>
   <td style="text-align:left;"> Add a new variable to the dataframe (must have the same number of rows) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nome_df &amp;lt;- rbind(nome_df, dati) </td>
   <td style="text-align:left;"> Add observations (new data must match the structure of the dataframe) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> head(nome_df) </td>
   <td style="text-align:left;"> First rows of the dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> tail(nome_df) </td>
   <td style="text-align:left;"> Last rows of the dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> str(nome_df) </td>
   <td style="text-align:left;"> Structure of the dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> summary(nome_df) </td>
   <td style="text-align:left;"> Summary of the dataframe </td>
  </tr>
</tbody>
</table>



We will now describe in detail some particular uses, considering an example of a reduced version of the `my_data` dataframe created earlier.


``` r
data_short = my_data[1:5, ]
data_short
##   Id  names gender age     faculty
## 1  1  Alice      F  22  Psychology
## 2  2  Bruno      M  25 Engineering
## 3  3  Carla      F  23    Medicine
## 4  4 Davide      M  22        Arts
## 5  5  Elisa      F  24  Psychology
```

### Attributes of a Dataframe

We saw in Chapter \@ref(attributes) that objects in R possess what are called *attributes*, useful information about the object itself, akin to *metadata*. We will now, similarly to matrices, evaluate the dimensions of a dataframe and the names of its rows and columns.

#### Dimensions {-}

Recall that a dataframe is a **two-dimensional** object consisting of rows and columns. To obtain the number of rows and columns in a dataframe, we can use the `nrow()` and `ncol()` functions, respectively.


``` r
# Number of rows
nrow(my_data)
## [1] 10

# Number of columns
ncol(my_data)
## [1] 5
```

Alternatively, as with matrices, we can use the `dim()` function, which returns a vector with two values: the first representing the number of rows and the second the number of columns.

#### Row and Column Names {-}

Similarly to matrices, you can access the row and column names using the `rownames()` and `colnames()` functions, respectively. By default, dataframes require names only for the columns, while rows are assigned names based on their row indices. However, it's possible to name rows with arbitrary values, although this is rarely used.


``` r
# Check the current names
rownames(data_short)
## [1] "1" "2" "3" "4" "5"
colnames(data_short)
## [1] "Id"      "names"   "gender"  "age"     "faculty"
```

To set row and/or column names, assign a character vector of the same length as the dimension you're renaming to `rownames(dataframe_name)` or `colnames(dataframe_name)`.


``` r
# Assign names to the rows
rownames(data_short) = paste0("Subj_", 1:nrow(data_short))

# Assign names to the columns
colnames(data_short) = c("Id", "Name", "Gender", "Age", "Faculty")

data_short
##        Id   Name Gender Age     Faculty
## Subj_1  1  Alice      F  22  Psychology
## Subj_2  2  Bruno      M  25 Engineering
## Subj_3  3  Carla      F  23    Medicine
## Subj_4  4 Davide      M  22        Arts
## Subj_5  5  Elisa      F  24  Psychology
```

Finally, note that the `names()` function for dataframes is analogous to `colnames()`, and you can use `NULL` to remove, for example, row names.

``` r
names(data_short)
## [1] "Id"      "Name"    "Gender"  "Age"     "Faculty"

rownames(data_short) = NULL
data_short
##   Id   Name Gender Age     Faculty
## 1  1  Alice      F  22  Psychology
## 2  2  Bruno      M  25 Engineering
## 3  3  Carla      F  23    Medicine
## 4  4 Davide      M  22        Arts
## 5  5  Elisa      F  24  Psychology
```


### Merging Dataframes

Similarly to matrices, you can merge multiple dataframes using the `cbind()` and `rbind()` functions, with the same dimensionality requirements regarding rows and columns. However, for dataframes, you can also create a new column using the `$` operator. Let's now describe these uses in detail.

#### `dataframe$name = new_var` {-}

With the syntax `dataframe$name = new_var`, we add a new column named `name` to the dataframe, taking values from `new_var`. This new variable must have the same number of values as there are rows in the dataframe.


``` r
# Add the "average" column
data_short$Average = c(27.5, 23.6, 28.3, 29.2, 24.8)

# note that this is the same as:
average_grades = c(27.5, 23.6, 28.3, 29.2, 24.8)
data_short$Average = average_grades

data_short
##   Id   Name Gender Age     Faculty Average
## 1  1  Alice      F  22  Psychology    27.5
## 2  2  Bruno      M  25 Engineering    23.6
## 3  3  Carla      F  23    Medicine    28.3
## 4  4 Davide      M  22        Arts    29.2
## 5  5  Elisa      F  24  Psychology    24.8
```

#### `cbind()` {-}

With the `cbind()` function, we can add one or more variables to our dataframe. Note that, unlike using the `$` operator, the result is not automatically saved; it must be assigned to a new object `dataframe = cbind(dataframe, new_var)`. In this case, the column name will be new_var. If we want to rename the column, we can use the syntax `cbind(dataframe, "name" = new_var)` or name the object directly:


``` r
# Add the "number_of_exams" variable
number_of_exams = c(12, 14, 13, 10, 8)

cbind(data_short, number_of_exams) # without specifying the name
##   Id   Name Gender Age     Faculty Average number_of_exams
## 1  1  Alice      F  22  Psychology    27.5              12
## 2  2  Bruno      M  25 Engineering    23.6              14
## 3  3  Carla      F  23    Medicine    28.3              13
## 4  4 Davide      M  22        Arts    29.2              10
## 5  5  Elisa      F  24  Psychology    24.8               8

cbind(data_short, "N_exams" = number_of_exams) # specifying the name
##   Id   Name Gender Age     Faculty Average N_exams
## 1  1  Alice      F  22  Psychology    27.5      12
## 2  2  Bruno      M  25 Engineering    23.6      14
## 3  3  Carla      F  23    Medicine    28.3      13
## 4  4 Davide      M  22        Arts    29.2      10
## 5  5  Elisa      F  24  Psychology    24.8       8
```

Again, the new variable must have the same number of values as there are rows in the dataframe.

#### `rbind()` {-}

Adding rows to a dataframe is slightly more complex. You may need to do this for different reasons. For example, you may have collected experimental data from different participants in different `.csv` files, and now you have to import and combine them in a single dataframe including all data from all participants. Unlike matrices, which by default do not have column names and contain only numbers or strings, to merge two dataframes by row, they must have the same structure, meaning:

* The same number of columns (as with matrices)
* The same column names

In the following example, we simply add one single row to an existing dataframe: 

``` r
data_short
##   Id   Name Gender Age     Faculty Average
## 1  1  Alice      F  22  Psychology    27.5
## 2  2  Bruno      M  25 Engineering    23.6
## 3  3  Carla      F  23    Medicine    28.3
## 4  4 Davide      M  22        Arts    29.2
## 5  5  Elisa      F  24  Psychology    24.8

# New data with the same columns, but named differently
new_data = data.frame(
  Id = 6,
  Name = "Marta",
  Sex = "F",      # note "Sex" instead of "Gender"
  Age = 44,
  Faculty = "Philosophy",
  Average = 28.7
)

new_data
##   Id  Name Sex Age    Faculty Average
## 1  6 Marta   F  44 Philosophy    28.7

rbind(data_short, new_data) # Error!
## Error in match.names(clabs, names(xi)): names do not match previous names

# New data with the same columns having the exact same names
new_data = data.frame(
  Id = 6,
  Name = "Marta",
  Gender = "F", 
  Age = 44,
  Faculty = "Philosophy",
  Average = 28.7
)

rbind(data_short, new_data)
##   Id   Name Gender Age     Faculty Average
## 1  1  Alice      F  22  Psychology    27.5
## 2  2  Bruno      M  25 Engineering    23.6
## 3  3  Carla      F  23    Medicine    28.3
## 4  4 Davide      M  22        Arts    29.2
## 5  5  Elisa      F  24  Psychology    24.8
## 6  6  Marta      F  44  Philosophy    28.7
```

Again, you need to save the result to keep the changes (which we have not done in the above example).

### Dataframe Information

Finally, let’s look at some very common functions used to get summary information about the data contained in a dataframe:

- `head()` (or `tail()`) allows us to view the first (or last) rows of our dataframe:

``` r
head(my_data)
##   Id    names gender age     faculty
## 1  1    Alice      F  22  Psychology
## 2  2    Bruno      M  25 Engineering
## 3  3    Carla      F  23    Medicine
## 4  4   Davide      M  22        Arts
## 5  5    Elisa      F  24  Psychology
## 6  6 Fabrizio      M  35        Arts
tail(my_data)
##    Id    names gender age     faculty
## 5   5    Elisa      F  24  Psychology
## 6   6 Fabrizio      M  35        Arts
## 7   7   Gloria      F  26 Engineering
## 8   8   Herman      M  20  Psychology
## 9   9    Irene      F  23  Statistics
## 10 10     Luca      M  22 Engineering
```
- `str()` lets us evaluate the structure of the dataset, providing useful information such as the number of observations, the number of variables, and the type of variables:

``` r
str(my_data)
## 'data.frame':	10 obs. of  5 variables:
##  $ Id     : int  1 2 3 4 5 6 7 8 9 10
##  $ names  : chr  "Alice" "Bruno" "Carla" "Davide" ...
##  $ gender : Factor w/ 2 levels "F","M": 1 2 1 2 1 2 1 2 1 2
##  $ age    : num  22 25 23 22 24 35 26 20 23 22
##  $ faculty: Factor w/ 5 levels "Arts","Engineering",..: 4 2 3 1 4 1 2 4 5 2
```
- `summary()` gives us summary information about the variables depending on their type:

``` r
summary(my_data)
##        Id           names           gender      age               faculty 
##  Min.   : 1.00   Length:10          F:5    Min.   :20.00   Arts       :2  
##  1st Qu.: 3.25   Class :character   M:5    1st Qu.:22.00   Engineering:3  
##  Median : 5.50   Mode  :character          Median :23.00   Medicine   :1  
##  Mean   : 5.50                             Mean   :24.20   Psychology :3  
##  3rd Qu.: 7.75                             3rd Qu.:24.75   Statistics :1  
##  Max.   :10.00                             Max.   :35.00
```


### Exercises {-}

Referring to the `data_long` and `data_wide` dataframes ([solutions](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-10-dataframe.R)): 

1. Add the numerical variable `"memory_pre"` to both the `data_wide` and `data_long` dataframes:

```
##       Id memory_pre
## 1 subj_1          3
## 2 subj_2          2
## 3 subj_3          1
```

2. Add the categorical variable `"group"` to both the `data_wide` and `data_long` dataframes:

```
##       Id     group
## 1 subj_1 treatment
## 2 subj_2 treatment
## 3 subj_3   control
```

3. Aggiungi al DataFrame `data_wide` i dati del soggetto `subj_4` e `subj_5`.


```
##       Id age gender item_1 item_2 item_3 memory_pre     group
## 1 subj_4  25      F      1      0      2          1 treatment
## 2 subj_5  22      M      1      1      0          3   control
```

4. In the `data_wide` dataframe, calculate the `"memory_post"` variable as the sum of the items.
5. In the `data_long` dataframe, rename the variables `item_1`, `item_2`, and `item_3` to `problem_1`, `problem_2`, and `problem_3`, respectively.

