from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'MC_prod_cSuu8TeV_chi3TeV_HLT_0001'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.JobType.pluginName = 'Analysis'
config.JobType.allowUndistributedCMSSW = True

config.JobType.psetName = 'B2G-RunIISummer20UL18HLT-00001_1_cfg.py'
config.JobType.maxMemoryMB = 4000
config.Data.inputDataset = '/SuuToChiChi/ecannaer-B2G-RunIISummer20UL18p_ecannaer-SuuToChiChi_MSuu-8TeV_Mchi-3TeV_TuneCP5_13TeV-pythia8_DIGI-a03b32ff24c52459822077d23898e252/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.totalUnits = -1
config.Data.publication = True
config.Data.inputDBS = 'phys03'
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_MSuu-8TeV_Mchi-3TeV_TuneCP5_13TeV-pythia8_HLT'
config.Site.storageSite = 'T3_US_FNALLPC'
