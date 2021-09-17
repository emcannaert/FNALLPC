#!/bin/bash
export SCRAM_ARCH=slc6_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_2_3/src ] ; then 
 echo release CMSSW_10_2_3 already exists
else
scram p CMSSW CMSSW_10_2_3
fi
cd CMSSW_10_2_3/src
eval `scram runtime -sh`

curl  -s https://raw.githubusercontent.com/cms-sw/genproductions/master/python/ThirteenTeV/Hadronizer/Hadronizer_TuneCP5_13TeV_generic_LHE_pythia8_cff.py --retry 2 --create-dirs -o  Configuration/GenProduction/python/ThirteenTeV/Hadronizer_TuneCP5_13TeV_generic_LHE_pythia8_cff.py
[ -s Configuration/GenProduction/python/ThirteenTeV/Hadronizer_TuneCP5_13TeV_generic_LHE_pythia8_cff.py ] || exit $?;

scram b
cd ../../

cmsDriver.py Configuration/GenProduction/python/ThirteenTeV/Hadronizer_TuneCP5_13TeV_generic_LHE_pythia8_cff.py --filein file:PPD-RunIISummer19UL17pLHE-00001.root --fileout file:B2G-RunIIFall18wmGS-00001_new.root --mc --eventcontent RAWSIM --datatier GEN-SIM --conditions 102X_upgrade2018_realistic_v11 --beamspot Realistic25ns13TeVEarly2018Collision --step GEN,SIM --nThreads 8 --geometry DB:Extended --era Run2_2018 --python_filename B2G-RunIIFall18wmGS-00001_1_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 50 || exit $? ; 


