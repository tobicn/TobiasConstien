#Coefficient Plot - Reusable Function
#Created by Tobias Constien, https://tinyurl.com/TobiasConstien
#Contact: tobias.constien@ucdconnect.ie

#Define Function ----
plot_regression <- function(
    model, 
    sig_level = 0.05,
    sig_colour = "#2980B9",
    ns_colour = "#A9BFD1") {
  
  # Extract plot data
  plot_data <- plot_model(model, type = "est")$data
  plot_data$significant <- plot_data$p.value < sig_level
  
  # Get unique terms
  terms <- unique(plot_data$term)
  
  # Prompt user for custom labels
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
    }
  }
  
  # Build plot
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

#Example Plot ----
model_swiss <- lm(scale(Fertility) ~ scale(Agriculture) + scale(Catholic) + scale(Infant.Mortality), data = swiss)
reg_plot <- plot_regression(model_swiss, sig_level = .05, sig_colour = "#2980B9", ns_colour = "#A9BFD1")

#Save Plot ----
ggsave(
  filename = "CoefficientPlot1.png",
  plot = reg_plot,
  width = 25.4,
  height = 1.825*3, #adjust by number of predictors
  units = "cm",
  dpi = 300)