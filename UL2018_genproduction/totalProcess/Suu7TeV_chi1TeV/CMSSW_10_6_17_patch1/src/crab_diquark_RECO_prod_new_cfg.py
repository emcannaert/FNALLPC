from CRABClient.UserUtilities import config
config = config()
config.General.requestName = 'MC_prod_Suu7TeV_chi1TeV_ALL_DECAYS_RECO_0002'
config.General.workArea = '/uscms_data/d3/cannaert/UL2018_genproduction/totalProcess/Suu7TeV_chi1TeV/CMSSW_10_6_17_patch1//src/crab_projects'
config.General.transferOutputs = True
config.JobType.allowUndistributedCMSSW = True
config.JobType.pluginName = 'Analysis'
config.JobType.psetName = '/uscms_data/d3/cannaert/UL2018_genproduction/totalProcess/Suu7TeV_chi1TeV/CMSSW_10_6_17_patch1//src/B2G-RunIISummer20UL18RECO-00001_1_cfg.py'
#config.JobType.maxMemoryMB = 4000
config.Data.inputDataset = '/SuuToChiChi/ecannaer-B2G-RunIISummer20UL18p_Suu7TeV_chi1TeV_ALLDECAYS_TuneCP5_13TeV-pythia8_HLT-b403a189a2d057e62e59ed092120c7f4/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.totalUnits = -1
config.Data.publication = True
config.Data.inputDBS = 'phys03'
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_Suu7TeV_chi1TeV_ALLDECAYS_TuneCP5_13TeV-pythia8_RECO'
config.Site.storageSite = 'T3_US_FNALLPC'
