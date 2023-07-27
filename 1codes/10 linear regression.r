
# linear regression, continuous variables
# simple linear regression
# multiple linear regression

# logistic regression, nominal variables


# Ethington, C. A., Thomas, S. L., & Pike, G. R. (2002). Back to the Basics: Regression as It Should Be. In J. C. Smart & W. G. Tierney (Eds.), Higher Education: Handbook of Theory and Research (Vol. 17, pp. 263–293). Springer Netherlands. https://doi.org/10.1007/978-94-010-0245-5_6

# Sir Francis Galton (1885) introduced the idea of “regression” to the research community in a study examining the relationship of fathers’ and sons’ heights. In his study he observed that sons do not tend toward their fathers’ heights but instead “regress to” the mean of the population. He thus formulated the idea of “regression toward mediocrity”, and with the development of the method of least squares procedures by Carl Friedrich Gauss (Myers, 1990), multiple regression analysis using ordinary least squares procedures (OLS) has become one of the most common statistical techniques for investigating and modeling relationships among variables. Applications of regression occur in almost every field, and one can hardly pick up an issue of a higher education journal without running across at least one study in which OLS regression was the methodology of choice. 

#y = c + co1*x1 + co2*x2.... + con*xn


library(dplyr)

###################################
# the data

# Score ~ Factor1 + Factor2 + Factor3 + Factor4

# The four factors:
# Factor 1, "Setting" 
# Factor 2, "Introversion" 
# Factor 3, "Instruction"
# Factor 4, "Instructor"


# relative path

data1 <- read.csv("../0Data/regression.csv")

glimpse(data1)

max(data1$Score)

# Linear regression analysis can be accomplished with the lm() function. 
# lm() here means linear model. 
# The lm() function receives two arguments as follows. 

lm_model1 <- lm(Score ~ Factor1 + Factor2 + Factor3 + Factor4, data = data1)

lm_model1

# Scott Crossley, Georgia State

summary(lm_model1)



lm_model1 <- lm(Score ~ Factor2 + Factor4,
                data = data1)

summary(lm_model1)



# The findings showed that the regression model was significant (F(2, 207) = 18.68, p. = 3.468e-08, multiple R-squared:  0.1529,	Adjusted R-squared:  0.1447). The regression model is as follows. 

# score = 26.8628 + (-1.5200*factor2) + (-0.8724*factor4)


# The four factors:
# Factor 1, "Setting" 
# Factor 2, "Introversion" 
# Factor 3, "Instruction"
# Factor 4, "Instructor"


# we use the step() function to select the "best" model, or to examine which predictors should be included in the model for the best model fitting. 
# The step() function uses a step-wise function to compute or select the "best" model from all potential ones based on the AIC statistics (Akaike Information Criterion). 

lm_model1 <- lm(Score ~ Factor1 + Factor2 + Factor3 + Factor4, data = data1)


lm_model_stepwise <- step(lm_model1)

lm_model_stepwise

summary(lm_model_stepwise)

lm_model2 <- lm(Score ~ Factor1 + Factor2 + Factor4, data = data1)
summary(lm_model2)



lm_model3 <- lm(Score ~ Factor2 + Factor4, data = data1)
summary(lm_model3)


# Recall that Factor2 is "Introversion" and Factor4 is "Instructor", we may report the results as follows: 
    
# We developed a linear model of the second language learners’ scores on a proficiency test as a function of factors such as  "Introversion" and "Instructor". The model was significant (F(2, 207) = 18.68, p < 0.00). The regression equation is expressed as:

# Score = 26.8628 + (-1.52) × "Introversion" + (-0.87) × "Instructor"


