---
title: "Let's stop relying on multiple regression tables"
date: 2026-05-11
permalink: /posts/2026/05/regression-plot/
tags:
  - academic-gadgets
  - data visualisation
  - R
  - research dissemination
  - design
---

Multiple regressions are notoriously difficult to report - at least if you'd like it to be somewhat intuitive and visually appealing. Regression tables, the go-to reporting device for these kinds of analyses, are clunky, information-dense, and far from intuitive. Here, I present an *R* function to quickly create a clear, visually appealing **regression coefficients plot** that can supplement, or even replace these tables in posters, presentations, or papers.

![From Tables to Plots - Visualizing Regression Analyses](https://github.com/tobicn/TobiasConstien/blob/master/images/RegressionPlot-Image1.png?raw=true)

Multiple regression analyses are quite common in my field of developmental psychology. Accordingly, I have been using them quite frequently in my recent work on toddlers' play, screen use, and executive functions. Yet, I have struggled to effectively convey what my many regression results actually mean. In my research, I'm hoping to reach two key audiences: Parents and Policymakers. That said, I can't assume either group will be familiar with the kind of statistical knowledge needed to make sense of multiple regression tables. Consequently, I have been looking for alternative ways to illustrate and communicate my findings.

How do you communicate regression results?
---

One idea my statistics professor *(thank you, Laura Taylor)* drilled into me was to supplement any kind of statistical reporting with a *in-other-words-statement*. This kind of statement essentially repeats what's been previously said with regression coefficients and *p*-values in an everyday, comprehensible language. For example, we recently reported (multiple regression) results from our SCOOT Study like this:

> *The interaction term was significant, indicating that the association between screen time and executive function regulation depended on toddlers’ sleep quality. **In other words**, toddlers who fall asleep easier at night, sleep longer and with fewer interruptions, show no adverse effect of screen time in their executive function regulation development, whereas toddlers who have a difficult time falling asleep, wake more often, and sleep less, are more affected by screen time in regards to their development of executive function regulation.*

While this is an effective way of translating statistics into language that can be easily understood by readers, it still depends essentially on traditional regression tables and requires a lot of words. As such, results are still not "at-a-glance" communicated the way I'd like them to be for a poster, presentation, or blog post.

An alternative solution, which I love, are coefficient, or dot-whisker plots, i.e., plots that simply graph the regression coefficients and their respective confidence intervals in a multiple regression model in a forest-plot-like visualisation. I first came across them on the [Stephanie Evergreen blog](https://stephanieevergreen.com/visualizing-regression/) and have since found them to be a really effective tool in my presentations. 

Coefficient Plots
---

**Coefficient plots** are based on the idea that via standardization our coefficients, and hence the influence of their associated variable on the model, become essentially comparable. By plotting them alongside each other, this comparison becomes visually clear and enables a "at-a-glance" communication of the many results of a multiple regression model.  I have since produced many of these coefficient plots in PowerPoint in the past, which is easier than it sounds. Via colours, opacity, and animations these plots can become quite visually attractive. Here's a recent example from our [SCOOT Study](https://osf.io/a5473/overview) and the presentation held at the 2025 Children's Research Network conference in Dublin.

![An example of a coefficient plot created within PowerPoint](https://github.com/tobicn/TobiasConstien/blob/master/images/RegressionPlot-Image2.png?raw=true)

Creating coefficient plots in *R*
---

Still, creating these plots in PowerPoint can be a bit of a tedious task and required me to move boxes and circles around at 400% zoom in order to get their placement just right. Therefore, I was looking for ways to get the same result via *R*. I was pleasantly suprised that many people before me had thought about this issue. There's are packages like`dotwhisker` or `jtools` specifically for this purpose, an integration into `ggplot2`, as well as great papers on this topic (e.g., Fries et al., [2024](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0297033#sec009)).

Still, none of these resources gave me the exact outcome I achieved via my *PowerPoint-Playing-Around*. Consequently, I needed a bit of extra work to get the result I wanted. I ended up working off the `ggplot2` interpretation of a coefficient plot, which allowed me to further customize it to my needs. The code I started off with was from Fries et al., ([2024](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0297033#sec009)) and produced the following plot:

    #create multiple regression model
    lm_example <- lm(scale(Sepal.Length) ~ scale(Sepal.Width) + scale(Petal.Length) + scale(Petal.Width), data = iris)
    
    #produce plot
    lm_example_forest <- plot_model(lm_example, type = "est") + 
                                    ggtitle("") +
	                                  theme(axis.text.y = element_text(colour="black", size=10, face="bold"),
                                           axis.text.x = element_text(colour="black", size=10, face="bold"),
                                           axis.title.x = element_text(colour="black", size=10, face="bold"))
    
![ggplot2 coefficient plot based on iris data](https://github.com/tobicn/TobiasConstien/blob/master/images/RegressionPlot-Image3.png?raw=true)

The modifications I wanted to this plot to include were:

 - Adjust coloring based on the statistical significance of the coefficient.
 - Include the actual value of the coefficient.
 - Layer custom variable names over the plot.
 - Customise the theme (e.g., custom x-axis labels, range, etc.)

Following multiple iterations, as well as back-and-forth discussions with Claude (Sonnet 4.6), I arrived at the following code, which implements all of these modifications. It's also wrapped into a function making it reusable across several multiple regression models.

    #define plot_regression function
    plot_regression <- function(model, 
                                sig_level = 0.05,
                                sig_colour = "#2980B9",
                                ns_colour = "#A9BFD1") {
    
    #extract plot data and identify significant coefficients
    plot_data <- plot_model(model, type = "est")$data
    plot_data$significant <- plot_data$p.value < sig_level
    
    #get unique variable labels
    terms <- unique(plot_data$term)
    
    #prompt user for custom labels
    message("Enter custom labels for each term (press Enter to keep original, max. 15 char.):")
    custom_labels <- setNames(substr(as.character(terms), 1, 15), as.character(terms))
    
    for (term in terms) {
      label <- readline(prompt = paste0("  ", term, " -> "))
      if (nchar(label) > 0) {
      if (nchar(label) > 15) {
        message("  Label truncated to: ", substr(label, 1, 15))
      }
      label <- substr(label, 1, 15)
      custom_labels[term] <- paste0("  ", label)
      }}
    
    #build coefficient plot
    ggplot(plot_data, aes(x = term, y = estimate)) +
      #line drawn for x = 0
      geom_hline(yintercept = 0, color = "grey40", linewidth = 0.6, linetype = "solid") +
      #confidence interval
      geom_errorbar(aes(ymin = conf.low, ymax = conf.high, colour = significant), linewidth = 6, lineend = "round", width = 0) +
      #coefficient
      geom_point(aes(colour = significant), size = 9) +
      geom_text(aes(label = sub("0\\.", ".", sprintf("%.2f", estimate))), colour = "white", size = 3.5, fontface = "bold", vjust = 0.4) +
      #add colour manual for signifigance
      scale_fill_manual(values = c("TRUE" = sig_colour, "FALSE" = ns_colour), guide = "none") +
      scale_colour_manual(values = c("TRUE" = sig_colour, "FALSE" = ns_colour), guide = "none") +
      #theme settings
      ggtitle("") +
      labs(y = "Standardised Coefficient") +
      theme_void() +
      theme(
        axis.text.y = element_text(colour = "black", size = 11, face = "bold", hjust = 0, margin = margin(r = -130)),
        axis.text.x = element_text(colour = "grey50", size = 10, margin = margin(t = 5)),
        axis.title.x = element_text(colour = "black", size = 11, face = "bold", margin = margin(t = 10)),
        panel.grid.major.x = element_line(color = "grey40", linewidth = 0.4, linetype = "dashed"),
        panel.grid.major.y = element_line(color = "grey95", linewidth = 13, linetype = "solid")) +
      scale_y_continuous(limits = c(-1, 0.75), breaks = seq(-0.5, 0.5, by = 0.5), labels = c("-.5", "0", ".5")) +
      scale_x_discrete(labels = custom_labels) +
      coord_flip()
      }
      
      #use function
      reg_plot <- plot_regression(model1b, sig_level = .05, sig_colour = "#2980B9", ns_colour = "#A9BFD1")

      #save created plot (for presentations)
      ggsave(filename = "CoefficientPlot-Example3.png",
              plot = reg_plot,
              width = 25.4,
              height = 1.825*4, #adjust by number of predictors
              units = "cm",
              dpi = 300)



![Adapted Coefficient Plot via the newly created R-Function](https://github.com/tobicn/TobiasConstien/blob/master/images/RegressionPlot-Image4.png?raw=true)


Resources and references
---

 - **Download function**: I have created an *R*-script [ready to be downloaded](https://github.com/tobicn/TobiasConstien/blob/eea4205aeba6d8f079416c310b6555bfb0c70fcd/files/CoefficientPlot-R-Script.R), which includes the created `plot_regression` function. Feel free to use and modify! Let me know if this is any use to you :)
 - **Fries et al. (2024)**: This [paper](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0297033#sec001) put me first onto the idea of creating coefficient plots in R. I hadn't seen them before in papers, so I was quite happy to see that they can be actually produced and published! I also really like how they report their code and make it available via their supplementary materials.
 - **jtools**: `jtools` is a nifty *R* package that includes a lot of useful functions to visualize, and report regression results.  For example, it includes a function to create coefficient plots that can accommodate multiple models within one plot - that can be quite useful!


That’s all.
----

I'm quite happy with this outcome. It effectively communicates my results *at-a-glance* and can be included on a poster, presentation, or paper. I'm hoping to put this kind of plot in my next manuscript and will update this blog post when (or if) it is published. Let's see if it survives peer-review!

Something I am still unsure of is how to include categorical variables like gender in a plot like this. I'm also wondering how effective this kind of plot is to visualize an interaction term. 

*[Let me know](mailto:tobias.constien@ucdconnect.ie)* if you have any additional ideas!
