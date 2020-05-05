#####################################
#                                   #
#   field_CUE_17.csv site updates   #             
#                                   #
#####################################


# read in the data frame
cue <- read.csv("field_CUE_17.csv", header=TRUE)
summary(cue)

# check site names
levels(cue$site)

# compare with site names for hhout master dataframe
hhout <- read.csv("hhout_master_17Mar2020", header=TRUE)
summary(hhout)
levels(hhout$site)

# all.equal?
all.equal(hhout$site, cue$site)

# no, many string differences

# sites that are in CUE but not in hhout master:
# - 131Y
# 
# sites that are in hhout master but not in CUE:
# - 156Q
# - 157G
# - 160D

# check what species each of these non-matched sites is
cue[cue$site =="131Y", ]  # picea sitchensis
hhout[hhout$site == "156Q", ] # picea, non-fractionated sample
hhout[hhout$site == "157G", ] # picea, fractionated sample
hhout[hhout$site == "160D", ] # picea, non-fractionated sample

# maybe 131Y is actually 157G for purposes of the comparison - both are picea, but site names don't match. 
# I think it's okay to use the data as-is, don't change sites, just use a join and let 
# the sites that don't match up become an 'na'

