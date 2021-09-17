from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_cSuu6TeV_chi1p5TeV_ALLDECAY_DIGI_0001'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.JobType.pluginName = 'Analysis'
config.JobType.allowUndistributedCMSSW = True

config.JobType.psetName = 'B2G-RunIISummer20UL18DIGIPremix-00001_1_cfg.py'
config.JobType.maxMemoryMB = 4000
config.Data.inputDataset = '/SuuToChiChi/ecannaer-SuuToChiChi_ALLDECAY_MSuu-6TeV_Mchi-1p5TeV_TuneCP5_13TeV-pythia8-992da33ca39bcce7d8b00aab0d4d9581/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.totalUnits = -1
config.Data.publication = True
config.Data.inputDBS = 'phys03'
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_ecannaer-SuuToChiChi_ALLDECAY_MSuu-6TeV_Mchi-1p5TeV_TuneCP5_13TeV-pythia8_DIGI'

config.Site.storageSite = 'T3_US_FNALLPC'
