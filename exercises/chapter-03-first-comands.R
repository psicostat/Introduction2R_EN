#######################################
####    Capitolo 3 - Primi Passi   ####
#######################################

#----    Operatori Matematici    ----

# 1
((45+21)^3+3/4)/sqrt(32-12/17)

# 2
(sqrt(7-pi)/(3*(45-34)))

# 3
(12-exp(1)^2)^(1/3)+log(10*pi)

# 4
(sin(3/4*pi)^2+cos(3/2*pi))/log(exp(1)^(3/2),base = 7)

# 5
sum(1:10)/10

#----    Operatori Relazionali e Logici    ----

# 1
# Congiunzione
2 > 0 & 2 > 1 # TRUE
2 > 0 & 2 < 1 # FALSE
2 < 0 & 2 > 1 # FALSE
2 < 0 & 2 < 1 # FALSE

# Disgiunzione Inclusiva
2 > 0 | 2 > 1 # TRUE
2 > 0 | 2 < 1 # TRUE
2 < 0 | 2 > 1 # TRUE
2 < 0 & 2 < 1 # FALSE

# 2
# Numeri pari: x %% 2 == 0
4 %% 2 == 0  # TRUE
5 %% 2 == 0  # FALSE

# NUmeri dispari: x %% 2 != 0
4 %% 2 != 0  # FALSE
5 %% 2 != 0  # TRUE

# 3
# prima soluzione: (x >= -4 & x <= -2) | (x >= 2 & x <= 4)
(-5 >= -4 & -5 <= -2) | (-5 >= 2 & -5 <= 4) # FALSE
(-3 >= -4 & -3 <= -2) | (-3 >= 2 & -3 <= 4) # TRUE
(0 >= -4 & 0 <= -2) | (0 >= 2 & 0 <= 4)     # FALSE
(3 >= -4 & 3 <= -2) | (3 >= 2 & 3 <= 4)     # TRUE
(5 >= -4 & 5 <= -2) | (5 >= 2 & 5 <= 4)     # FALSE

# seconda soluzione: abs(x) >= 2 & abs(x) <= 4
abs(-5) >= 2 & abs(-5) <= 4   # FALSE
abs(-3) >= 2 & abs(-3) <= 4   # TRUE
abs(0) >= 2 & abs(0) <= 4     # FALSE
abs(3) >= 2 & abs(3) <= 4     # TRUE
abs(5) >= 2 & abs(5) <= 4     # FALSE

# 4
4 ^ 3 %in% c(2,3,4) # ^ ha precedenza rispetto a %in%
4 * 3 %in% c(2,3,4) # %in% ha precedenza rispetto a *

#----
