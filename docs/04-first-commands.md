# First steps in R {#first-commands}



Now that we've started to familiarize ourselves with our tool of choice, we can finally get down to business and focus on writing code!

In this chapter, we will take our first steps in R. We'll begin by learning how to use mathematical, relational, and logical operators to perform simple operations in R. Learning R is a long journey (spoiler: this journey never really ends since R is constantly evolving). Especially at the beginning, it may seem overly difficult because you're encountering many programming commands and concepts for the first time. However, once you've become familiar with the basics, progress will speed up considerably (unstoppable, we would say!).

In this chapter, we will introduce many elements for the first time that will be revisited and explored in greater depth in later chapters. So don’t worry if not everything is clear right away. Learning your first programming language is hard, but you have to start somewhere. Ready for your first lines of code? Let's become a useR!

## Mathematical Operators {#math-operators}

R is a great calculator. In Table \@ref(tab:table-math-operators), the main mathematical operators and functions used in R are listed.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-math-operators)(\#tab:table-math-operators)Mathematical Operators</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Function </th>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Example </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> x + y </td>
   <td style="text-align:left;"> Addition </td>
   <td style="text-align:left;"> &gt; 5 + 3 
[1] 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x - y </td>
   <td style="text-align:left;"> Subtraction </td>
   <td style="text-align:left;"> &gt; 7 - 2 
[1] 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x * y </td>
   <td style="text-align:left;"> Multiplication </td>
   <td style="text-align:left;"> &gt; 4 * 3 
[1] 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x / y </td>
   <td style="text-align:left;"> Division </td>
   <td style="text-align:left;"> &gt; 8 / 3 
[1] 2.666667 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x %% y </td>
   <td style="text-align:left;"> Modulo </td>
   <td style="text-align:left;"> &gt; 7 %% 5 
[1] 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x %/% y </td>
   <td style="text-align:left;"> Integer Division </td>
   <td style="text-align:left;"> &gt; 7 %/% 5 
[1] 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x ^ y </td>
   <td style="text-align:left;"> Power </td>
   <td style="text-align:left;"> &gt; 3 ^ 3 
[1] 27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> abs(x) </td>
   <td style="text-align:left;"> Absolute Value </td>
   <td style="text-align:left;"> &gt; abs(3-5^2) 
[1] 22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sign(x) </td>
   <td style="text-align:left;"> Sign of an Expression </td>
   <td style="text-align:left;"> &gt; sign(-8) 
[1] -1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sqrt(x) </td>
   <td style="text-align:left;"> Square Root </td>
   <td style="text-align:left;"> &gt; sqrt(25) 
[1] 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> log(x) </td>
   <td style="text-align:left;"> Natural Logarithm </td>
   <td style="text-align:left;"> &gt; log(10) 
[1] 2.302585 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> exp(x) </td>
   <td style="text-align:left;"> Exponential </td>
   <td style="text-align:left;"> &gt; exp(1) 
[1] 2.718282 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sin(x)
cos(x)
tan(x)
asin(x)
acos(x)
ata </td>
   <td style="text-align:left;"> (x) |Trigonometric Funct </td>
   <td style="text-align:left;"> ons |&gt;sin(pi/2) 
[1]1 
&gt;cos(pi/2) 
[1]6.123 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> factorial(x) </td>
   <td style="text-align:left;"> Factorial </td>
   <td style="text-align:left;"> &gt; factorial(6) 
[1] 720 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> choose(n, k) </td>
   <td style="text-align:left;"> Binomial Coefficient </td>
   <td style="text-align:left;"> &gt; choose(5,3) 
[1] 10 </td>
  </tr>
</tbody>
</table>

:::{.tip title="The First Functions" data-latex="[The First Functions]"}
Notice how specific functions are used to perform operations like square root or absolute value. In R, functions are called by typing `<function-name>()` (e.g., `sqrt(25)`) and placing the arguments of the function inside the parentheses. We will explore functions in more detail in Chapter \@ref(functions-def).
:::

### Order of Operations

When performing operations, R follows the same order used in regular mathematical expressions. Therefore, the precedence of operators is:

1. `^` (power)
2. `%%` (remainder of a division) e `%/%` (integer division) 
3. `*` (multiplication) e `/`(division)
4. `+` (addition) e `-`(subtraction)

Note that in the presence of functions (e.g., `abs()`, `sin()`), R first replaces the functions with their results and then proceeds with the operations in the previously indicated order.

The order of operation execution can be controlled by using parentheses `( )`. R will perform all the operations inside the parentheses following the same order indicated above. By using multiple groups of parentheses, we can achieve the desired results.

:::{.warning title="Parentheses" data-latex="[Parentheses]"}
Note that in R only round parentheses `( )` are used to manage the order of execution of operations.

**Square brackets** `[ ]` and **curly brackets** `{ }` are instead special operators used in R for other purposes, such as selecting elements and defining code blocks. (See also Chapter \@ref(vector-selection)) 
:::

### Exercises{-}

Calculate the result of the following operations using R:

1. $\frac{(45+21)^3+\frac{3}{4}}{\sqrt{32-\frac{12}{17}}}$

2. $\frac{\sqrt{7-\pi}}{3\ (45-34)}$

3. $\sqrt[3]{12-e^2}+\ln(10\pi)$

4. $\frac{\sin(\frac{3}{4}\pi)^2+\cos(\frac{3}{2}\pi)}{\log_7{e^{\frac{3}{2}}}}$

5. $\frac{\sum_{n=1}^{10} n}{10}$

Notes for solving the exercises:

- In R, the square root is obtained with the function `sqrt()`, while for roots of different indices, the exponential notation is used ($\sqrt[3]{x}$ is given by `x^(1/3)`).
- The value of $\pi$ is obtained with `pi`.
- The value of $e$ is obtained with `exp(1)`.
- In R, logarithms use the function `log(x, base=a)`, where the natural logarithm is considered by default.

## Relational and Logical Operators {#operators-rel-log}

These operations may not seem particularly interesting at the moment, but they will prove very useful later on, for example, for selecting elements (see Chapter \@ref(vector-selection-advanced)).

### Relational Operators

In R, you can evaluate whether a given relationship is true or false. For example, we can evaluate whether "*2 is less than 10*" or whether "*4 is an even number*."

R will evaluate the propositions and return the value `TRUE` if the proposition is true or `FALSE` if the proposition is false. In Table \@ref(tab:relational-operators), the relational operators are listed.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:relational-operators)(\#tab:relational-operators)Relational Operators</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Function </th>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Example </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> x == y </td>
   <td style="text-align:left;"> Equal </td>
   <td style="text-align:left;"> &gt; 5 == 3 
[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x != y </td>
   <td style="text-align:left;"> Not equal </td>
   <td style="text-align:left;"> &gt; 7 != 2 
[1] TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &gt; y </td>
   <td style="text-align:left;"> Greater than </td>
   <td style="text-align:left;"> &gt; 4 &gt; 3 
[1] TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &gt;= y </td>
   <td style="text-align:left;"> Greater than or equal to </td>
   <td style="text-align:left;"> &gt; -2 &gt;= 3 
[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &lt; y </td>
   <td style="text-align:left;"> Less than </td>
   <td style="text-align:left;"> &gt; 7 &lt; 5 
[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &lt;= y </td>
   <td style="text-align:left;"> Less than or equal to </td>
   <td style="text-align:left;"> &gt; 7 &lt;= 7 
[1] TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x %in% y </td>
   <td style="text-align:left;"> inclusion </td>
   <td style="text-align:left;"> &gt; 5 %in% c(3, 5, 8) 
[1] TRUE </td>
  </tr>
</tbody>
</table>

:::{.warning title="'==' is NOT the same as '='" data-latex="['==' is NOT the same as '=']"}
Be careful that to evaluate the equality between two values, you must use`==`, not `=`. This is a very common mistake made frequently.

The `=` operator is used in R to assign a value to a variable. This topic will be covered in Chapter \@ref(assign).
:::

:::{.tip title="TRUE-T-1; FALSE-F-0" data-latex="[TRUE-T-1; FALSE-F-0]"}
Note that in any programming language, the values `TRUE` and `FALSE` correspond to the numerical values `1` and `0`, respectively. These are called [boolean values](https://en.wikipedia.org/wiki/Boolean_data_type).


``` r
TRUE == 1   # TRUE
TRUE == 2   # FALSE
TRUE == 0   # FALSE
FALSE == 0  # TRUE
FALSE == 1  # FALSE
```

In R, it is also possible to abbreviate `TRUE` and `FALSE` as `T` and `F`, respectively, although this practice is not recommended as it could generate confusion. Indeed, while `TRUE` and `FALSE` are reserved words (see Chapter \@ref(objects-names)), `T` and `F` are not (i.e., the latter can also serve as names for any other user-defined variables, thus generating confusion).


``` r
T == 1      # TRUE
T == TRUE   # TRUE
F == 0      # TRUE
F == FALSE  # TRUE
```

:::

### Logical Operators

In R, it is possible to combine multiple relations to evaluate a desired proposition. For example, we could evaluate whether "*17 is greater than 10 and less than 20*." To combine multiple relations into a single proposition that R will evaluate as `TRUE` or `FALSE`, the logical operators shown in Table \@ref(tab:logical-operators) are used.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:logical-operators)(\#tab:logical-operators)Logical Operators</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Function </th>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Example </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> !x </td>
   <td style="text-align:left;"> Negation </td>
   <td style="text-align:left;"> &gt; !TRUE 
[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &amp; y </td>
   <td style="text-align:left;"> Conjunction </td>
   <td style="text-align:left;"> &gt; TRUE &amp; FALSE 
[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &amp;#124; y </td>
   <td style="text-align:left;"> Inclusive Disjunction </td>
   <td style="text-align:left;"> &gt; TRUE &amp;#124; FALSE 
[1] TRUE </td>
  </tr>
</tbody>
</table>

These operators are also known as [boolean operators](https://en.wikipedia.org/wiki/Boolean_expression) and follow the common definitions of logical operators. Specifically:

- In the case of **logical conjunction** `&`, for the proposition to be true, both relations must be true. In all other cases, the proposition will be evaluated as false (see Table \@ref(tab:and-operator)).

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:and-operator)(\#tab:and-operator)Conjunction '&amp;'</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> x </th>
   <th style="text-align:left;"> y </th>
   <th style="text-align:left;"> x &amp; y </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
  </tr>
</tbody>
</table>

- In the case of **inclusive logical disjunction** `|`, for the proposition to be true, at least one relation must be true. The proposition will only be evaluated as false when both relations are false (see Table \@ref(tab:or-operator)).

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:or-operator)(\#tab:or-operator)Inclusive Disjunction '|'</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> x </th>
   <th style="text-align:left;"> y </th>
   <th style="text-align:left;"> x &amp;#124; y </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
  </tr>
</tbody>
</table>

:::{.design title="Exclusive Disjunction" data-latex="[Exclusive Disjunction]"}

For completeness, we should mention that there is also the **exclusive disjunction** among the logical operators. The proposition will be evaluated as false if both relations are either true or false. For the proposition to be evaluated as true, one relation must be true while the other must be false.

In R, the exclusive disjunction between two relations (x and y) is indicated with the function `xor(x, y)`. However, this function is rarely used.

<div style="width:360px;  margin-left: auto; margin-right: auto;">
Table: Exclusive Disjunction 'xor(x, y)'

|   x   |   y   | xor(x, y) |
|:-------|:-------|:-----------|
| TRUE  | TRUE  | FALSE     |
| TRUE  | FALSE | TRUE      |
| FALSE | TRUE  | TRUE      |
| FALSE | FALSE | FALSE     |
</div>
:::

### Order of Evaluation of Relations

When evaluating the truthfulness of propositions, R executes the operations in the following order:

1. Mathematical operators (e.g., `^`, `*`, `/`, `+`, `-`)
2. Relational operators (e.g., `<`, `>`, `<=`, `>=`, `==`, `!=`)
3. Logical operators (e.g., `!`, `&`, `|`)

The complete list of the order of operation execution is available at the following link [https://stat.ethz.ch/R-manual/R-devel/library/base/html/Syntax.html](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Syntax.html). Remember that if there is any doubt about the order of operation execution, the best thing to do is to use round parentheses `( )` to clarify any possible ambiguities.

:::{.warning title="The '%in%' Operator" data-latex="[The '\\%in\\%' Operator]"}
Note that the `%in%` operator, which we previously indicated among the relational operators, is actually a special operator. Specifically, it does not follow the same rules as the other relational operators regarding the order of execution.

The best solution? Use parentheses!
:::

### Exercises  {-}

Perform the following exercises using relational and logical operators:

1. Define two false relations and two true relations that allow you to evaluate the results of all possible combinations using the logical operators `&` and `|`.
2. Define a proposition that allows you to evaluate whether a number is even. Define another proposition for odd numbers (hint: what does `%%` remind you of?).
3. Define a proposition to evaluate the following condition (remember to test all possible scenarios): "*x is a number between -4 and -2 or a number between 2 and 4*."
4. Perform the following operations: `4 ^ 3 %in% c(2,3,4)` and `4 * 3 %in% c(2,3,4)`. What do you observe in the order of operation execution?
