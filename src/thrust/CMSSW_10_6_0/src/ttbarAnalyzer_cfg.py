import FWCore.ParameterSet.Config as cms

process = cms.Process("analysis")

process.load("Configuration.StandardSequences.FrontierConditions_GlobalTag_condDBv2_cff")
process.GlobalTag.globaltag = '92X_dataRun2_Prompt_v4'

process.ttbarAnalyzer = cms.EDAnalyzer("ttbarAnalyzer",
 
   fatJetCollection = cms.InputTag("slimmedJetsAK8"),
   PUPPI_AK4Collection = cms.InputTag("slimmedJetsPuppi"),
   muonCollection = cms.InputTag("slimmedMuons"),
   bits = cms.InputTag("TriggerResults", "", "HLT")
)
  #genPartCollection = cms.InputTag("prunedGenParticles"),
process.source = cms.Source("PoolSource",

fileNames = cms.untracked.vstring(
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/283E4555-2060-2143-8E30-F0B9AF92D65A.root", 
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/27B00B71-0C5C-5B45-B7FA-BE42B02CBA9B.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/270718DF-7AFD-1242-9CD0-97DE4ECB3BBA.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/269C0E2E-5E38-1540-9657-8F5E4BED0547.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/254F97A7-ECB6-6946-BE03-FA32613B8D68.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/239A99F4-2A7A-C340-AACB-BE47E83DE969.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/2378295D-D168-7F4C-9CA2-C2C730F2DC23.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/22994C4E-3635-2B4D-9394-9A376B59C591.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/225399D7-B37C-6C4C-AE91-309222939175.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/21F2A6F1-C18C-CE41-992C-ECD23E24CE3C.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/21ED900E-11B3-6E48-A133-D71912C85243.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/21A282BE-964A-7045-9614-CF56688B7628.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/218D374E-8B6E-4349-ADAE-6D1669FB9663.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1FE19E9E-E689-7445-8C4B-85A1EB4E8ADA.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1ECA3BC4-3EFC-5943-81E5-B921D7E615ED.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1E867A59-8002-9F4E-8868-22E0A2C90146.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1E68B991-9AA1-1D49-85E3-339E2085F11A.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1DCED38A-44E8-E44A-8AA2-58DBD2CD55DF.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1D98EFF7-999F-A94A-8030-808709D77B18.root",
"root://cmsxrootd.fnal.gov//store/data/Run2018A/SingleMuon/MINIAOD/17Sep2018-v2/110000/1D54461F-4C45-054B-B752-BFF229EB68BF.root")

   #fileNames = cms.untracked.vstring("file:B2G-RunIIAutumn18MiniAOD-00001.root")
   #fileNames = cms.untracked.vstring("/store/mc/RunIIAutumn18MiniAOD/
)
process.TFileService = cms.Service("TFileService",
   fileName = cms.string("QCD_ttbar.root")
)

process.maxEvents = cms.untracked.PSet(
   input = cms.untracked.int32(5000000)
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
