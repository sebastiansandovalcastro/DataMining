# HOMEWORK 1 - WHAT IS THE GRAMMAR OF THE GRAPHICS? (MARTINEZ FLORES)

### GRAMMAR OF GRAPHS 

_"A graph, graphical representation, or graph is a type of data representation, usually quantitative, using visual resources (lines, vectors, surfaces, or symbols), so that the mathematical relationship or statistical correlation they hold with each other is visually manifested."_

A graphics grammar is a framework that follows a layered approach to describing and constructing visualizations or charts in a structured way.

A visualization involving multidimensional data often has multiple components or aspects, and leveraging this grammar in chart layers helps us describe and understand each component involved in visualization – in terms of data, aesthetics, scale, objects, and so on.

The original grammar of the graphic framework was proposed by Leland Wilkinson, which covers all the main aspects related to effective data visualization in detail.

#### Componentes de la gramática de las gráficas 

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit2/Homework/triangle.png)

Normally, to construct or describe any visualization with one or more dimensions, we can use the following components: 

- **Data:** Start with the data and identify the dimensions you want to display.
- **Aesthetics:** Confirms the axes based on the dimensions of the data, positions of various data points on the chart. It also checks whether any form of encoding is needed, including size, shape, color, and so on, which are useful for plotting multiple data dimensions.
- **Scale:** When you need to scale potential values, a specific scale is used to represent multiple values or a range. 
- **Geometric objects:** These are popularly known as _geomes_.This would cover how you would represent the data points in the visualization. Could be dots, bars, lines and so on.
- **Statistics:** When you need to display some statistical measures in the visualization as central trend measures, propagation, confidence intervals.
- **Facets:** When you need to create subplots based on specific data dimensions.
- **Coordinate system:** Refers to what type of coordinate system the visualization should be based on, for example, Cartesian, polar, etc. 

#### Grammar of graphs in R language

It is based on the grammar of _Wilkinson's graphs._ It consists of a set of separate elements that can be composed in several ways, in different ways.

Charts can be built iteratively and edited later.

The _ggplot2_ display package is designed to work in layers: starting with the layer that displays the data and then adding layers with statistical summaries and annotations.

Grammar and **ggplot2** do not suggest that chart type or class is appropriate for your data. The ggplot2 package does not describe the interaction of graphs or dynamic graphs such as Ggobi.

#### Other graphing packages 

The _base_ package implements basic graphing. It was developed by Ross Ihaka by implementing the S graphics driver and following Chambers et al's ideas. Basic graphs are like drawing with pen and paper. It is not possible to delete or delete, only on top.

The _grid_ package was developed by Paul Murrell. Defines the grid grobs = graphical objects. Allows you to modify graphs.

Deepayan Sarkar's _lattice_ package implements Cleveland's Trellis. You can easily produce conditional graphs. It provides details but suffers from a formal model (grammar) which makes it difficult to extension.

The _ggplot_ package begins in 2005, considering the good of base and lattice packages and develops a foundation backed by a model for the production of statistical graphs. In this way the independent components facilitate their extension. It is also grid-based allowing low-level control.

#### ggplot components 

The **_data(data)_** you want to visualize and the set of aesthetic mappings **_(mapping)_** that describes how the variables in the data are mapped to aesthetic attributes.

Geometric objects **_(geom)_** that represent what you actually see on the graph. For example, points, lines, polygons, and so on.

Statistical transformations **_(stat)_**, which summarizes the data in different ways. For example, counts and intervals in histograms; a 2D relationship to a linear model. The stat function is optional but very useful.

**_Scales(scale)_** from mapping in data space to the space of aesthetic attributes, such as color, size, or shape. Provides out-of-the-box information that allows reverse mapping.

A **_coordinate system(coord)_** that describes how the coordinates of the data are mapped to the plane of the graph.

Usually it is the Cartesian coordinates but there are also the polar ones and some projections. The presentation **_(facet)_** that describes how to split or separate the data into subsets and how to display those subsets in small multiples. Known in other packages as trellis (trellis, lattice).

#### Conclusion 
Creating a graph pursues certain objectives, primarily to communicate a message, to explain a result based on a dataset. It also helps us to represent large amounts of information in a compact and easy-to-understand way. 

And there is the revelation of data, that is, discovering cause-and-effect relationships, knowing what is going on. 

In the R language, the ggplot2 display package allows us to graph using different shapes to represent data with different designs and approaches. Anyway, this parcel is based on the grammar of graphs that works in layers so it allows you to focus efficiently building graphs that reveal what you want to communicate by adding an extra in the aesthetics of the data represented. 

#### REFERENCES
- https://towardsdatascience.com/a-comprehensive-guide-to-the-grammar-of-graphics-for-effective-visualization-of-multi-dimensional-1f92b4ed4149 
- https://www.maximaformacion.es/wp-content/themes/maximaformacion/img/Tema2_ggplot2.pdf 
- https://es.r4ds.hadley.nz/visualizaci%C3%B3n-de-datos.html 
- https://www.sergiobarbeira.com/gramatica-graficas/#:~:text=Como%20vemos%2C%20Joaqu%C3%ADn%20Sevilla%20nos,continuaci%C3%B3n%20de%20unos%20datos%20concretos. 
- http://allman.rhon.itam.mx/~ebarrios/Foro_XXV/3-ggplot2.pdf 
- http://academica-e.unavarra.es/bitstream/handle/2454/15785/Gram%C3%A1tica.pdf?sequence=1 
- https://es.wikipedia.org/wiki/Gr%C3%A1fica 
