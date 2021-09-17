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
