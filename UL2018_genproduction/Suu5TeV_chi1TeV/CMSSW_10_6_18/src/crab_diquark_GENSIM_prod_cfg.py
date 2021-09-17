from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_Suu5TeV_chi1TeV_GENSIM_0001'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True

config.JobType.pluginName = 'PrivateMC'
config.JobType.allowUndistributedCMSSW = True
config.JobType.psetName = 'B2G-RunIISummer20UL18GEN-00001_1_cfg.py'
config.JobType.inputFiles = ['Suu5TeV_chi1TeV.lhe']
config.Data.outputPrimaryDataset = 'SuuToChiChi_MSuu-5TeV_Mchi-1TeV_TuneCP5_13TeV-pythia8'
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 50
NJOBS = 200  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.publication = True
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18pGENSIM'

config.Site.storageSite = 'T3_US_FNALLPC'
