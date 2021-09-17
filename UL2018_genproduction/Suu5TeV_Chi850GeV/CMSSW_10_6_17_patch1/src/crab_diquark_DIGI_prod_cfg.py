from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_chi850GeV_Suu5TeV_DIGI_0001'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.JobType.pluginName = 'Analysis'
config.JobType.allowUndistributedCMSSW = True

config.JobType.psetName = 'B2G-RunIISummer20UL18DIGIPremix-00001_1_cfg.py'
config.JobType.maxMemoryMB = 4000
config.Data.inputDataset = '/SuuToChiChi/ecannaer-B2G-RunIISummer20UL18p_Suu5TeV_chi850GeV_GENSIM-57659a2622a16276bbfdccbd540cfc3b/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.totalUnits = -1
config.Data.publication = True
config.Data.inputDBS = 'phys03'
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_Suu5TeV_chi850GeV_DIGI'

config.Site.storageSite = 'T3_US_FNALLPC'
