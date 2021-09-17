from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_Suu4TeV_chi500GeV_HLT_0001'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.JobType.pluginName = 'Analysis'
config.JobType.allowUndistributedCMSSW = True

config.JobType.psetName = 'B2G-RunIISummer20UL18HLT-00001_1_cfg.py'
config.JobType.maxMemoryMB = 4000
config.Data.inputDataset = '/SuuToChiChi_MSuu-4TeV_Mchi-500GeV_TuneCP5_13TeV-pythia8/ecannaer-B2G-RunIISummer20UL18p_Suu4TeV_chi500GeV_DIGI-a03b32ff24c52459822077d23898e252/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.totalUnits = -1
config.Data.publication = True
config.Data.inputDBS = 'phys03'
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_HLT'

config.Site.storageSite = 'T3_US_FNALLPC'
