from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_Suu4TeV_chi500GeV_GENSIM_0001'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True

config.JobType.pluginName = 'PrivateMC'
config.JobType.allowUndistributedCMSSW = True
config.JobType.psetName = 'B2G-RunIISummer20UL18GEN-00001_1_cfg.py'
config.JobType.inputFiles = ['Suu4TeV_chi500GeV.lhe']
config.Data.outputPrimaryDataset = 'SuuToChiChi_MSuu-4TeV_Mchi-500GeV_TuneCP5_13TeV-pythia8'
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 25
NJOBS = 400  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.publication = True
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_GENSIM'

config.Site.storageSite = 'T3_US_FNALLPC'
