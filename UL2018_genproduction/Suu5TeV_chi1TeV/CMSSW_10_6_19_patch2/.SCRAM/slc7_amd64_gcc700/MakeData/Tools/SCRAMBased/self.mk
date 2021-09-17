ifeq ($(strip $(AlignmentMillePedeAlignmentAlgorithmAuto)),)
AlignmentMillePedeAlignmentAlgorithmAuto := self/src/Alignment/MillePedeAlignmentAlgorithm/plugins
AlignmentMillePedeAlignmentAlgorithmAuto_LOC_USE := self cmssw FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry CommonTools/UtilAlgos CondFormats/Common CondFormats/GeometryObjects DataFormats/HepMCCandidate DataFormats/TrackerCommon Geometry/TrackerGeometryBuilder DQMServices/Core Alignment/MillePedeAlignmentAlgorithm classlib
ALL_EXTERNAL_PLUGIN_PRODS += AlignmentMillePedeAlignmentAlgorithmAuto
Alignment/MillePedeAlignmentAlgorithm_relbigobj+=AlignmentMillePedeAlignmentAlgorithmAuto
endif
ifeq ($(strip $(Alignment/MillePedeAlignmentAlgorithm)),)
AlignmentMillePedeAlignmentAlgorithm := self/Alignment/MillePedeAlignmentAlgorithm
Alignment/MillePedeAlignmentAlgorithm := AlignmentMillePedeAlignmentAlgorithm
AlignmentMillePedeAlignmentAlgorithm_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentMillePedeAlignmentAlgorithm_EX_USE := $(foreach d, self cmssw Alignment/CommonAlignment Alignment/CommonAlignmentAlgorithm Alignment/CommonAlignmentParametrization Alignment/MuonAlignment Alignment/SurveyAnalysis Alignment/ReferenceTrajectories CondFormats/PCLConfig DataFormats/CLHEP DataFormats/SiStripDetId DataFormats/GeometryVector DataFormats/TrackReco FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager Geometry/CommonDetUnit rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentMillePedeAlignmentAlgorithm_EX_LIB   := AlignmentMillePedeAlignmentAlgorithm
ALL_EXTERNAL_PRODS += AlignmentMillePedeAlignmentAlgorithm
AlignmentMillePedeAlignmentAlgorithm_CLASS := LIBRARY
Alignment/MillePedeAlignmentAlgorithm_relbigobj+=AlignmentMillePedeAlignmentAlgorithm
endif
ifeq ($(strip $(CommonToolsPileupAlgos_plugins)),)
CommonToolsPileupAlgos_plugins := self/src/CommonTools/PileupAlgos/plugins
CommonToolsPileupAlgos_plugins_LOC_USE := self cmssw DataFormats/ParticleFlowCandidate DataFormats/JetReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet JetMETCorrections/Objects CommonTools/Utils CommonTools/ParticleFlow CommonTools/PileupAlgos fastjet fastjet-contrib
ALL_EXTERNAL_PLUGIN_PRODS += CommonToolsPileupAlgos_plugins
CommonTools/PileupAlgos_relbigobj+=CommonToolsPileupAlgos_plugins
endif
ifeq ($(strip $(CommonTools/PileupAlgos)),)
CommonToolsPileupAlgos := self/CommonTools/PileupAlgos
CommonTools/PileupAlgos := CommonToolsPileupAlgos
CommonToolsPileupAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsPileupAlgos_EX_USE := $(foreach d, self cmssw DataFormats/Common DataFormats/ParticleFlowCandidate FWCore/ParameterSet root rootcore fastjet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsPileupAlgos_EX_LIB   := CommonToolsPileupAlgos
ALL_EXTERNAL_PRODS += CommonToolsPileupAlgos
CommonToolsPileupAlgos_CLASS := LIBRARY
CommonTools/PileupAlgos_relbigobj+=CommonToolsPileupAlgos
endif
ifeq ($(strip $(CondCoreESSourcesPlugins)),)
CondCoreESSourcesPlugins := self/src/CondCore/ESSources/plugins
CondCoreESSourcesPlugins_LOC_USE := self cmssw FWCore/Framework CondCore/ESSources
ALL_EXTERNAL_PLUGIN_PRODS += CondCoreESSourcesPlugins
CondCore/ESSources_relbigobj+=CondCoreESSourcesPlugins
endif
ifeq ($(strip $(CondCore/ESSources)),)
CondCoreESSources := self/CondCore/ESSources
CondCore/ESSources := CondCoreESSources
CondCoreESSources_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreESSources_EX_USE := $(foreach d, self cmssw FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CondCore/CondDB,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreESSources_EX_LIB   := CondCoreESSources
ALL_EXTERNAL_PRODS += CondCoreESSources
CondCoreESSources_CLASS := LIBRARY
CondCore/ESSources_relbigobj+=CondCoreESSources
endif
ifeq ($(strip $(DQM/CastorMonitor)),)
DQMCastorMonitor := self/DQM/CastorMonitor
DQM/CastorMonitor := DQMCastorMonitor
DQMCastorMonitor_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMCastorMonitor_EX_USE := $(foreach d, self cmssw DataFormats/HcalDetId DataFormats/HcalRecHit DataFormats/HcalDigi CondFormats/CastorObjects CalibFormats/CastorObjects DataFormats/JetReco EventFilter/CastorRawToDigi Geometry/CaloGeometry FWCore/ParameterSet FWCore/Framework FWCore/MessageLogger DQMServices/Core DQMServices/Components DataFormats/FEDRawData rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += DQMCastorMonitor
DQMCastorMonitor_CLASS := LIBRARY
DQM/CastorMonitor_relbigobj+=DQMCastorMonitor
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
ifeq ($(strip $(FireworksFWInterfacePlugin)),)
FireworksFWInterfacePlugin := self/src/Fireworks/FWInterface/plugins
FireworksFWInterfacePlugin_LOC_LIB   := Geom Eve
FireworksFWInterfacePlugin_LOC_USE := self cmssw FWCore/PluginManager FWCore/Framework Fireworks/FWInterface CondFormats/DataRecord CondFormats/RunInfo SimDataFormats/Track SimDataFormats/TrackingHit SimDataFormats/CaloHit SimDataFormats/Vertex SimDataFormats/TrackingAnalysis SimGeneral/TrackingAnalysis rootcore
ALL_EXTERNAL_PLUGIN_PRODS += FireworksFWInterfacePlugin
Fireworks/FWInterface_relbigobj+=FireworksFWInterfacePlugin
endif
ifeq ($(strip $(Fireworks/FWInterface)),)
FireworksFWInterface := self/Fireworks/FWInterface
Fireworks/FWInterface := FireworksFWInterface
FireworksFWInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksFWInterface_EX_USE := $(foreach d, self cmssw FWCore/PluginManager FWCore/Framework DataFormats/Provenance DataFormats/TrackReco TrackingTools/TrajectoryState TrackingTools/PatternTools CondFormats/DataRecord CondFormats/RunInfo Fireworks/Core Fireworks/Geometry rootcore rootinteractive boost_python FWCore/PythonParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksFWInterface_LCGDICTS  := x 
FireworksFWInterface_EX_LIB   := FireworksFWInterface
ALL_EXTERNAL_PRODS += FireworksFWInterface
FireworksFWInterface_CLASS := LIBRARY
Fireworks/FWInterface_relbigobj+=FireworksFWInterface
endif
ifeq ($(strip $(FireworksGeometryMFProducerPlugin)),)
FireworksGeometryMFProducerPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryMFProducerPlugin_LOC_USE := self cmssw FWCore/Framework FWCore/PluginManager FWCore/ParameterSet clhep MagneticField/Engine MagneticField/Records rootgpad
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryMFProducerPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryMFProducerPlugin
endif
ifeq ($(strip $(FireworksGeometryFWRecoGeometryESProducerPlugin)),)
FireworksGeometryFWRecoGeometryESProducerPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryFWRecoGeometryESProducerPlugin_LOC_USE := self cmssw Fireworks/Geometry
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryFWRecoGeometryESProducerPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryFWRecoGeometryESProducerPlugin
endif
ifeq ($(strip $(FireworksGeometryDumpSimGeometryPlugin)),)
FireworksGeometryDumpSimGeometryPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryDumpSimGeometryPlugin_LOC_LIB   := Geom
FireworksGeometryDumpSimGeometryPlugin_LOC_USE := self cmssw Fireworks/Geometry FWCore/Framework FWCore/PluginManager FWCore/ParameterSet
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryDumpSimGeometryPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryDumpSimGeometryPlugin
endif
ifeq ($(strip $(FireworksGeometryDumpFWRecoGeometryPlugin)),)
FireworksGeometryDumpFWRecoGeometryPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryDumpFWRecoGeometryPlugin_LOC_LIB   := Eve Geom
FireworksGeometryDumpFWRecoGeometryPlugin_LOC_USE := self cmssw Fireworks/Geometry rootcore FWCore/Framework FWCore/PluginManager FWCore/ParameterSet Geometry/CaloGeometry Geometry/DTGeometry Geometry/CSCGeometry Geometry/RPCGeometry Geometry/TrackerGeometryBuilder Geometry/Records
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryDumpFWRecoGeometryPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryDumpFWRecoGeometryPlugin
endif
ifeq ($(strip $(FireworksGeometryPlugins)),)
FireworksGeometryPlugins := self/src/Fireworks/Geometry/plugins
FireworksGeometryPlugins_LOC_LIB   := Eve Geom
FireworksGeometryPlugins_LOC_USE := self cmssw Geometry/Records Fireworks/Geometry rootgpad
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryPlugins
Fireworks/Geometry_relbigobj+=FireworksGeometryPlugins
endif
ifeq ($(strip $(FireworksGeometryDumpFWTGeoRecoGeometryPlugin)),)
FireworksGeometryDumpFWTGeoRecoGeometryPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryDumpFWTGeoRecoGeometryPlugin_LOC_LIB   := Eve Geom
FireworksGeometryDumpFWTGeoRecoGeometryPlugin_LOC_USE := self cmssw Fireworks/Geometry rootcore FWCore/Framework FWCore/PluginManager FWCore/ParameterSet Geometry/CaloGeometry Geometry/DTGeometry Geometry/CSCGeometry Geometry/RPCGeometry Geometry/TrackerGeometryBuilder Geometry/Records
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryDumpFWTGeoRecoGeometryPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryDumpFWTGeoRecoGeometryPlugin
endif
ifeq ($(strip $(FireworksDisplayGeomPlugin)),)
FireworksDisplayGeomPlugin := self/src/Fireworks/Geometry/plugins
FireworksDisplayGeomPlugin_LOC_LIB   := Eve Geom Physics
FireworksDisplayGeomPlugin_LOC_USE := self cmssw FWCore/Framework Fireworks/Geometry Fireworks/Eve MagneticField/Engine MagneticField/Records
ALL_EXTERNAL_PLUGIN_PRODS += FireworksDisplayGeomPlugin
Fireworks/Geometry_relbigobj+=FireworksDisplayGeomPlugin
endif
ifeq ($(strip $(FireworksGeometryValidateGeometryPlugin)),)
FireworksGeometryValidateGeometryPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryValidateGeometryPlugin_LOC_LIB   := Geom
FireworksGeometryValidateGeometryPlugin_LOC_USE := self cmssw FWCore/Framework Geometry/RPCGeometry Geometry/DTGeometry Geometry/CSCGeometry Geometry/CaloGeometry Geometry/TrackerGeometryBuilder Geometry/Records Fireworks/Core Fireworks/Tracks rootcore
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryValidateGeometryPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryValidateGeometryPlugin
endif
ifeq ($(strip $(FireworksGeometryTGeoMgrFromDddPlugin)),)
FireworksGeometryTGeoMgrFromDddPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryTGeoMgrFromDddPlugin_LOC_USE := self cmssw Fireworks/Geometry
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryTGeoMgrFromDddPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryTGeoMgrFromDddPlugin
endif
ifeq ($(strip $(FireworksGeometryFWTGeoRecoGeometryESProducerPlugin)),)
FireworksGeometryFWTGeoRecoGeometryESProducerPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryFWTGeoRecoGeometryESProducerPlugin_LOC_USE := self cmssw Fireworks/Geometry
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryFWTGeoRecoGeometryESProducerPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryFWTGeoRecoGeometryESProducerPlugin
endif
ifeq ($(strip $(Fireworks/Geometry)),)
FireworksGeometry := self/Fireworks/Geometry
Fireworks/Geometry := FireworksGeometry
FireworksGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksGeometry_EX_USE := $(foreach d, self cmssw FWCore/PluginManager FWCore/Framework FWCore/MessageLogger Geometry/CommonDetUnit Geometry/MuonNumbering Geometry/EcalCommonData Geometry/CSCGeometryBuilder DetectorDescription/Core Geometry/CaloGeometry Geometry/HGCalGeometry Geometry/DTGeometry Geometry/CSCGeometry Geometry/RPCGeometry Geometry/GEMGeometry Geometry/TrackerGeometryBuilder Geometry/Records DataFormats/GeometrySurface DataFormats/MuonDetId DataFormats/SiStripDetId DataFormats/SiPixelDetId Fireworks/Core rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksGeometry_EX_LIB   := FireworksGeometry
ALL_EXTERNAL_PRODS += FireworksGeometry
FireworksGeometry_CLASS := LIBRARY
Fireworks/Geometry_relbigobj+=FireworksGeometry
endif
ifeq ($(strip $(GeneratorInterfaceRivetInterface_plugins)),)
GeneratorInterfaceRivetInterface_plugins := self/src/GeneratorInterface/RivetInterface/plugins
GeneratorInterfaceRivetInterface_plugins_LOC_USE := self cmssw FWCore/Framework FWCore/ServiceRegistry SimDataFormats/GeneratorProducts GeneratorInterface/Core DataFormats/Common rivet yoda gsl tinyxml2 DQMServices/Core SimGeneral/HepPDTRecord DataFormats/HepMCCandidate DataFormats/JetReco DataFormats/METReco DataFormats/PatCandidates
ALL_EXTERNAL_PLUGIN_PRODS += GeneratorInterfaceRivetInterface_plugins
GeneratorInterface/RivetInterface_relbigobj+=GeneratorInterfaceRivetInterface_plugins
endif
ifeq ($(strip $(GeneratorInterface/RivetInterface)),)
GeneratorInterfaceRivetInterface := self/GeneratorInterface/RivetInterface
GeneratorInterface/RivetInterface := GeneratorInterfaceRivetInterface
GeneratorInterfaceRivetInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceRivetInterface_EX_USE := $(foreach d, self cmssw rivet yoda fastjet clhep boost gsl root GeneratorInterface/Core GeneratorInterface/Pythia6Interface,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += GeneratorInterfaceRivetInterface
GeneratorInterfaceRivetInterface_CLASS := LIBRARY
GeneratorInterface/RivetInterface_relbigobj+=GeneratorInterfaceRivetInterface
endif
ifeq ($(strip $(GeometryHGCalGeometryPlugins)),)
GeometryHGCalGeometryPlugins := self/src/Geometry/HGCalGeometry/plugins
GeometryHGCalGeometryPlugins_LOC_USE := self cmssw FWCore/Framework FWCore/ParameterSet Geometry/HGCalGeometry Geometry/CaloTopology Geometry/Records CondFormats/GeometryObjects
ALL_EXTERNAL_PLUGIN_PRODS += GeometryHGCalGeometryPlugins
Geometry/HGCalGeometry_relbigobj+=GeometryHGCalGeometryPlugins
endif
ifeq ($(strip $(Geometry/HGCalGeometry)),)
GeometryHGCalGeometry := self/Geometry/HGCalGeometry
Geometry/HGCalGeometry := GeometryHGCalGeometry
GeometryHGCalGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryHGCalGeometry_EX_USE := $(foreach d, self cmssw DataFormats/EcalDetId DataFormats/ForwardDetId DataFormats/Common CommonTools/UtilAlgos FWCore/Framework FWCore/ParameterSet FWCore/PluginManager Geometry/CaloGeometry Geometry/CaloTopology Geometry/HGCalCommonData MagneticField/Engine TrackingTools/TrajectoryState TrackingTools/GeomPropagators,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryHGCalGeometry_EX_LIB   := GeometryHGCalGeometry
ALL_EXTERNAL_PRODS += GeometryHGCalGeometry
GeometryHGCalGeometry_CLASS := LIBRARY
Geometry/HGCalGeometry_relbigobj+=GeometryHGCalGeometry
endif
ifeq ($(strip $(GeometryHcalCommonDataPlugins)),)
GeometryHcalCommonDataPlugins := self/src/Geometry/HcalCommonData/plugins
GeometryHcalCommonDataPlugins_LOC_USE := self cmssw FWCore/Framework FWCore/ParameterSet Geometry/Records Geometry/HcalCommonData CondFormats/GeometryObjects
ALL_EXTERNAL_PLUGIN_PRODS += GeometryHcalCommonDataPlugins
Geometry/HcalCommonData_relbigobj+=GeometryHcalCommonDataPlugins
endif
ifeq ($(strip $(Geometry/HcalCommonData)),)
GeometryHcalCommonData := self/Geometry/HcalCommonData
Geometry/HcalCommonData := GeometryHcalCommonData
GeometryHcalCommonData_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryHcalCommonData_EX_USE := $(foreach d, self cmssw DetectorDescription/Core DataFormats/HcalDetId clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryHcalCommonData_EX_LIB   := GeometryHcalCommonData
ALL_EXTERNAL_PRODS += GeometryHcalCommonData
GeometryHcalCommonData_CLASS := LIBRARY
Geometry/HcalCommonData_relbigobj+=GeometryHcalCommonData
endif
ifeq ($(strip $(PhysicsTools/NanoAOD)),)
src_PhysicsTools_NanoAOD := self/PhysicsTools/NanoAOD
PhysicsTools/NanoAOD  := src_PhysicsTools_NanoAOD
src_PhysicsTools_NanoAOD_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_PhysicsTools_NanoAOD_EX_USE := $(foreach d, DataFormats/NanoAOD boost DataFormats/Common self cmssw DataFormats/Candidate fastjet-contrib fastjet DataFormats/StdDictionaries FWCore/Common FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_PhysicsTools_NanoAOD
endif

ifeq ($(strip $(PhysicsToolsNanoAODPlugins)),)
PhysicsToolsNanoAODPlugins := self/src/PhysicsTools/NanoAOD/plugins
PhysicsToolsNanoAODPlugins_LOC_USE := self cmssw PhysicsTools/TensorFlow FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities DataFormats/Candidate DataFormats/PatCandidates CommonTools/MVAUtils RecoEgamma/EgammaTools PhysicsTools/JetMCUtils DataFormats/NanoAOD roothistmatrix RecoVertex/VertexTools RecoVertex/VertexPrimitives DataFormats/L1TGlobal IOPool/Provenance DQMServices/Core CondFormats/BTauObjects CondTools/BTau fastjet fastjet-contrib
ALL_EXTERNAL_PLUGIN_PRODS += PhysicsToolsNanoAODPlugins
PhysicsTools/NanoAOD_relbigobj+=PhysicsToolsNanoAODPlugins
endif
ifeq ($(strip $(PhysicsToolsPatAlgos_plugins)),)
PhysicsToolsPatAlgos_plugins := self/src/PhysicsTools/PatAlgos/plugins
PhysicsToolsPatAlgos_plugins_LOC_USE := self cmssw PhysicsTools/PatAlgos PhysicsTools/TensorFlow FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/MessageService L1Trigger/GlobalTriggerAnalyzer HLTrigger/HLTcore DataFormats/PatCandidates DataFormats/BTauReco DataFormats/JetReco DataFormats/MuonReco DataFormats/TrackReco DataFormats/Candidate DataFormats/HeavyIonEvent DataFormats/HepMCCandidate PhysicsTools/PatUtils CondFormats/JetMETObjects CommonTools/CandAlgos CommonTools/MVAUtils JetMETCorrections/Objects JetMETCorrections/JetCorrector TrackingTools/TransientTrack SimDataFormats/Track SimDataFormats/Vertex SimDataFormats/JetMatching SimGeneral/HepPDTRecord RecoMET/METAlgorithms RecoEgamma/EgammaTools TrackingTools/IPTools root
ALL_EXTERNAL_PLUGIN_PRODS += PhysicsToolsPatAlgos_plugins
PhysicsTools/PatAlgos_relbigobj+=PhysicsToolsPatAlgos_plugins
endif
ifeq ($(strip $(PhysicsTools/PatAlgos)),)
PhysicsToolsPatAlgos := self/PhysicsTools/PatAlgos
PhysicsTools/PatAlgos := PhysicsToolsPatAlgos
PhysicsToolsPatAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsPatAlgos_EX_USE := $(foreach d, self cmssw CommonTools/MVAUtils DataFormats/Candidate DataFormats/Common DataFormats/EgammaCandidates DataFormats/EgammaReco DataFormats/JetReco DataFormats/Math DataFormats/METReco DataFormats/MuonReco DataFormats/PatCandidates DataFormats/TauReco DataFormats/TrackReco DataFormats/VertexReco FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities PhysicsTools/PatUtils PhysicsTools/Utilities PhysicsTools/IsolationAlgos Geometry/CaloTopology RecoEgamma/EgammaTools RecoTracker/DeDx CondFormats/HcalObjects CondFormats/EcalObjects clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsPatAlgos_EX_LIB   := PhysicsToolsPatAlgos
ALL_EXTERNAL_PRODS += PhysicsToolsPatAlgos
PhysicsToolsPatAlgos_CLASS := LIBRARY
PhysicsTools/PatAlgos_relbigobj+=PhysicsToolsPatAlgos
endif
ifeq ($(strip $(PhysicsToolsPatUtils_plugins)),)
PhysicsToolsPatUtils_plugins := self/src/PhysicsTools/PatUtils/plugins
PhysicsToolsPatUtils_plugins_LOC_USE := self cmssw FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities CommonTools/Utils CondFormats/JetMETObjects DataFormats/Candidate DataFormats/JetReco DataFormats/METReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/PatCandidates JetMETCorrections/Objects JetMETCorrections/JetCorrector JetMETCorrections/Type1MET JetMETCorrections/Modules RecoMET/METAlgorithms PhysicsTools/PatUtils PhysicsTools/UtilAlgos
ALL_EXTERNAL_PLUGIN_PRODS += PhysicsToolsPatUtils_plugins
PhysicsTools/PatUtils_relbigobj+=PhysicsToolsPatUtils_plugins
endif
ifeq ($(strip $(PhysicsTools/PatUtils)),)
PhysicsToolsPatUtils := self/PhysicsTools/PatUtils
PhysicsTools/PatUtils := PhysicsToolsPatUtils
PhysicsToolsPatUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsPatUtils_EX_USE := $(foreach d, self cmssw TrackingTools/Records CommonTools/Utils DataFormats/Math DataFormats/Candidate DataFormats/PatCandidates DataFormats/TrackReco DataFormats/MuonReco DataFormats/GsfTrackReco DataFormats/VertexReco TrackingTools/TransientTrack Utilities/General PhysicsTools/UtilAlgos root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsPatUtils_LCGDICTS  := x 
PhysicsToolsPatUtils_EX_LIB   := PhysicsToolsPatUtils
ALL_EXTERNAL_PRODS += PhysicsToolsPatUtils
PhysicsToolsPatUtils_CLASS := LIBRARY
PhysicsTools/PatUtils_relbigobj+=PhysicsToolsPatUtils
endif
ifeq ($(strip $(RecoBTagONNXRuntimePlugins)),)
RecoBTagONNXRuntimePlugins := self/src/RecoBTag/ONNXRuntime/plugins
RecoBTagONNXRuntimePlugins_LOC_USE := self cmssw FWCore/Framework json DataFormats/BTauReco PhysicsTools/ONNXRuntime RecoBTag/FeatureTools
ALL_EXTERNAL_PLUGIN_PRODS += RecoBTagONNXRuntimePlugins
RecoBTag/ONNXRuntime_relbigobj+=RecoBTagONNXRuntimePlugins
endif
ifeq ($(strip $(RecoEgammaElectronIdentificationPlugins_cuts)),)
RecoEgammaElectronIdentificationPlugins_cuts := self/src/RecoEgamma/ElectronIdentification/plugins
RecoEgammaElectronIdentificationPlugins_cuts_LOC_USE := self cmssw FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry CommonTools/UtilAlgos CondFormats/DataRecord CondFormats/EgammaObjects DataFormats/EgammaCandidates DataFormats/EcalRecHit root rootcore RecoEgamma/EgammaTools RecoEgamma/ElectronIdentification
ALL_EXTERNAL_PLUGIN_PRODS += RecoEgammaElectronIdentificationPlugins_cuts
RecoEgamma/ElectronIdentification_relbigobj+=RecoEgammaElectronIdentificationPlugins_cuts
endif
ifeq ($(strip $(RecoEgammaElectronIdentificationPlugins)),)
RecoEgammaElectronIdentificationPlugins := self/src/RecoEgamma/ElectronIdentification/plugins
RecoEgammaElectronIdentificationPlugins_LOC_USE := self cmssw FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry CommonTools/UtilAlgos CondFormats/DataRecord CondFormats/EgammaObjects DataFormats/EgammaCandidates DataFormats/EcalRecHit root rootcore RecoEgamma/EgammaTools RecoEgamma/ElectronIdentification
ALL_EXTERNAL_PLUGIN_PRODS += RecoEgammaElectronIdentificationPlugins
RecoEgamma/ElectronIdentification_relbigobj+=RecoEgammaElectronIdentificationPlugins
endif
ifeq ($(strip $(RecoEgamma/ElectronIdentification)),)
RecoEgammaElectronIdentification := self/RecoEgamma/ElectronIdentification
RecoEgamma/ElectronIdentification := RecoEgammaElectronIdentification
RecoEgammaElectronIdentification_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaElectronIdentification_EX_USE := $(foreach d, self cmssw FWCore/Framework DataFormats/EgammaReco Geometry/CaloGeometry CondFormats/EgammaObjects RecoEcal/EgammaCoreTools DataFormats/TrackReco CommonTools/MVAUtils MagneticField/Records MagneticField/Engine RecoEgamma/EgammaTools RecoEgamma/EgammaIsolationAlgos PhysicsTools/SelectorUtils,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaElectronIdentification_LCGDICTS  := x 
RecoEgammaElectronIdentification_EX_LIB   := RecoEgammaElectronIdentification
ALL_EXTERNAL_PRODS += RecoEgammaElectronIdentification
RecoEgammaElectronIdentification_CLASS := LIBRARY
RecoEgamma/ElectronIdentification_relbigobj+=RecoEgammaElectronIdentification
endif
ifeq ($(strip $(RecoMET/METProducers)),)
RecoMETMETProducers := self/RecoMET/METProducers
RecoMET/METProducers := RecoMETMETProducers
RecoMETMETProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMETMETProducers_EX_USE := $(foreach d, self cmssw RecoMET/METAlgorithms DataFormats/METReco FWCore/Framework DataFormats/Common DataFormats/JetReco DataFormats/TrackReco CalibFormats/HcalObjects RecoLocalCalo/HcalRecAlgos Geometry/CSCGeometry JetMETCorrections/Modules,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += RecoMETMETProducers
RecoMETMETProducers_CLASS := LIBRARY
RecoMET/METProducers_relbigobj+=RecoMETMETProducers
endif
ifeq ($(strip $(SimDataFormats/ValidationFormats)),)
SimDataFormatsValidationFormats := self/SimDataFormats/ValidationFormats
SimDataFormats/ValidationFormats := SimDataFormatsValidationFormats
SimDataFormatsValidationFormats_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsValidationFormats_EX_USE := $(foreach d, self cmssw DataFormats/Common DataFormats/GeometryVector clhep geant4core expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsValidationFormats_LCGDICTS  := x 
SimDataFormatsValidationFormats_EX_LIB   := SimDataFormatsValidationFormats
ALL_EXTERNAL_PRODS += SimDataFormatsValidationFormats
SimDataFormatsValidationFormats_CLASS := LIBRARY
SimDataFormats/ValidationFormats_relbigobj+=SimDataFormatsValidationFormats
endif
ifeq ($(strip $(SimG4CMSCaloPlugins)),)
SimG4CMSCaloPlugins := self/src/SimG4CMS/Calo/plugins
SimG4CMSCaloPlugins_LOC_USE := self cmssw FWCore/PluginManager SimG4Core/Watcher SimG4CMS/Calo SimDataFormats/GeneratorProducts
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CMSCaloPlugins
SimG4CMS/Calo_relbigobj+=SimG4CMSCaloPlugins
endif
ifeq ($(strip $(SimG4CMS/Calo)),)
SimG4CMSCalo := self/SimG4CMS/Calo
SimG4CMS/Calo := SimG4CMSCalo
SimG4CMSCalo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSCalo_EX_USE := $(foreach d, self cmssw FWCore/PluginManager SimGeneral/GFlash SimG4Core/SensitiveDetector SimG4Core/Notification DataFormats/EcalDetId DataFormats/HcalDetId DataFormats/ForwardDetId DataFormats/Math CondFormats/HcalObjects CondFormats/DataRecord SimDataFormats/SimHitMaker SimDataFormats/CaloHit SimDataFormats/CaloTest Geometry/HcalCommonData Geometry/EcalCommonData Geometry/HGCalCommonData DetectorDescription/Core FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry CommonTools/UtilAlgos boost clhep geant4core hepmc root rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSCalo_EX_LIB   := SimG4CMSCalo
ALL_EXTERNAL_PRODS += SimG4CMSCalo
SimG4CMSCalo_CLASS := LIBRARY
SimG4CMS/Calo_relbigobj+=SimG4CMSCalo
endif
ifeq ($(strip $(SimG4CMSFP420Plugins)),)
SimG4CMSFP420Plugins := self/src/SimG4CMS/FP420/plugins
SimG4CMSFP420Plugins_LOC_FLAGS_REM_CXXFLAGS   := -Werror=unused-variable
SimG4CMSFP420Plugins_LOC_USE := self cmssw SimG4CMS/FP420
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CMSFP420Plugins
SimG4CMS/FP420_relbigobj+=SimG4CMSFP420Plugins
endif
ifeq ($(strip $(SimG4CMS/FP420)),)
SimG4CMSFP420 := self/SimG4CMS/FP420
SimG4CMS/FP420 := SimG4CMSFP420
SimG4CMSFP420_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSFP420_EX_USE := $(foreach d, self cmssw FWCore/PluginManager SimG4Core/Watcher SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Application SimG4CMS/Calo SimDataFormats/SimHitMaker DataFormats/GeometryVector SimDataFormats/CaloHit DetectorDescription/Core FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger SimGeneral/HepPDTRecord boost geant4core root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSFP420_EX_LIB   := SimG4CMSFP420
ALL_EXTERNAL_PRODS += SimG4CMSFP420
SimG4CMSFP420_CLASS := LIBRARY
SimG4CMS/FP420_relbigobj+=SimG4CMSFP420
endif
ifeq ($(strip $(SimG4CMSForwardPlugins)),)
SimG4CMSForwardPlugins := self/src/SimG4CMS/Forward/plugins
SimG4CMSForwardPlugins_LOC_USE := self cmssw FWCore/PluginManager SimG4Core/Watcher SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Physics SimG4CMS/Calo SimG4CMS/Forward DataFormats/Math SimDataFormats/SimHitMaker SimDataFormats/CaloHit SimDataFormats/CaloTest SimDataFormats/Forward DetectorDescription/Core FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger geant4core root rootmath
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CMSForwardPlugins
SimG4CMS/Forward_relbigobj+=SimG4CMSForwardPlugins
endif
ifeq ($(strip $(SimG4CMS/Forward)),)
SimG4CMSForward := self/SimG4CMS/Forward
SimG4CMS/Forward := SimG4CMSForward
SimG4CMSForward_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSForward_EX_USE := $(foreach d, self cmssw FWCore/PluginManager FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger SimG4Core/Watcher SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Physics SimG4CMS/Calo SimG4CMS/Tracker DataFormats/ForwardDetId DataFormats/Math SimDataFormats/SimHitMaker SimDataFormats/CaloHit SimDataFormats/Forward DetectorDescription/Core Geometry/HGCalCommonData Geometry/MTDCommonData boost clhep geant4core root rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSForward_EX_LIB   := SimG4CMSForward
ALL_EXTERNAL_PRODS += SimG4CMSForward
SimG4CMSForward_CLASS := LIBRARY
SimG4CMS/Forward_relbigobj+=SimG4CMSForward
endif
ifeq ($(strip $(SimG4CMS/Muon)),)
SimG4CMSMuon := self/SimG4CMS/Muon
SimG4CMS/Muon := SimG4CMSMuon
SimG4CMSMuon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSMuon_EX_USE := $(foreach d, self cmssw SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Physics SimDataFormats/SimHitMaker Geometry/MuonNumbering boost geant4core hepmc,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += SimG4CMSMuon
SimG4CMSMuon_CLASS := LIBRARY
SimG4CMS/Muon_relbigobj+=SimG4CMSMuon
endif
ifeq ($(strip $(SimG4CMSTrackerPlugins)),)
SimG4CMSTrackerPlugins := self/src/SimG4CMS/Tracker/plugins
SimG4CMSTrackerPlugins_LOC_USE := self cmssw SimG4CMS/Tracker FWCore/ParameterSet SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Physics Geometry/TrackerNumberingBuilder geant4core SimDataFormats/SimHitMaker
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CMSTrackerPlugins
SimG4CMS/Tracker_relbigobj+=SimG4CMSTrackerPlugins
endif
ifeq ($(strip $(SimG4CMS/Tracker)),)
SimG4CMSTracker := self/SimG4CMS/Tracker
SimG4CMS/Tracker := SimG4CMSTracker
SimG4CMSTracker_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSTracker_EX_USE := $(foreach d, self cmssw FWCore/ParameterSet SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Physics Geometry/TrackerNumberingBuilder geant4core SimDataFormats/SimHitMaker,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSTracker_EX_LIB   := SimG4CMSTracker
ALL_EXTERNAL_PRODS += SimG4CMSTracker
SimG4CMSTracker_CLASS := LIBRARY
SimG4CMS/Tracker_relbigobj+=SimG4CMSTracker
endif
ifeq ($(strip $(SimG4CoreApplicationPlugins)),)
SimG4CoreApplicationPlugins := self/src/SimG4Core/Application/plugins
SimG4CoreApplicationPlugins_LOC_USE := self cmssw FWCore/Concurrency FWCore/Framework FWCore/ParameterSet SimDataFormats/GeneratorProducts SimDataFormats/CaloHit SimDataFormats/Track SimDataFormats/TrackingHit SimDataFormats/Vertex geant4core hepmc SimG4Core/Application
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CoreApplicationPlugins
SimG4Core/Application_relbigobj+=SimG4CoreApplicationPlugins
endif
ifeq ($(strip $(SimG4Core/Application)),)
SimG4CoreApplication := self/SimG4Core/Application
SimG4Core/Application := SimG4CoreApplication
SimG4CoreApplication_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreApplication_EX_USE := $(foreach d, self cmssw DataFormats/Common DataFormats/Math SimDataFormats/GeneratorProducts SimDataFormats/Forward SimDataFormats/Track SimDataFormats/Vertex SimG4Core/Generators SimG4Core/Geometry SimG4Core/MagneticField SimG4Core/Notification SimG4Core/CustomPhysics SimG4Core/Physics SimG4Core/SensitiveDetector SimG4Core/Watcher SimGeneral/HepPDTRecord SimGeneral/GFlash FWCore/ParameterSet FWCore/PluginManager FWCore/Framework FWCore/Utilities MagneticField/Engine MagneticField/Records clhep xerces-c geant4core hepmc heppdt,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreApplication_EX_LIB   := SimG4CoreApplication
ALL_EXTERNAL_PRODS += SimG4CoreApplication
SimG4CoreApplication_CLASS := LIBRARY
SimG4Core/Application_relbigobj+=SimG4CoreApplication
endif
ifeq ($(strip $(SimG4CoreCustomPhysicsPlugins)),)
SimG4CoreCustomPhysicsPlugins := self/src/SimG4Core/CustomPhysics/plugins
SimG4CoreCustomPhysicsPlugins_LOC_USE := self cmssw SimG4Core/Watcher SimG4Core/Notification FWCore/ParameterSet FWCore/ServiceRegistry geant4core clhep boost SimG4Core/CustomPhysics
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CoreCustomPhysicsPlugins
SimG4Core/CustomPhysics_relbigobj+=SimG4CoreCustomPhysicsPlugins
endif
ifeq ($(strip $(SimG4Core/CustomPhysics)),)
SimG4CoreCustomPhysics := self/SimG4Core/CustomPhysics
SimG4Core/CustomPhysics := SimG4CoreCustomPhysics
SimG4CoreCustomPhysics_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreCustomPhysics_EX_USE := $(foreach d, self cmssw FWCore/Framework FWCore/PluginManager FWCore/MessageLogger SimG4Core/Physics SimG4Core/PhysicsLists geant4core clhep boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreCustomPhysics_EX_LIB   := SimG4CoreCustomPhysics
ALL_EXTERNAL_PRODS += SimG4CoreCustomPhysics
SimG4CoreCustomPhysics_CLASS := LIBRARY
SimG4Core/CustomPhysics_relbigobj+=SimG4CoreCustomPhysics
endif
ifeq ($(strip $(SimG4Core/Generators)),)
SimG4CoreGenerators := self/SimG4Core/Generators
SimG4Core/Generators := SimG4CoreGenerators
SimG4CoreGenerators_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreGenerators_EX_USE := $(foreach d, self cmssw FWCore/ParameterSet FWCore/MessageLogger SimDataFormats/GeneratorProducts boost heppdt geant4core rootmath expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreGenerators_EX_LIB   := SimG4CoreGenerators
ALL_EXTERNAL_PRODS += SimG4CoreGenerators
SimG4CoreGenerators_CLASS := LIBRARY
SimG4Core/Generators_relbigobj+=SimG4CoreGenerators
endif
ifeq ($(strip $(SimG4Core/Geometry)),)
SimG4CoreGeometry := self/SimG4Core/Geometry
SimG4Core/Geometry := SimG4CoreGeometry
SimG4CoreGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreGeometry_EX_USE := $(foreach d, self cmssw DetectorDescription/Core geant4core Geometry/Records FWCore/MessageLogger FWCore/Utilities xerces-c expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreGeometry_EX_LIB   := SimG4CoreGeometry
ALL_EXTERNAL_PRODS += SimG4CoreGeometry
SimG4CoreGeometry_CLASS := LIBRARY
SimG4Core/Geometry_relbigobj+=SimG4CoreGeometry
endif
ifeq ($(strip $(SimG4Core/HelpfulWatchers)),)
SimG4CoreHelpfulWatchers := self/SimG4Core/HelpfulWatchers
SimG4Core/HelpfulWatchers := SimG4CoreHelpfulWatchers
SimG4CoreHelpfulWatchers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreHelpfulWatchers_EX_USE := $(foreach d, self cmssw FWCore/Framework FWCore/ParameterSet SimG4Core/Watcher SimG4Core/Notification boost geant4core CommonTools/UtilAlgos MagneticField/Engine MagneticField/Records SimG4Core/Physics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += SimG4CoreHelpfulWatchers
SimG4CoreHelpfulWatchers_CLASS := LIBRARY
SimG4Core/HelpfulWatchers_relbigobj+=SimG4CoreHelpfulWatchers
endif
ifeq ($(strip $(SimG4Core/MagneticField)),)
SimG4CoreMagneticField := self/SimG4Core/MagneticField
SimG4Core/MagneticField := SimG4CoreMagneticField
SimG4CoreMagneticField_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreMagneticField_EX_USE := $(foreach d, self cmssw FWCore/PluginManager FWCore/ParameterSet boost geant4core expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreMagneticField_EX_LIB   := SimG4CoreMagneticField
ALL_EXTERNAL_PRODS += SimG4CoreMagneticField
SimG4CoreMagneticField_CLASS := LIBRARY
SimG4Core/MagneticField_relbigobj+=SimG4CoreMagneticField
endif
ifeq ($(strip $(SimG4Core/Notification)),)
SimG4CoreNotification := self/SimG4Core/Notification
SimG4Core/Notification := SimG4CoreNotification
SimG4CoreNotification_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreNotification_EX_USE := $(foreach d, self cmssw SimDataFormats/Forward SimDataFormats/Track SimDataFormats/Vertex DataFormats/Math geant4core FWCore/MessageLogger rootmath expat hepmc,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreNotification_EX_LIB   := SimG4CoreNotification
ALL_EXTERNAL_PRODS += SimG4CoreNotification
SimG4CoreNotification_CLASS := LIBRARY
SimG4Core/Notification_relbigobj+=SimG4CoreNotification
endif
ifeq ($(strip $(SimG4Core/Physics)),)
SimG4CorePhysics := self/SimG4Core/Physics
SimG4Core/Physics := SimG4CorePhysics
SimG4CorePhysics_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CorePhysics_EX_USE := $(foreach d, self cmssw DetectorDescription/Core FWCore/ParameterSet geant4core heppdt boost sigcpp expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CorePhysics_EX_LIB   := SimG4CorePhysics
ALL_EXTERNAL_PRODS += SimG4CorePhysics
SimG4CorePhysics_CLASS := LIBRARY
SimG4Core/Physics_relbigobj+=SimG4CorePhysics
endif
ifeq ($(strip $(SimG4CorePhysicsListsPlugins)),)
SimG4CorePhysicsListsPlugins := self/src/SimG4Core/PhysicsLists/plugins
SimG4CorePhysicsListsPlugins_LOC_USE := self cmssw FWCore/ParameterSet FWCore/MessageLogger FWCore/PluginManager SimG4Core/Physics geant4core clhep heppdt boost SimG4Core/PhysicsLists
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CorePhysicsListsPlugins
SimG4Core/PhysicsLists_relbigobj+=SimG4CorePhysicsListsPlugins
endif
ifeq ($(strip $(SimG4Core/PhysicsLists)),)
SimG4CorePhysicsLists := self/SimG4Core/PhysicsLists
SimG4Core/PhysicsLists := SimG4CorePhysicsLists
SimG4CorePhysicsLists_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CorePhysicsLists_EX_USE := $(foreach d, self cmssw FWCore/MessageLogger SimG4Core/Physics SimG4Core/MagneticField geant4core clhep heppdt boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CorePhysicsLists_EX_LIB   := SimG4CorePhysicsLists
ALL_EXTERNAL_PRODS += SimG4CorePhysicsLists
SimG4CorePhysicsLists_CLASS := LIBRARY
SimG4Core/PhysicsLists_relbigobj+=SimG4CorePhysicsLists
endif
ifeq ($(strip $(SimG4Core/PrintGeomInfo)),)
SimG4CorePrintGeomInfo := self/SimG4Core/PrintGeomInfo
SimG4Core/PrintGeomInfo := SimG4CorePrintGeomInfo
SimG4CorePrintGeomInfo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CorePrintGeomInfo_EX_USE := $(foreach d, self cmssw SimG4Core/Notification SimG4Core/Watcher SimG4Core/Geometry FWCore/ParameterSet geant4core boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += SimG4CorePrintGeomInfo
SimG4CorePrintGeomInfo_CLASS := LIBRARY
SimG4Core/PrintGeomInfo_relbigobj+=SimG4CorePrintGeomInfo
endif
ifeq ($(strip $(SimG4Core/SensitiveDetector)),)
SimG4CoreSensitiveDetector := self/SimG4Core/SensitiveDetector
SimG4Core/SensitiveDetector := SimG4CoreSensitiveDetector
SimG4CoreSensitiveDetector_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreSensitiveDetector_EX_USE := $(foreach d, self cmssw FWCore/MessageLogger FWCore/PluginManager SimG4Core/Geometry SimG4Core/Notification geant4core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreSensitiveDetector_EX_LIB   := SimG4CoreSensitiveDetector
ALL_EXTERNAL_PRODS += SimG4CoreSensitiveDetector
SimG4CoreSensitiveDetector_CLASS := LIBRARY
SimG4Core/SensitiveDetector_relbigobj+=SimG4CoreSensitiveDetector
endif
ifeq ($(strip $(SimRomanPotSimFP420Plugins)),)
SimRomanPotSimFP420Plugins := self/src/SimRomanPot/SimFP420/plugins
SimRomanPotSimFP420Plugins_LOC_USE := self cmssw SimRomanPot/SimFP420
ALL_EXTERNAL_PLUGIN_PRODS += SimRomanPotSimFP420Plugins
SimRomanPot/SimFP420_relbigobj+=SimRomanPotSimFP420Plugins
endif
ifeq ($(strip $(SimRomanPot/SimFP420)),)
SimRomanPotSimFP420 := self/SimRomanPot/SimFP420
SimRomanPot/SimFP420 := SimRomanPotSimFP420
SimRomanPotSimFP420_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimRomanPotSimFP420_EX_USE := $(foreach d, self cmssw FWCore/PluginManager SimDataFormats/TrackingHit DataFormats/Math SimDataFormats/TrackerDigiSimLink SimDataFormats/CrossingFrame DataFormats/FP420Digi DataFormats/Common SimGeneral/HepPDTRecord SimG4Core/Watcher SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Application SimG4CMS/Calo SimG4CMS/FP420 SimDataFormats/SimHitMaker SimDataFormats/CaloHit Mixing/Base DetectorDescription/Core FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger boost geant4core root clhep hepmc gsl,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimRomanPotSimFP420_EX_LIB   := SimRomanPotSimFP420
ALL_EXTERNAL_PRODS += SimRomanPotSimFP420
SimRomanPotSimFP420_CLASS := LIBRARY
SimRomanPot/SimFP420_relbigobj+=SimRomanPotSimFP420
endif
ifeq ($(strip $(TrackPropagatorsGeant4ePlugins)),)
TrackPropagatorsGeant4ePlugins := self/src/TrackPropagation/Geant4e/plugins
TrackPropagatorsGeant4ePlugins_LOC_USE := self cmssw MagneticField/Engine TrackPropagation/Geant4e clhep DataFormats/CLHEP geant4
ALL_EXTERNAL_PLUGIN_PRODS += TrackPropagatorsGeant4ePlugins
TrackPropagation/Geant4e_relbigobj+=TrackPropagatorsGeant4ePlugins
endif
ifeq ($(strip $(TrackPropagation/Geant4e)),)
TrackPropagationGeant4e := self/TrackPropagation/Geant4e
TrackPropagation/Geant4e := TrackPropagationGeant4e
TrackPropagationGeant4e_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackPropagationGeant4e_EX_USE := $(foreach d, self cmssw root geant4 FWCore/ParameterSet FWCore/Utilities TrackingTools/GeomPropagators TrackingTools/Records TrackingTools/TrajectoryState FWCore/Framework FWCore/MessageLogger DataFormats/CLHEP clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackPropagationGeant4e_EX_LIB   := TrackPropagationGeant4e
ALL_EXTERNAL_PRODS += TrackPropagationGeant4e
TrackPropagationGeant4e_CLASS := LIBRARY
TrackPropagation/Geant4e_relbigobj+=TrackPropagationGeant4e
endif
ifeq ($(strip $(Validation/EcalHits)),)
ValidationEcalHits := self/Validation/EcalHits
Validation/EcalHits := ValidationEcalHits
ValidationEcalHits_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationEcalHits_EX_USE := $(foreach d, self cmssw DataFormats/Common root geant4core boost FWCore/ParameterSet SimG4Core/Watcher SimG4CMS/Calo DataFormats/EcalDetId SimDataFormats/GeneratorProducts SimDataFormats/ValidationFormats DQMServices/Core rootmath DataFormats/Math,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += ValidationEcalHits
ValidationEcalHits_CLASS := LIBRARY
Validation/EcalHits_relbigobj+=ValidationEcalHits
endif
ifeq ($(strip $(Validation/HcalHits)),)
ValidationHcalHits := self/Validation/HcalHits
Validation/HcalHits := ValidationHcalHits
ValidationHcalHits_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationHcalHits_EX_USE := $(foreach d, self cmssw FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger geant4core boost SimG4Core/Notification SimG4Core/Watcher SimG4CMS/Calo Geometry/HcalCommonData DataFormats/HcalDetId SimDataFormats/CaloHit SimDataFormats/ValidationFormats SimDataFormats/GeneratorProducts hepmc DataFormats/Math rootmath DQMServices/Core DataFormats/HepMCCandidate,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += ValidationHcalHits
ValidationHcalHits_CLASS := LIBRARY
Validation/HcalHits_relbigobj+=ValidationHcalHits
endif
ifeq ($(strip $(Validation/Performance)),)
ValidationPerformance := self/Validation/Performance
Validation/Performance := ValidationPerformance
ValidationPerformance_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationPerformance_EX_USE := $(foreach d, self cmssw FWCore/Framework FWCore/ParameterSet DataFormats/Common DataFormats/HLTReco DQMServices/Core root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += ValidationPerformance
ValidationPerformance_CLASS := LIBRARY
Validation/Performance_relbigobj+=ValidationPerformance
endif
