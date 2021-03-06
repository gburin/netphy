#### Generating figures for preliminary results
library(viridis)
library(cowplot)

### Symmetrical rates
results.symtrans <- read.table("results_symtrans.txt", sep = "\t", header = TRUE)
results.symtrans <- results.symtrans[, -dim(results.symtrans)[2]]
results.symtrans <- results.symtrans[order(results.symtrans$tree.number), ]

## q01
q01.sym <-
    ggplot(data = results.symtrans, aes(x = q01.sim, y = q01.fit)) +
    geom_point(aes(colour = lambda.sim), size = 2,  alpha = 0.5) +
    ylim(0,2.5) +
    geom_abline(slope = 1, intercept = 0, colour = "red") +
    scale_color_viridis() +
    theme(legend.position = "bottom") +
    labs(x = "Simulated q01", y = "Estimated q01", colour = "Simulated Speciation Rate")

q01.sym.bytreesize <-
    ggplot(data = results.symtrans, aes(x = ntaxa.sim, y = (q01.fit - q01.sim)/q01.sim)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    geom_hline(yintercept = 0, colour = "darkgrey", linetype = "dashed") +
    scale_color_viridis() +
    ylim(-5,10) +
    theme(legend.position = "bottom") +
    labs(x = "Number of Taxa", y = "Standardized \nFit - Sim", colour = "Simulated Speciation Rate")

## q10
q10.sym <-
    ggplot(data = results.symtrans, aes(x = q01.sim, y = q10.fit)) +
    geom_point(aes(colour = lambda.sim), size = 2,  alpha = 0.5) +
    ylim(0,2.5) +
    geom_abline(slope = 1, intercept = 0, colour = "red") +
    scale_color_viridis() +
    theme(legend.position = "bottom") +
    labs(x = "Simulated q10", y = "Estimated q10", colour = "Simulated Speciation Rate")

q10.sym.bytreesize <-
    ggplot(data = results.symtrans, aes(x = ntaxa.sim, y = (q10.fit - q01.sim)/q01.sim)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    geom_hline(yintercept = 0, colour = "darkgrey", linetype = "dashed") +
    scale_color_viridis() +
    ylim(-5,10) +
    theme(legend.position = "bottom") +
    labs(x = "Number of Taxa", y = "Standardized \nFit - Sim", colour = "Simulated Speciation Rate")

## q10 ~ q01

q01.q10.sym <-
    ggplot(data = results.symtrans, aes(x = q01.fit, y = q10.fit)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    geom_abline(slope = 1, intercept = 0, colour = "red") +
    scale_color_viridis() +
    ## scale_y_log10() +
    ## scale_x_log10() +
    ylim(0,2.5) +
    xlim(0,2.5) +
    theme(legend.position = "bottom") +
    labs(x = "Estimated q01", y = "Estimated q10", colour = "Simulated Speciation Rate")

q01.q10.diff.bytreesize <-
    ggplot(data = results.symtrans, aes(x = ntaxa.sim, y = q10.fit - q01.fit)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    scale_color_viridis() +
    ylim(-10,10) +
    theme(legend.position = "bottom") +
    labs(x = "Number of Taxa", y = "q10 - q01", colour = "Simulated Speciation Rate")

## pSpec

pSpec.sym <-
    ggplot(data = results.symtrans, aes(x = pSpec.sim, y = pSpec.fit)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    geom_abline(slope = 1, intercept = 0, colour = "red") +
    scale_color_viridis() +
    ylim(1e-1, 10) +
    theme(legend.position = "bottom") +
    labs(x = "Simulated pSpec", y = "Estimated pSpec", colour = "Simulated Speciation Rate")

pSpec.sym.bytreesize <-
    ggplot(data = results.symtrans, aes(x = ntaxa.sim, y = (pSpec.fit - pSpec.sim)/pSpec.sim)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    geom_hline(yintercept = 0, colour = "darkgrey", linetype = "dashed") +
    scale_color_viridis() +
    ylim(-5,10) +
    theme(legend.position = "bottom") +
    labs(x = "Number of Taxa", y = "Standardized \nFit - Sim", colour = "Simulated Speciation Rate")




### Asymmetrical rates
results.asymtrans <- read.table("results_asymtrans.txt", sep = "\t", header = TRUE)
results.asymtrans <- results.asymtrans[, -dim(results.asymtrans)[2]]
results.asymtrans <- results.asymtrans[order(results.asymtrans$tree.number), ]

## q01
q01.asym <-
    ggplot(data = results.asymtrans, aes(x = q01.sim, y = q01.fit)) +
    geom_point(aes(colour = lambda.sim), size = 2,  alpha = 0.5) +
    ylim(0,2.5) +
    geom_abline(slope = 1, intercept = 0, colour = "red") +
    scale_color_viridis() +
    theme(legend.position = "bottom") +
    labs(x = "Simulated q01", y = "Estimated q01", colour = "Simulated Speciation Rate")

q01.asym.bytreesize <-
    ggplot(data = results.asymtrans, aes(x = ntaxa.sim, y = (q01.fit - q01.sim)/q01.sim)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    geom_hline(yintercept = 0, colour = "darkgrey", linetype = "dashed") +
    scale_color_viridis() +
    ylim(-5,10) +
    theme(legend.position = "bottom") +
    labs(x = "Number of Taxa", y = "Standardized \nFit - Sim", colour = "Simulated Speciation Rate")

## q10
q10.asym <-
    ggplot(data = results.asymtrans, aes(x = q10.sim, y = q10.fit)) +
    geom_point(aes(colour = lambda.sim), size = 2,  alpha = 0.5) +
    ylim(0,2.5) +
    geom_abline(slope = 1, intercept = 0, colour = "red") +
    scale_color_viridis() +
    theme(legend.position = "bottom") +
    labs(x = "Simulated q10", y = "Estimated q10", colour = "Simulated Speciation Rate")

q10.asym.bytreesize <-
    ggplot(data = results.asymtrans, aes(x = ntaxa.sim, y = (q10.fit - q10.sim)/q10.sim)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    geom_hline(yintercept = 0, colour = "darkgrey", linetype = "dashed") +
    scale_color_viridis() +
    ylim(-5,10) +
    theme(legend.position = "bottom") +
    labs(x = "Number of Taxa", y = "Standardized \nFit - Sim", colour = "Simulated Speciation Rate")

## ## q10 ~ q01

## q01.q10 <-
##     ggplot(data = results.asymtrans, aes(x = q01.fit, y = q10.fit)) +
##     geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
##     geom_abline(slope = 1, intercept = 0, colour = "red") +
##     scale_color_viridis() +
##     ## scale_y_log10() +
##     ## scale_x_log10() +
##     ylim(0,2.5) +
##     xlim(0,2.5) +
##     theme(legend.position = "bottom") +
##     labs(x = "Estimated q01", y = "Estimated q10", colour = "Simulated Speciation Rate")

## q01.q10.diff.bytreesize <-
##     ggplot(data = results.asymtrans, aes(x = ntaxa.sim, y = q10.fit - q01.fit)) +
##     geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
##     scale_color_viridis() +
##     ylim(-10,10) +
##     theme(legend.position = "bottom") +
##     labs(x = "Number of Taxa", y = "q10 - q01", colour = "Simulated Speciation Rate")

## pSpec

pSpec.asym <-
    ggplot(data = results.asymtrans, aes(x = pSpec.sim, y = pSpec.fit)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    geom_abline(slope = 1, intercept = 0, colour = "red") +
    scale_color_viridis() +
    ylim(1e-1, 10) +
    theme(legend.position = "bottom") +
    labs(x = "Simulated pSpec", y = "Estimated pSpec", colour = "Simulated Speciation Rate")

pSpec.asym.bytreesize <-
    ggplot(data = results.asymtrans, aes(x = ntaxa.sim, y = (pSpec.fit - pSpec.sim)/pSpec.sim)) +
    geom_point(aes(colour = lambda.sim), size = 2, alpha = 0.5) +
    geom_hline(yintercept = 0, colour = "darkgrey", linetype = "dashed") +
    scale_color_viridis() +
    ylim(-5,10) +
    theme(legend.position = "bottom") +
    labs(x = "Number of Taxa", y = "Standardized \nFit - Sim", colour = "Simulated Speciation Rate")



## Legends
grobs <- ggplotGrob(q01.sym)$grobs
legend.sym <- grobs[[which(sapply(grobs, function(x) x$name) == "guide-box")]]

grobs <- ggplotGrob(q01.asym)$grobs
legend.asym <- grobs[[which(sapply(grobs, function(x) x$name) == "guide-box")]]
