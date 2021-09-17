ALL_SUBSYSTEMS+=PhysicsTools
subdirs_src_PhysicsTools = src_PhysicsTools_CandUtils
ALL_PACKAGES += PhysicsTools/CandUtils
subdirs_src_PhysicsTools_CandUtils := src_PhysicsTools_CandUtils_interface src_PhysicsTools_CandUtils_src src_PhysicsTools_CandUtils_test
ifeq ($(strip $(testPhysicsToolsCandUtils)),)
testPhysicsToolsCandUtils := self/src/PhysicsTools/CandUtils/test
testPhysicsToolsCandUtils_files := $(patsubst src/PhysicsTools/CandUtils/test/%,%,$(foreach file,testThrust.cc testRunner.cpp,$(eval xfile:=$(wildcard src/PhysicsTools/CandUtils/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/CandUtils/test/$(file). Please fix src/PhysicsTools/CandUtils/test/BuildFile.))))
testPhysicsToolsCandUtils_TEST_RUNNER_CMD :=  testPhysicsToolsCandUtils 
testPhysicsToolsCandUtils_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/CandUtils/test/BuildFile
testPhysicsToolsCandUtils_LOC_USE := self  PhysicsTools/CandUtils cppunit
testPhysicsToolsCandUtils_PACKAGE := self/src/PhysicsTools/CandUtils/test
ALL_PRODS += testPhysicsToolsCandUtils
testPhysicsToolsCandUtils_INIT_FUNC        += $$(eval $$(call Binary,testPhysicsToolsCandUtils,src/PhysicsTools/CandUtils/test,src_PhysicsTools_CandUtils_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),test,$(SCRAMSTORENAME_LOGS)))
testPhysicsToolsCandUtils_CLASS := TEST
else
$(eval $(call MultipleWarningMsg,testPhysicsToolsCandUtils,src/PhysicsTools/CandUtils/test))
endif
ALL_COMMONRULES += src_PhysicsTools_CandUtils_test
src_PhysicsTools_CandUtils_test_parent := PhysicsTools/CandUtils
src_PhysicsTools_CandUtils_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_CandUtils_test,src/PhysicsTools/CandUtils/test,TEST))
ALL_SUBSYSTEMS+=analyzers
subdirs_src_analyzers = src_analyzers_analyzers
ALL_PACKAGES += analyzers/analyzers
subdirs_src_analyzers_analyzers := src_analyzers_analyzers_src
ALL_PACKAGES += src/PhysicsTools
subdirs_src_src_PhysicsTools := src_src_PhysicsTools_CandUtils
ALL_PACKAGES += src/T2tt
subdirs_src_src_T2tt := 
ALL_PACKAGES += src/Zprimett_5TeV
subdirs_src_src_Zprimett_5TeV := 
ALL_PACKAGES += src/analyzers
subdirs_src_src_analyzers := src_src_analyzers_analyzers
ALL_PACKAGES += src/crab_jetboost_background1
subdirs_src_src_crab_jetboost_background1 := src_src_crab_jetboost_background1_inputs
ALL_PACKAGES += src/crab_jetboost_background2
subdirs_src_src_crab_jetboost_background2 := 
ALL_PACKAGES += src/stop_pp
subdirs_src_src_stop_pp := 
ALL_PACKAGES += src/test
subdirs_src_src_test := 
ALL_PACKAGES += src/zprime_tt
subdirs_src_src_zprime_tt := 
ALL_SUBSYSTEMS+=test
subdirs_src_test = 
