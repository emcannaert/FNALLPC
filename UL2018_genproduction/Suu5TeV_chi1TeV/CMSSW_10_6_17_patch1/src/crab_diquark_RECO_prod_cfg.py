from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_Suu5TeV_chi1TeV_RECO_0001_RESUBMIT'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.JobType.allowUndistributedCMSSW = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'B2G-RunIISummer20UL18RECO-00001_1_cfg.py'
#config.JobType.maxMemoryMB = 4000

config.Data.inputDataset = '/SuuToChiChi_MSuu-5TeV_Mchi-1TeV_TuneCP5_13TeV-pythia8/ecannaer-B2G-RunIISummer20UL18p_HLT-b403a189a2d057e62e59ed092120c7f4/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.totalUnits = -1
config.Data.publication = True
config.Data.inputDBS = 'phys03'
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_RECO'

config.Site.storageSite = 'T3_US_FNALLPC'
