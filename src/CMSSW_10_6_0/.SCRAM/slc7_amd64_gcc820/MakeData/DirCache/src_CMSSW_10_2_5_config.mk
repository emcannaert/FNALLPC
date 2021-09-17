ifeq ($(strip $(CMSSW_10_2_5/config)),)
src_CMSSW_10_2_5_config := self/CMSSW_10_2_5/config
CMSSW_10_2_5/config  := src_CMSSW_10_2_5_config
src_CMSSW_10_2_5_config_BuildFile    := $(WORKINGDIR)/cache/bf/src/CMSSW_10_2_5/config/BuildFile
src_CMSSW_10_2_5_config_LOC_USE := self
src_CMSSW_10_2_5_config_EX_USE   := $(foreach d,$(src_CMSSW_10_2_5_config_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_CMSSW_10_2_5_config
src_CMSSW_10_2_5_config_INIT_FUNC += $$(eval $$(call EmptyPackage,src_CMSSW_10_2_5_config,src/CMSSW_10_2_5/config))
endif

