ifeq ($(strip $(DQMOffline/Trigger)),)
DQMOfflineTrigger := self/DQMOffline/Trigger
DQMOffline/Trigger := DQMOfflineTrigger
DQMOfflineTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMOfflineTrigger_EX_USE := $(foreach d, self cmssw CommonTools/TriggerUtils CommonTools/Utils CondFormats/DataRecord DQMServices/Core DataFormats/BTauReco DataFormats/CaloTowers DataFormats/EgammaCandidates DataFormats/EgammaReco DataFormats/HLTReco DataFormats/HeavyIonEvent DataFormats/JetReco DataFormats/METReco DataFormats/MuonReco DataFormats/RecoCandidate DataFormats/TauReco DataFormats/TrackReco DataFormats/TrajectorySeed FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry FWCore/Utilities HLTrigger/HLTcore JetMETCorrections/Objects RecoEcal/EgammaCoreTools RecoEgamma/EgammaHLTAlgos RecoEgamma/EgammaIsolationAlgos RecoJets/JetAlgorithms RecoJets/JetAssociationAlgorithms RecoJets/JetProducers root boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMOfflineTrigger_EX_LIB   := DQMOfflineTrigger
ALL_EXTERNAL_PRODS += DQMOfflineTrigger
DQMOfflineTrigger_CLASS := LIBRARY
DQMOffline/Trigger_relbigobj+=DQMOfflineTrigger
endif
ifeq ($(strip $(FWCore/Version)),)
FWCoreVersion := self/FWCore/Version
FWCore/Version := FWCoreVersion
FWCoreVersion_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreVersion_EX_USE := $(foreach d, self cmssw ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreVersion_EX_LIB   := FWCoreVersion
ALL_EXTERNAL_PRODS += FWCoreVersion
FWCoreVersion_CLASS := LIBRARY
FWCore/Version_relbigobj+=FWCoreVersion
endif
ifeq ($(strip $(DQMOfflineTriggerPlugins)),)
DQMOfflineTriggerPlugins := self/src/DQMOffline/Trigger/plugins
DQMOfflineTriggerPlugins_LOC_USE := self cmssw FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry DataFormats/RecoCandidate DataFormats/HLTReco DataFormats/MuonReco DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/TrackReco DataFormats/TrajectorySeed DataFormats/BTauReco DataFormats/TauReco DataFormats/METReco DataFormats/JetReco RecoEcal/EgammaCoreTools RecoEgamma/EgammaHLTAlgos HLTrigger/HLTcore CondFormats/DataRecord DQMServices/Core CommonTools/Utils CommonTools/TriggerUtils DataFormats/VertexReco DQMOffline/Trigger root roofit boost
ALL_EXTERNAL_PLUGIN_PRODS += DQMOfflineTriggerPlugins
DQMOffline/Trigger_relbigobj+=DQMOfflineTriggerPlugins
endif
