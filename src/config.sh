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

curl -s --insecure https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/B2G-RunIIFall18wmLHEGS-00001 --retry 2 --create-dirs -o Configuration/GenProduction/python/B2G-RunIIFall18wmLHEGS-00001-fragment.py 
[ -s Configuration/GenProduction/python/B2G-RunIIFall18wmLHEGS-00001-fragment.py ] || exit $?;

scram b
cd ../../

cmsDriver.py Configuration/GenProduction/python/B2G-RunIIFall18wmLHEGS-00001-fragment.py --filein file:unweighted_events.lhe --fileout file:B2G-RunIIFall18wmGS-00001.root --mc --eventcontent RAWSIM --datatier GEN-SIM --conditions 102X_upgrade2018_realistic_v11 --beamspot Realistic25ns13TeVEarly2018Collision --step GEN,SIM --nThreads 8 --geometry DB:Extended --era Run2_2018 --python_filename B2G-RunIIFall18wmGS-00001_1_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 100 || exit $? ; 

