import FWCore.ParameterSet.Config as cms

process = cms.Process("analysis")

process.load("Configuration.StandardSequences.FrontierConditions_GlobalTag_condDBv2_cff")
process.GlobalTag.globaltag = '92X_dataRun2_Prompt_v4'

process.ttbarAnalyzer = cms.EDAnalyzer("ttbarAnalyzer",
   #genPartCollection = cms.InputTag("prunedGenParticles"),
   
   fatJetCollection = cms.InputTag("slimmedJetsAK8"),
   PUPPI_AK4Collection = cms.InputTag("slimmedJetsPuppi"),
   muonCollection = cms.InputTag("slimmedMuons"),
   bits = cms.InputTag("TriggerResults", "", "HLT")
)
  #genPartCollection = cms.InputTag("prunedGenParticles"),
process.source = cms.Source("PoolSource",

fileNames = cms.untracked.vstring(
"/store/mc/RunIIAutumn18MiniAOD/ZprimeToTT_M5000_W50_TuneCP2_PSweights_13TeV-madgraphMLM-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/80000/FD672775-AB9A-9E49-A661-6603CF1A7E94.root")
#"/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/FD15A642-B164-9942-A410-EBE9991827AA.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/F68799DB-2630-6F4A-ACC1-BEBE6CAC348D.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/F47F9770-3224-A64B-A8A9-F2C2B663434A.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/EF2610C9-ECB1-4542-849C-292254CE409B.root" ,"/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/EF25CB28-DB09-044F-AA64-758C54CD65E2.root" ,"/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/E721F5B7-8928-B14E-AE1C-53E164903DCB.root" ,"/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/E17293BF-1AFD-C349-B325-357D462AB2F1.root" ,"/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/DEBD99CA-3C11-0746-B5E0-04AC7E150986.root" ,"/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/D753B61C-0A05-FE49-B0C5-718FC9D95595.root" ,"/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/D2076A6F-9FEE-7E49-B7AD-7B2028E3CB9D.root" ,"/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/CB43BCA1-2F16-204A-A88A-B3181EFCED5A.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/A27D2C47-AEE0-C24E-BB4B-3B462B7E28A7.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/98986DB2-9A1A-8F43-B306-D5BCAAC8C0FE.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/97791FB3-CDAF-AE48-8D16-765D29D11161.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/96BBB396-2FD1-684C-B852-41237A2A8C6E.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/965B9DEB-8D3E-C441-BDCA-C2CBE1CE494D.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/8F863A4C-BA5D-B246-A4D1-393870399BE9.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/8EF5A092-804F-8A40-BBBA-259BA9864B64.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/8CA3E60C-F0D5-8548-AB70-B56351805A8E.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/8AB9E328-018B-C549-8FF3-CF21545F9AA7.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/855C7EA8-BD62-0042-9443-549C6A45B10A.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/81555E54-704B-AB40-ADE3-BA4274B0D7FD.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/8066E626-200F-7549-8750-A3CC22192362.root", "/store/mc/RunIIAutumn18MiniAOD/TTToSemiLeptonic_widthx1p3_TuneCP5_13TeV-powheg-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/90000/8016EF0E-8ABD-274D-AE32-BD23303CB17F.root" )


#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/283E4555-2060-2143-8E30-F0B9AF92D65A.root", 
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/27B00B71-0C5C-5B45-B7FA-BE42B02CBA9B.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/270718DF-7AFD-1242-9CD0-97DE4ECB3BBA.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/269C0E2E-5E38-1540-9657-8F5E4BED0547.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/254F97A7-ECB6-6946-BE03-FA32613B8D68.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/239A99F4-2A7A-C340-AACB-BE47E83DE969.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/2378295D-D168-7F4C-9CA2-C2C730F2DC23.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/22994C4E-3635-2B4D-9394-9A376B59C591.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/225399D7-B37C-6C4C-AE91-309222939175.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/21F2A6F1-C18C-CE41-992C-ECD23E24CE3C.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/21ED900E-11B3-6E48-A133-D71912C85243.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/21A282BE-964A-7045-9614-CF56688B7628.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/218D374E-8B6E-4349-ADAE-6D1669FB9663.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1FE19E9E-E689-7445-8C4B-85A1EB4E8ADA.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1ECA3BC4-3EFC-5943-81E5-B921D7E615ED.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1E867A59-8002-9F4E-8868-22E0A2C90146.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1E68B991-9AA1-1D49-85E3-339E2085F11A.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1DCED38A-44E8-E44A-8AA2-58DBD2CD55DF.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1D98EFF7-999F-A94A-8030-808709D77B18.root",
#"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1D54461F-4C45-054B-B752-BFF229EB68BF.root")
   #fileNames = cms.untracked.vstring("file:B2G-RunIIAutumn18MiniAOD-00001.root")
   #fileNames = cms.untracked.vstring("/store/mc/RunIIAutumn18MiniAOD/
)
process.TFileService = cms.Service("TFileService",
   fileName = cms.string("QCD_diquark_test.root")
)

process.maxEvents = cms.untracked.PSet(
   input = cms.untracked.int32(3000000)
)

process.options = cms.untracked.PSet(
   wantSummary = cms.untracked.bool(True),
)

process.load("FWCore.MessageLogger.MessageLogger_cfi")
process.MessageLogger.cerr.FwkReport.reportEvery = 1000

process.load("SimGeneral.HepPDTESSource.pythiapdt_cfi")

"""process.printTree = cms.EDAnalyzer("ParticleTreeDrawer",

   src = cms.InputTag("prunedGenParticles"),

   printP4 = cms.untracked.bool(False),

   printPtEtaPhi = cms.untracked.bool(False),

   printVertex = cms.untracked.bool(False),

   printStatus = cms.untracked.bool(True),

   printIndex = cms.untracked.bool(False),

   #status = cms.untracked.vint32(3),

)
"""
process.p = cms.Path(
process.ttbarAnalyzer  #needs star 
   #process.printTree
)
