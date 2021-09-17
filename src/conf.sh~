#!/bin/bash
export SCRAM_ARCH=slc6_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_7_1_30/src ] ; then 
 echo release CMSSW_7_1_30 already exists
else
scram p CMSSW CMSSW_7_1_30
fi
cd CMSSW_7_1_30/src
eval `scram runtime -sh`

curl -s --insecure https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/SMP-RunIIFall18wmLHEGS-00040 --retry 2 --create-dirs -o Configuration/GenProduction/python/SMP-RunIIFall18wmLHEGS-00040-fragment.py 
[ -s Configuration/GenProduction/python/SMP-RunIIFall18wmLHEGS-00040-fragment.py ] || exit $?;

scram b
cd ../../



