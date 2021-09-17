import FWCore.ParameterSet.Config as cms

process = cms.Process("analysis")

process.load("Configuration.StandardSequences.FrontierConditions_GlobalTag_condDBv2_cff")
process.GlobalTag.globaltag = '92X_dataRun2_Prompt_v4'

process.genPartAnalyzer = cms.EDAnalyzer("genPartAnalyzer",
   genPartCollection = cms.InputTag("prunedGenParticles"),
   genJetCollection  = cms.InputTag("slimmedGenJetsAK8"),
   fatJetCollection = cms.InputTag("slimmedJetsAK8"),
   packedPFCandidateCollection = cms.InputTag("packedPFCandidates")
)

process.source = cms.Source("PoolSource",
   fileNames = cms.untracked.vstring("/store/mc/RunIIAutumn18MiniAOD/RadionToZZ_narrow_M-800_TuneCP5_13TeV-madgraph/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/240000/02CA6C99-E394-9146-AF4B-266548B44DB5.root")
   #fileNames = cms.untracked.vstring("/store/mc/RunIIAutumn18MiniAOD/ZZ_TuneCP5_13TeV-pythia8/MINIAODSIM/102X_upgrade2018_realistic_v15-v2/80000/C0F0CBF5-E942-F840-8347-B6190D10EF7F.root")
	#fileNames = cms.untracked.vstring("/store/mc/RunIIAutumn18MiniAOD/BulkGraviton_ZZ_ZhadZhad_narrow_M5500_TuneCP5_13TeV/MINIAODSIM/102X_upgrade2018_realistic_v15-v1/20000/FDBFF03D-5448-2548-99A3-8B248A9692FB.root")
)
process.TFileService = cms.Service("TFileService",
   fileName = cms.string("genPart.root")
)

process.maxEvents = cms.untracked.PSet(
   input = cms.untracked.int32(1000)
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
   process.genPartAnalyzer  #needs star 
   #process.printTree
)






