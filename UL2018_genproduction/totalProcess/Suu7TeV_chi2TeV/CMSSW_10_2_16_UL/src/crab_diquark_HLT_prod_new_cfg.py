from CRABClient.UserUtilities import config
config = config()
config.General.requestName = 'MC_prod_Suu7TeV_chi2TeV_ALL_DECAYS_HLT_0001'
config.General.workArea = '/uscms_data/d3/cannaert/UL2018_genproduction/totalProcess/Suu7TeV_chi2TeV/CMSSW_10_2_16_UL//crab_projects'
config.General.transferOutputs = True
config.JobType.pluginName = 'Analysis'
config.JobType.allowUndistributedCMSSW = True
config.JobType.psetName = '/uscms_data/d3/cannaert/UL2018_genproduction/totalProcess/Suu7TeV_chi2TeV/CMSSW_10_2_16_UL//src/B2G-RunIISummer20UL18HLT-00001_1_cfg.py'
config.JobType.maxMemoryMB = 4000
config.Data.inputDataset = '/SuuToChiChi/ecannaer-B2G-RunIISummer20UL18p_ecannaer-SuuToChiChi_ALLDECAY_MSuu-7TeV_Mchi-3TeV_TuneCP5_13TeV-pythia8_DIGI-9adadcc17762fca403271264a38b5935/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.totalUnits = -1
config.Data.publication = True
config.Data.inputDBS = 'phys03'
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_Suu7TeV_chi2TeV_ALLDECAYS_TuneCP5_13TeV-pythia8_HLT'
config.Site.storageSite = 'T3_US_FNALLPC'
