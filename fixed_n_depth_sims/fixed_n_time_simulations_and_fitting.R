#!/usr/bin/env Rscript

##### Simulating 100 trees with fixed Ntip and depth to check for possible problems

library("TreeSim")
library("geiger")
library("plyr")
library("doMC")
library("foreach")
library("dplyr")
lapply(paste0("../R/",as.list(list.files("../R/"))), source)

## Registering number of cores to be used
registerDoMC(56)

## Number of Simulations
Ntrees <- 100

## Network simulation parameters
pSpec <- 0.4
q01.small <- 0.1
q01.large <- 0.001

### Small Trees - Ntip = 20

## Small trees
n.small.trees <- 20
max.age.small <- 10

## ## Creating file for result storage
## cat(c("tree.number", "q01.sim", "q10.sim", "pSpec.sim", "q01.fit", "q10.fit", "pSpec.fit", "llik.fit"), "\n", append = FALSE, file = "results_symtrans_boxconstrain_fixed_n_depth_small.txt", sep = "\t")

## ## Generating trees, networks, and estimating parameters
## results.small.trees <- foreach(i = 1:Ntrees) %dopar% {
##     ## Simulating trees
##     small.tree <- TreeSim::sim.bd.taxa.age(n = n.small.trees, numbsim = 1, lambda = 0.4, mu = 0, age = max.age.small, mrca = TRUE)
##     small.tree <- drop.tip(small.tree[[1]], paste0("t", n.small.trees))
##     write.tree(small.tree, file = paste0("./small_trees/tree", i, "_small.txt"))

##     ## Simulating networks
##     small.net <- simPhyloNetwork(phy = small.tree, qRate = q01.small, sProb = pSpec)
##     write.table(small.net, file = paste0("./small_nets/net", i, "_small.csv"), sep = ",", quote = FALSE)

##     ## Fitting the model
##     foo <- function(par){
##         q01.small <- exp(par[1])
##         pSpec <- exp(par[2])
##         fitPhyloNetwork(small.tree, small.net, c(q01.small, q01.small, pSpec))
##     }

##     ## Using boxconstrain from diversitree - based on geiger's traits.R line 691
##     boxconstrain=function (f, lower, upper, fail.value)
##     {
##         function(x) {
##             if (any(x < lower | x > upper)) fail.value else f(x)
##         }
##     }
##     f = boxconstrain(foo, -10, 10, fail.value=1e200)

##     ## Optimizing parameter values
##     out <- tryCatch(optim(par = log(c(q01.small, q01.small, pSpec)), fn = f, control = list(trace = 6, reltol = .Machine$double.eps^.25)), error = function(x) return(data.frame(q01.small.fit = NA, q10.fit = NA, pSpec.fit = NA, llik.fit = NA)))

##     ## Creating data.frame and appending to file
##     data.frame(i, q01.small, q01.small, pSpec, exp(out$par[1]), exp(out$par[2]), exp(out$par[3]), out$value)
##     cat(sprintf("%s\t", c(i, q01.small, q01.small, pSpec, exp(out$par[1]), exp(out$par[2]), exp(out$par[3]), out$value)), "\n", file = "./results_symtrans_boxconstrain_fixed_n_depth_small.txt", append = TRUE)
## }


### Large Trees - Ntip = 100

## Large trees
n.large.trees <- 100
max.age.large <- 10

## Creating file for result storage
cat(c("tree.number", "q01.sim", "q10.sim", "pSpec.sim", "q01.fit", "q10.fit", "pSpec.fit", "llik.fit"), "\n", append = FALSE, file = "results_symtrans_boxconstrain_fixed_n_depth_large.txt", sep = "\t")

## Generating trees, networks, and estimating parameters
results.large.trees <- foreach(i = 1:Ntrees) %dopar% {
    ## Simulating trees
    large.tree <- TreeSim::sim.bd.taxa.age(n = n.large.trees, numbsim = 1, lambda = 0.4, mu = 0, age = max.age.large, mrca = TRUE)
    large.tree <- drop.tip(large.tree[[1]], paste0("t", n.large.trees))
    write.tree(large.tree, file = paste0("./large_trees/tree", i, "_large.txt"))

    ## Simulating networks
    large.net <- simPhyloNetwork(phy = large.tree, qRate = q01.large, sProb = pSpec)
    write.table(large.net, file = paste0("./large_nets/net", i, "_large.csv"), sep = ",", quote = FALSE)

    ## Fitting the model
    foo <- function(par){
        q01.large <- exp(par[1])
        pSpec <- exp(par[2])
        fitPhyloNetwork(large.tree, large.net, c(q01.large, q01.large, pSpec))
    }

    ## Using boxconstrain from diversitree - based on geiger's traits.R line 691
    boxconstrain=function (f, lower, upper, fail.value)
    {
        function(x) {
            if (any(x < lower | x > upper)) fail.value else f(x)
        }
    }
    f = boxconstrain(foo, -10, 10, fail.value=1e200)

    ## Optimizing parameter values
    out <- tryCatch(optim(par = log(c(q01.large, q01.large, pSpec)), fn = f, control = list(trace = 6, reltol = .Machine$double.eps^.25)), error = function(x) return(data.frame(q01.large.fit = NA, q10.fit = NA, pSpec.fit = NA, llik.fit = NA)))

    ## Creating data.frame and appending to file
    data.frame(i, q01.large, q01.large, pSpec, exp(out$par[1]), exp(out$par[2]), exp(out$par[3]), out$value)
    cat(sprintf("%s\t", c(i, q01.large, q01.large, pSpec, exp(out$par[1]), exp(out$par[2]), exp(out$par[3]), out$value)), "\n", file = "./results_symtrans_boxconstrain_fixed_n_depth_large.txt", append = TRUE)
}
