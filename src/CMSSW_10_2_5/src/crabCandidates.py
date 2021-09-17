from CRABClient.UserUtilities import config, getUsernameFromSiteDB
config = config()

config.General.requestName = 'DoubleMuon_Run2017B-PromptReco-v1_MINIAOD'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.General.transferLogs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'muonAnalyzer_cfg.py'

config.Data.inputDataset = '/DoubleMuon/Run2017B-PromptReco-v1/MINIAOD'
config.Data.runRange = '297031-297065'
config.Data.inputDBS = 'global'
config.Data.splitting = 'LumiBased'
config.Data.unitsPerJob = 50
config.Data.lumiMask = '/afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions17/13TeV/DCSOnly/json_DCSONLY.txt'

config.Site.storageSite = 'T3_US_Colorado'
