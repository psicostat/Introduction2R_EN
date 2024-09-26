# Strings {#strings}

<!--
SOURCES:
- https://statisticsglobe.com/r-substr-substring
- The art of R Programming
- R4DS
- https://bookdown.org/rdpeng/rprogdatascience/regular-expressions.html
-->

We have seen that R, besides handling numbers, is also capable of managing **characters**. Although mathematical operations are not relevant for this type of data, working with strings is just as complex, if not more so, in programming. Compared to numbers, strings:

- Can be uppercase or lowercase. For example, the string `ciao` is *conceptually* the same as `Ciao`, but R treats them differently.


```r
"ciao" == "Ciao"
```

```
## [1] FALSE
```

- Can contain special characters like `? \ $` or belong to different alphabets `ऊ α`
- The indexing for `numbers` and `strings` works differently. If we have a **vector** of strings, it is represented in the same way as a numeric vector. However, the string itself ciao can be broken down, manipulated, and indexed by the individual characters that compose it: `c, i, a, o`:


```r
vect_string = c("how", "are", "you")
vect_num = c(1,2,3)

length(vect_string)
```

```
## [1] 3
```

```r
length(vect_num)
```

```
## [1] 3
```

```r
vect_string[1]
```

```
## [1] "how"
```

```r
vect_num[1]
```

```
## [1] 1
```

```r
# Using the nchar() function
setNames(nchar(vect_string), vect_string)
```

```
## how are you 
##   3   3   3
```

To create a string in R, we must use single or double quotes `"string"` or `'string'`. These two syntaxes are interpreted the same way in R. We can use them both to write a string containing quotes:


```r
x = "string with 'another string' inside"
x

x = "string with "another string" inside"
# This gives an error because R can't interpret the double quotes correctly
```

```
## Error: <text>:4:19: unexpected symbol
## 3: 
## 4: x = "string with "another
##                      ^
```

Within strings, we can use special characters like `/ | \ $ % &`. Some of these are interpreted in a specific way by R. When this happens, we need to add the `\` character, which acts as an *escape*, telling R to interpret the character literally:


```r
x = "hello how are you? \n I’m all good"
cat(x)
```

```
## hello how are you? 
##  I’m all good
```

For this reason, R offers a series of functions and packages that allow efficient manipulation of strings. Here, we will see a brief overview of these functions with some suggestions on how to explore them further.

## Comparing Strings

The first aspect is comparing strings. The logical comparison of strings is much stricter than that of numbers. As we saw earlier, strings allow for more freedom, but with the challenge of managing more scenarios.


```r
# Comparing two numbers represented differently
my_integer = as.integer(10)
my_double = as.numeric(10)
my_integer == my_double
```

```
## [1] TRUE
```

```r
# Comparing strings

"ciao" == "Ciao"
```

```
## [1] FALSE
```

```r
"female" == "feMale"
```

```
## [1] FALSE
```

The concept of space "` `" is also important because it is considered a character:


```r
"ciao " == "ciao"
```

```
## [1] FALSE
```

Imagine having a vector where a column represents the gender of participants. If this vector comes from people freely entering text in a field, you could end up with something like this (this is why online forms often use predefined options instead of free text):


```r
gender = c("maLe", "masChio", "Male", "f", "female", "f", "malew")
```

In this exaggerated example, we understand what `f` or `malew` (likely a typo) mean, but working with it in R becomes problematic:


```r
# Frequency table

table(gender)
```

```
## gender
##       f  female    maLe    Male   malew masChio 
##       2       1       1       1       1       1
```

```r
# Not very useful!
```

## Constructing Strings

Let’s look at some useful functions for working with strings.

### `tolower()` and `toupper()`

These functions are extremely useful because they allow you to force the characters to lowercase or uppercase.


```r
tolower(gender)
```

```
## [1] "male"    "maschio" "male"    "f"       "female"  "f"       "malew"
```

```r
toupper(gender)
```

```
## [1] "MALE"    "MASCHIO" "MALE"    "F"       "FEMALE"  "F"       "MALEW"
```

### `paste()` and `paste0()`

These functions allow you to combine different pieces of information into a string. You can combine different strings or even numbers. As is typical in R, `paste()` and `paste0()` are vectorized, making them useful for combining two vectors of information. The difference is that `paste()` automatically adds a space between the combined strings, while with `paste0()`, the space must be added explicitly.


```r
age = c(10, 20, 35, 15, 18)
names = c("Andrea", "Francesco", "Fabio", "Anna", "Alice")

