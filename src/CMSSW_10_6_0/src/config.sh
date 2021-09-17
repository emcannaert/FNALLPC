#!/bin/bash
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_6_0/src ] ; then 
 echo release CMSSW_10_6_0 already exists
else
scram p CMSSW CMSSW_10_6_0
fi
cd CMSSW_10_6_0/src
eval `scram runtime -sh`


scram b
cd ../../
cmsDriver.py step1 --filein file:unweighted_events.lhe  --fileout file:PPD-RunIISummer19UL17pLHE-00001.root --mc --eventcontent LHE --datatier LHE --conditions 106X_mc2017_realistic_v3 --step NONE --era Run2_2017 --python_filename PPD-RunIISummer19UL17pLHE-00001_1_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 10000 || exit $? ; 


