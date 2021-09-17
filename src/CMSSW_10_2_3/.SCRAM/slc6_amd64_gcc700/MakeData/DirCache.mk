ifeq ($(strip $(hhMCgeneratorGenericTarballAuto)),)
hhMCgeneratorGenericTarballAuto := self/src/hhMCgenerator/GenericTarball/plugins
PLUGINS:=yes
hhMCgeneratorGenericTarballAuto_files := $(patsubst src/hhMCgenerator/GenericTarball/plugins/%,%,$(wildcard $(foreach dir,src/hhMCgenerator/GenericTarball/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
hhMCgeneratorGenericTarballAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/hhMCgenerator/GenericTarball/plugins/BuildFile
hhMCgeneratorGenericTarballAuto_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet
hhMCgeneratorGenericTarballAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,hhMCgeneratorGenericTarballAuto,hhMCgeneratorGenericTarballAuto,$(SCRAMSTORENAME_LIB),src/hhMCgenerator/GenericTarball/plugins))
hhMCgeneratorGenericTarballAuto_PACKAGE := self/src/hhMCgenerator/GenericTarball/plugins
ALL_PRODS += hhMCgeneratorGenericTarballAuto
hhMCgenerator/GenericTarball_forbigobj+=hhMCgeneratorGenericTarballAuto
hhMCgeneratorGenericTarballAuto_INIT_FUNC        += $$(eval $$(call Library,hhMCgeneratorGenericTarballAuto,src/hhMCgenerator/GenericTarball/plugins,src_hhMCgenerator_GenericTarball_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
hhMCgeneratorGenericTarballAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,hhMCgeneratorGenericTarballAuto,src/hhMCgenerator/GenericTarball/plugins))
endif
ALL_COMMONRULES += src_hhMCgenerator_GenericTarball_plugins
src_hhMCgenerator_GenericTarball_plugins_parent := hhMCgenerator/GenericTarball
src_hhMCgenerator_GenericTarball_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_hhMCgenerator_GenericTarball_plugins,src/hhMCgenerator/GenericTarball/plugins,PLUGINS))
ifeq ($(strip $(CMSSW_10_6_0/config)),)
src_CMSSW_10_6_0_config := self/CMSSW_10_6_0/config
CMSSW_10_6_0/config  := src_CMSSW_10_6_0_config
src_CMSSW_10_6_0_config_BuildFile    := $(WORKINGDIR)/cache/bf/src/CMSSW_10_6_0/config/BuildFile
src_CMSSW_10_6_0_config_LOC_USE := self
src_CMSSW_10_6_0_config_EX_USE   := $(foreach d,$(src_CMSSW_10_6_0_config_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_CMSSW_10_6_0_config
src_CMSSW_10_6_0_config_INIT_FUNC += $$(eval $$(call EmptyPackage,src_CMSSW_10_6_0_config,src/CMSSW_10_6_0/config))
endif

