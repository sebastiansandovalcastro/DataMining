# HOMEWORK 2 - SCALE FUNCTION AND TABLE FUNCTION (MARTINEZ FLORES)

## SCALE FUNCTION

Scale is a generic function whose default method **centers** and/or **scales** the columns of a numerical matrix.

#### Example
```s
scale(x, center = TRUE, scale = TRUE)
```
#### Arguments

- **x** → a numerical matrix (similar object).

- **center** → either a logical value or a vector of length equal to the number of columns of x, where "numeric-alike" means that as.numeric(.) will be applied successfully if is.numeric(.) is not true.

- **scale** → o bien un valor lógico o un vector de longitud similar al número de columnas de x.

#### Explication

Basically the scale function shapes our dataset once it has been converted into an array, either by specifying in how many columns/lines it can be displayed or distributed, or by accommodating the content.

## TABLE FUNCTION

Table uses cross-classification factors to construct a contingency table of counts in each combination of factor levels.

#### Example

```s
table(…,
      exclude = if (useNA == "no") c(NA, NaN),
      useNA = c("no", "ifany", "always"),
      dnn = list.names(…), deparse.level = 1)
as.table(x, …)
is.table(x)
# S3 method for table
as.data.frame(x, row.names = NULL, …,
              responseName = "Freq", stringsAsFactors = TRUE,
              sep = "", base = list(LETTERS))
```
#### Arguments

- **…** → one or more objects that can be interpreted as factors (including strings), or a list (or data frame) whose components can be interpreted as such. (For as.table, arguments passed to specific methods; for as.data.frame, not used.)

- **exclude** → levels to eliminate for all factors in .... If it does not contain NA and useNA is not specified, it implies useNA = "ifany". useNA if AN values should be included in the table.

- **dnn** → the names to be given to the dimensions in the result (the names of the names of the names).
deprse.level controls how the default dnn is constructed.

- **x** → an arbitrary R object, or an object inherited from the "table" class for the as.data.frame method. Note that as.data.frame.table(x, *) can be explicitly called for x not suitable for "remodeling" arrays.

- **row.names** → A vector of characters that give the row names to the dataframe.

- **responseName** → The name to be used for the table entries column usually counts.

- **stringsAsFactors** → Logic: should classification factors be returned as factors (default vectors) or characters?

- **sep, base** → pass to _provideDimnames_.

#### Explication

Basically the table function builds a table with certain combinations based on the factors involved that are within a classification.


##### REFERENCES
- https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/scale 
- https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/table 
