from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_Suu8TeV_chi3TeV_ALLDECAYS_RECO_0001_RESUBMIT'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.JobType.allowUndistributedCMSSW = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'B2G-RunIISummer20UL18RECO-00001_1_cfg.py'
#config.JobType.maxMemoryMB = 4000

config.Data.inputDataset = '/SuuToChiChi/ecannaer-B2G-RunIISummer20UL18p_MSuu-8TeV_Mchi-3TeV_ALLDECAYS_TuneCP5_13TeV-pythia8_HLT-b403a189a2d057e62e59ed092120c7f4/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.totalUnits = -1
config.Data.publication = True
config.Data.inputDBS = 'phys03'
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'TuneCP5_13TeV-pythia8-B2G-RunIISummer20UL18p_Suu8TeV_chi3TeV_ALLDECAYS_RECO'

config.Site.storageSite = 'T3_US_FNALLPC'
