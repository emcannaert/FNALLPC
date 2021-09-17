ifeq ($(strip $(PhysicsTools/CandUtils)),)
ALL_COMMONRULES += src_PhysicsTools_CandUtils_src
src_PhysicsTools_CandUtils_src_parent := PhysicsTools/CandUtils
src_PhysicsTools_CandUtils_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_PhysicsTools_CandUtils_src,src/PhysicsTools/CandUtils/src,LIBRARY))
PhysicsToolsCandUtils := self/PhysicsTools/CandUtils
PhysicsTools/CandUtils := PhysicsToolsCandUtils
PhysicsToolsCandUtils_files := $(patsubst src/PhysicsTools/CandUtils/src/%,%,$(wildcard $(foreach dir,src/PhysicsTools/CandUtils/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PhysicsToolsCandUtils_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/CandUtils/BuildFile
PhysicsToolsCandUtils_LOC_USE := self  DataFormats/Candidate roothistmatrix
PhysicsToolsCandUtils_EX_LIB   := PhysicsToolsCandUtils
PhysicsToolsCandUtils_EX_USE   := $(foreach d,$(PhysicsToolsCandUtils_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsCandUtils_PACKAGE := self/src/PhysicsTools/CandUtils/src
ALL_PRODS += PhysicsToolsCandUtils
PhysicsToolsCandUtils_CLASS := LIBRARY
PhysicsTools/CandUtils_forbigobj+=PhysicsToolsCandUtils
PhysicsToolsCandUtils_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsCandUtils,src/PhysicsTools/CandUtils/src,src_PhysicsTools_CandUtils_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(analyzers/analyzers)),)
ALL_COMMONRULES += src_analyzers_analyzers_src
src_analyzers_analyzers_src_parent := analyzers/analyzers
src_analyzers_analyzers_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_analyzers_analyzers_src,src/analyzers/analyzers/src,LIBRARY))
analyzersanalyzers := self/analyzers/analyzers
analyzers/analyzers := analyzersanalyzers
analyzersanalyzers_files := $(patsubst src/analyzers/analyzers/src/%,%,$(wildcard $(foreach dir,src/analyzers/analyzers/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
analyzersanalyzers_BuildFile    := $(WORKINGDIR)/cache/bf/src/analyzers/analyzers/BuildFile
analyzersanalyzers_LOC_USE := self  FWCore/Framework DataFormats/Candidate FWCore/PluginManager FWCore/ParameterSet PhysicsTools/CandUtils PhysicsTools/UtilAlgos fastjet
analyzersanalyzers_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,analyzersanalyzers,analyzersanalyzers,$(SCRAMSTORENAME_LIB),src/analyzers/analyzers/src))
analyzersanalyzers_PACKAGE := self/src/analyzers/analyzers/src
ALL_PRODS += analyzersanalyzers
analyzersanalyzers_CLASS := LIBRARY
analyzers/analyzers_forbigobj+=analyzersanalyzers
analyzersanalyzers_INIT_FUNC        += $$(eval $$(call Library,analyzersanalyzers,src/analyzers/analyzers/src,src_analyzers_analyzers_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
