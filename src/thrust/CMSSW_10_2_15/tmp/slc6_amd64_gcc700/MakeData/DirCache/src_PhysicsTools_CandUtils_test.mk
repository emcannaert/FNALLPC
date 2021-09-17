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
