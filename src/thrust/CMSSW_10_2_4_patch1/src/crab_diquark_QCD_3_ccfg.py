
from CRABClient.UserUtilities import config
config = config()
config.General.requestName = 'semilept_ttbar_QCD_background_data_005'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.JobType.allowUndistributedCMSSW = True
config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'ttbarAnalyzer_cfg.py'
config.Data.inputDataset = '/SingleMuon/Run2018D-PromptReco-v2/MINIAOD'
#config.Data.inputDataset = '/TTToSemiLeptonic_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18MiniAOD-102X_upgrade2018_realistic_v15-v1/MINIAODSIM'
config.Data.publication = False
config.Data.inputDBS = 'global'
config.Data.splitting = 'Automatic'
config.Data.lumiMask = 'Cert_314472-325175_13TeV_17SeptEarlyReReco2018ABC_PromptEraD_Collisions18_JSON.txt'
config.Data.outputDatasetTag = 'semilept_ttbar_QCD_background'
config.Site.storageSite = 'T3_US_FNALLPC'
