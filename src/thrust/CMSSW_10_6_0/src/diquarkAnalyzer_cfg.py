import FWCore.ParameterSet.Config as cms

process = cms.Process("analysis")

process.load("Configuration.StandardSequences.FrontierConditions_GlobalTag_condDBv2_cff")
process.GlobalTag.globaltag = '92X_dataRun2_Prompt_v4'

process.diquarkAnalyzer = cms.EDAnalyzer("diquarkAnalyzer",
 
   fatJetCollection = cms.InputTag("slimmedJetsAK8"),
   genPartCollection = cms.InputTag("prunedGenParticles"),
   bits = cms.InputTag("TriggerResults", "", "HLT")
)

process.source = cms.Source("PoolSource",
   fileNames = cms.untracked.vstring("file:B2G-RunIIAutumn18MiniAOD-00001.root")
   #fileNames = cms.untracked.vstring("/store/mc/RunIIAutumn18MiniAOD/
)
process.TFileService = cms.Service("TFileService",fileName = cms.string("diquark_500GeV.root")
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
process.diquarkAnalyzer  #needs star 
   #process.printTree
)
