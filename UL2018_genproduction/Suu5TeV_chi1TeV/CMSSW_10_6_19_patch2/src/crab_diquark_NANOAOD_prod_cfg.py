from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_Suu5TeV_chi1TeV_NANOAOD_0001'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.JobType.allowUndistributedCMSSW = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'B2G-RunIISummer20UL17NanoAODv2-00001_1_cfg.py'
#config.JobType.maxMemoryMB = 4000

config.Data.inputDataset = '/SuuToChiChi/ecannaer-B2G-RunIISummer20UL18p_Suu5TeV_chi1TeV_MINIAOD-07bb2832fd9cf08ee8da01c42829422a/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.totalUnits = -1
config.Data.publication = True
config.Data.inputDBS = 'phys03'
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_Suu5TeV_chi1TeV_NANOAOD'

config.Site.storageSite = 'T3_US_FNALLPC'
