import FWCore.ParameterSet.Config as cms

process = cms.Process("analysis")

process.load("Configuration.StandardSequences.FrontierConditions_GlobalTag_condDBv2_cff")
process.GlobalTag.globaltag = '92X_dataRun2_Prompt_v4'

process.diquarkAnalyzerBR = cms.EDAnalyzer("diquarkAnalyzerBR",
 
   fatJetCollection = cms.InputTag("slimmedJetsAK8"),
   bits = cms.InputTag("TriggerResults", "", "HLT")
)

process.source = cms.Source("PoolSource",

fileNames = cms.untracked.vstring("root://cmsxrootd.fnal.gov//store/data/Run2018A/JetHT/MINIAOD/17Sep2018-v1/00000/00A64001-F644-8740-AC48-14CD4E623E40.root")

   #fileNames = cms.untracked.vstring("file:B2G-RunIIAutumn18MiniAOD-00001.root")
   #fileNames = cms.untracked.vstring("/store/mc/RunIIAutumn18MiniAOD/
)
process.TFileService = cms.Service("TFileService",
   fileName = cms.string("diquarkBR_500GeV.root")
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
process.diquarkAnalyzerBR  #needs star 
   #process.printTree
)
