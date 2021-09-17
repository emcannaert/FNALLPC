ALL_SUBSYSTEMS+=hhMCgenerator
subdirs_src_hhMCgenerator = src_hhMCgenerator_CrabRunFiles src_hhMCgenerator_GenericTarball src_hhMCgenerator_GridpackOutput src_hhMCgenerator_LocalRunFiles src_hhMCgenerator_PreProcess src_hhMCgenerator_RootFiles src_hhMCgenerator_crab_projects
ALL_PACKAGES += hhMCgenerator/CrabRunFiles
subdirs_src_hhMCgenerator_CrabRunFiles := src_hhMCgenerator_CrabRunFiles_M3500
ALL_PACKAGES += hhMCgenerator/GenericTarball
subdirs_src_hhMCgenerator_GenericTarball := src_hhMCgenerator_GenericTarball_plugins src_hhMCgenerator_GenericTarball_python
ifeq ($(strip $(PyhhMCgeneratorGenericTarball)),)
PyhhMCgeneratorGenericTarball := self/src/hhMCgenerator/GenericTarball/python
src_hhMCgenerator_GenericTarball_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/hhMCgenerator/GenericTarball/python)
PyhhMCgeneratorGenericTarball_files := $(patsubst src/hhMCgenerator/GenericTarball/python/%,%,$(wildcard $(foreach dir,src/hhMCgenerator/GenericTarball/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyhhMCgeneratorGenericTarball_LOC_USE := self  
PyhhMCgeneratorGenericTarball_PACKAGE := self/src/hhMCgenerator/GenericTarball/python
ALL_PRODS += PyhhMCgeneratorGenericTarball
PyhhMCgeneratorGenericTarball_INIT_FUNC        += $$(eval $$(call PythonProduct,PyhhMCgeneratorGenericTarball,src/hhMCgenerator/GenericTarball/python,src_hhMCgenerator_GenericTarball_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyhhMCgeneratorGenericTarball,src/hhMCgenerator/GenericTarball/python))
endif
ALL_COMMONRULES += src_hhMCgenerator_GenericTarball_python
src_hhMCgenerator_GenericTarball_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_hhMCgenerator_GenericTarball_python,src/hhMCgenerator/GenericTarball/python,PYTHON))
ALL_PACKAGES += hhMCgenerator/GridpackOutput
subdirs_src_hhMCgenerator_GridpackOutput := src_hhMCgenerator_GridpackOutput_CMSSW_7_1_30 src_hhMCgenerator_GridpackOutput_mgbasedir src_hhMCgenerator_GridpackOutput_process
ALL_PACKAGES += hhMCgenerator/LocalRunFiles
subdirs_src_hhMCgenerator_LocalRunFiles := 
ALL_PACKAGES += hhMCgenerator/PreProcess
subdirs_src_hhMCgenerator_PreProcess := 
ALL_PACKAGES += hhMCgenerator/RootFiles
subdirs_src_hhMCgenerator_RootFiles := 
ALL_PACKAGES += hhMCgenerator/crab_projects
subdirs_src_hhMCgenerator_crab_projects := 
