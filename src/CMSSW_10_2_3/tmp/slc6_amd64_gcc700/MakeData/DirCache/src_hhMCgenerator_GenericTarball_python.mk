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
