from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_chi850GeV_Suu4TeV_GENSIM_0001'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True

config.JobType.pluginName = 'PrivateMC'
config.JobType.allowUndistributedCMSSW = True
config.JobType.psetName = 'B2G-RunIISummer20UL18GEN-00001_1_cfg.py'
config.JobType.inputFiles = ['Suu4TeV_chi850GeV.lhe']
config.Data.outputPrimaryDataset = 'SuuToChiChi_MSuu4-TeV_Mchi850-GeV_TuneCP5_13TeV-pythia8'
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 100
NJOBS = 100  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.publication = True
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_GENSIM'

config.Site.storageSite = 'T3_US_FNALLPC'