paste(names, "is", age, "years old")
```

```
## [1] "Andrea is 10 years old"    "Francesco is 20 years old"
## [3] "Fabio is 35 years old"     "Anna is 15 years old"     
## [5] "Alice is 18 years old"
```

```r
paste0(names, "is", age, "years old")
```

```
## [1] "Andreais10years old"    "Francescois20years old" "Fabiois35years old"    
## [4] "Annais15years old"      "Aliceis18years old"
```

```r
paste0(names, " is ", age, " years old")
```

```
## [1] "Andrea is 10 years old"    "Francesco is 20 years old"
## [3] "Fabio is 35 years old"     "Anna is 15 years old"     
## [5] "Alice is 18 years old"
```

In this case, although `age` is numeric, it is coerced into a string to be combined with the names.

### `sprinf()`

`sprintf()` is similar to `paste*()` in functionality but allows you to compose strings using *placeholders* and then provide the content.


```r
sprintf("%s is %d years old", names, age)
```

```
## [1] "Andrea is 10 years old"    "Francesco is 20 years old"
## [3] "Fabio is 35 years old"     "Anna is 15 years old"     
## [5] "Alice is 18 years old"
```

In this case, we compose a string using `%` followed by a letter representing the type of data to insert. We then provide the information in order. Here, `%s` (string) is for `names`, and `%d` (digits) is for `age`. Use `?sprintf` for an overview of the *placeholders* available.

## Indexing Strings

### `nchar()`

As we saw earlier, a string is made up of a sequence of characters. The `nchar()` function returns the number of individual characters that make up a string.


```r
nchar("ciao")
```

```
## [1] 4
```

```r
nchar("Wow, working with strings is very fun")
```

```
## [1] 37
```

### `gregexpr()` and `regexpr()`

To find the position of one or more characters within a string, we can use `gregexpr()`. The syntax is `(g)gregexpr(pattern, string)`:


```r
regexpr("t", "butterfly")
```

```
## [1] 3
## attr(,"match.length")
## [1] 1
## attr(,"index.type")
## [1] "chars"
## attr(,"useBytes")
## [1] TRUE
```

```r
gregexpr("t", "butterfly")
```

```
## [[1]]
## [1] 3 4
## attr(,"match.length")
## [1] 1 1
## attr(,"index.type")
## [1] "chars"
## attr(,"useBytes")
## [1] TRUE
```

The difference is that `regexpr()` only returns the first match — in our example, the first `t` is in the 3^rd position — while `gregexpr()` returns all matches. 

### `substr()` and `substring()` 

The inverse process — that is, finding the string corresponding to a given index — is the task of `substr(string, start, stop)` where `start` and `stop` are the indices of the portion of the string we want to extract. `substring()` works the same way, but `start` and `stop` are called `first` and `last`. 


```r
substr("butterfly", 1, 1) # solo la prima
```

```
## [1] "b"
```

```r
substr("butterfly", 2, 4) # dalla seconda alla quarta
```

```
## [1] "utt"
```

For these tasks, both functions provide exactly the same result. Let’s examine the differences: 

- `substring()` allows you to provide only the initial index `first`  and the final index defaults to `1000000L`. 
- `substring()` also allows you to provide a vector of start/end indices to segment the string. 


```r
substring("butterfly", 1) # works
```

```
## [1] "butterfly"
```

```r
substr("butterfly", 1) # error
```

```
## Error in substr("butterfly", 1): argument "stop" is missing, with no default
```

```r
substring("butterfly", 1, 1:5) # multiple end indices
```

```
## [1] "b"     "bu"    "but"   "butt"  "butte"
```

```r
substring("butterfly", 1:5, 1:5) # multiple start and end indices
```

```
## [1] "b" "u" "t" "t" "e"
```

```r
substr("butterfly", 1, 1:5) # only one (i.e., the first) end index is used
```

```
## [1] "b"
```

### `startWith()` and `endsWith()`

Sometimes we are only interested in the beginning or the end of a string. For example, `female` and `male` have a clear initial difference (`fe` and `ma`). Even with subsequent typos or other differences, selecting only the beginning or end can be efficient. `startsWith()` and `endsWith()` respectively return `TRUE` or `FALSE` if a certain string or vector of strings has a given initial or final pattern.


```r
startsWith("female", prefix = "fe")
```

```
## [1] TRUE
```

```r
endsWith("female", suffix = "ale")
```

```
## [1] TRUE
```

These, like the other functions, can be combined with `tolower()` or `toupper()` to ignore irrelevant differences.

### `grep()` and `grepl()`

These functions operate on **vectors** of strings, finding the position or simple presence of specific *patterns*. `grep()` returns the position(s) in the vector where a match is found, while `grepl()` returns `TRUE` or `FALSE` depending on the presence of the *pattern*. The syntax is the same `grep*(pattern, vector)`.


```r
gender
```

```
## [1] "maLe"    "masChio" "Male"    "f"       "female"  "f"       "malew"
```

```r
grep("female", gender) # index of position
```

```
## [1] 5
```

```r
grepl("female", gender) # true or false
```

```
## [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
```

As we saw with logical indexing of vectors, we can use both `grep()` and `grepl()` to select only certain elements:


```r
index_grep = grep("female", gender) # index of position
index_grepl = grepl("female", gender) # logical index

gender[index_grep]
```

```
## [1] "female"
```

```r
gender[index_grepl]
```

```
## [1] "female"
```

Note again how all these functions work on a **very strict match** (in terms of upper/lowercase, etc.) between pattern and target.

## Manipulating Strings

Many of the functions we’ve seen also allow replacing a certain pattern within a string or vector of strings.

Using `substr()` or `substring()` with the assignment operator `=` (or `<-`), we can replace certain characters. Importantly, the replacement must have the same number of characters as the selection `start:stop`, or only the corresponding number of characters will be used:



```r
x = "butterfly"
substr(x, 1, 1) = "y"
x
```

```
## [1] "yutterfly"
```

```r
x = "butterfly"
substr(x, 1, 1) = "aeiou"
x # only the 'a' is used
```

```
## [1] "autterfly"
```

```r
# substring works exactly the same way
x = "butterfly"
substring(x, 1, 1) = "z"
x
```

```
## [1] "zutterfly"
```

They can also be used in a vectorized manner, working on multiple elements:


```r
x = c("dog", "cat", "mouse", "butterfly")
substring(x, 1, 1) = "z"
x
```

```
## [1] "zog"       "zat"       "zouse"     "zutterfly"
```

### `gsub()` and `sub()`

Unlike `substring()`, `gsub()` and `sub()` allow you to replace a certain pattern rather than using position indices. The syntax is `*sub(pattern, replacement, target)`:


```r
x = c("dog", "cat", "mouse", "butterfly")
sub("o", "z", x)
```

```
## [1] "dzg"       "cat"       "mzuse"     "butterfly"
```

As you can see, for each element of `x`, the function found the pattern `"o"` and replaced it with `"z"`.

The main limitation of `sub()` is that it only replaces the first match found in each string.


```r
x = c("dog", "cat", "mouse", "butterfly")
sub("t", "z", x)
```

```
## [1] "dog"       "caz"       "mouse"     "buzterfly"
```

As you can see, only the first `"t"` in the word `"butterfly"` was replaced. `gsub()`, however, replaces all characters that match the requested pattern:


```r
x = c("dog", "cat", "mouse", "butterfly")
gsub("t", "z", x)
```

```
## [1] "dog"       "caz"       "mouse"     "buzzerfly"
```

### `strsplit()`

We’ve already seen that, with `substring()`, we can, for example, divide a string into several parts. According to the R documentation, the `strsplit()` function is more suitable and efficient for this task. The syntax is `strsplit(target, split)` where `split` is the character used to divide:


```r
my_string = "How nice it is to work with strings in R"
strsplit(my_string, " ") # splitting by spaces
```

```
## [[1]]
##  [1] "How"     "nice"    "it"      "is"      "to"      "work"    "with"   
##  [8] "strings" "in"      "R"
```

```r
my_string = "howxnicexitxis"
strsplit(my_string, "x") # splitting by the "x" character
```

```
## [[1]]
## [1] "how"  "nice" "it"   "is"
```

```r
my_string = "ciao"
strsplit(my_string, "") # splitting each character
```

```
## [[1]]
## [1] "c" "i" "a" "o"
```

What we get is a vector (within a list, you can use `unlist()`) that contains the result of the splitting.

## Regular Expression (REGEX)

Is everything this simple with strings? Absolutely not! So far, we’ve used simple patterns like single characters or sets of characters, but we may have more complex problems to address, such as:

- finding the extension of a set of files
- finding the domain of a website

Let’s consider an example:


```r
files = c(
  "file1.txt",
  "file2.docx",
  "file3.doc",
  "file4.sh"
)
```

In this case, if we want to extract all the extensions `filename.extension`, the tools we’ve seen so far are insufficient:

- we could extract characters from the end using `substr()` and counting with `nchar()`, but extensions don’t have a fixed number of characters
- we could search for all patterns using `grepl()`, but there are thousands of different extensions

So far, we’ve seen two levels of abstraction:

1. Literal match: `string1 == string2`
2. Indexing: position within a st

The third level of abstraction is finding common patterns in strings and extracting them, regardless of the individual characters, numbers, or positions.

Regular Expressions (REGEX) are a set of characters (called **metacharacters**) that are interpreted and allow you to find patterns in strings without specifying a specific pattern or position index. The topic is very complex and not specific to R. There are plenty of guides and tutorials available online, which we will list at the end of this chapter. The important thing to know is that most of the functions we’ve seen allow the use of a `regex` in addition to a specific pattern to solve more complex problems.

For example, if we want to extract the extension from a list of files, the reasoning would be:

- we need to find a `.` because (almost) all files are composed of `filename.extension`
- we need to select all characters from the dot to the end of the string

The "translation" in terms of REGEX is `"\\.([^.]+)$"`, and we can use this as a *pattern* to extract the information we need. We can use the regmatches(text, match) function, which requires the string to analyze and a `match` object, which is the result of the `regexpr` function we’ve already seen:


```r
match_regex = regexpr("\\.([^.]+)$", files)
regmatches(files, match_regex)
```

```
## [1] ".txt"  ".docx" ".doc"  ".sh"
```

## Further Reading

Throughout this book, we have aimed to approach R as a programming language by focusing on its basic functions. However, in certain areas, such as strings and REGEX, there are highly recommended external packages that not only simplify tasks but also make the set of functions more organized and consistent. The [`stringr` package](https://stringr.tidyverse.org/index.html) is a fantastic resource for learning and for working more efficiently with strings. It contains a series of functions built on top of those we’ve covered, simplifying them and providing uniformity.

The last example we described isn't very readable since it involves using the result of another function and calling the `target` object twice. In `stringr`, we have the `str_extract()` function, which extracts a certain pattern or REGEX:


```r
stringr::str_extract(files, "\\.([^.]+)$")
```

```
## [1] ".txt"  ".docx" ".doc"  ".sh"
```

### Useful Resources

- [`stringr`](https://stringr.tidyverse.org/index.html)
- [Chapter 14](https://r4ds.had.co.nz/strings.html) di R for Data Science
- [Mastering Regular Expressions](http://regex.info/book.html)
- [Handling Strings With R](https://www.gastonsanchez.com/r4strings/)

### Other Useful Functions

- `abbreviate()`
