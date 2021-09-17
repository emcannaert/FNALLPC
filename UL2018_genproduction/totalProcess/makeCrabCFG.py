#! /usr/bin/env python
import argparse
import sys
import os
##############################################################################
#MAIN
##############################################################################
homeDirec= '/uscms_data/d3/cannaert/UL2018_genproduction/totalProcess'
#dirs = ['Suu10TeV_chi4TeV']
dirs = ['Suu8TeV_chi2TeV','Suu8TeV_chi1TeV','Suu7TeV_chi3TeV','Suu7TeV_chi2TeV','Suu7TeV_chi1TeV','Suu6TeV_chi2TeV','Suu6TeV_chi1p5TeV','Suu6TeV_chi1TeV','Suu5TeV_chi2TeV','Suu5TeV_chi1p5TeV','Suu5TeV_chi1TeV','Suu4TeV_chi1p5TeV','Suu4TeV_chi1TeV','Suu4TeV_chi850GeV','Suu4TeV_chi500GeV']
outputDatabases = []


#Change these to do different MC production steps
prodCommand = "cmsDriver.py  --python_filename B2G-RunIISummer20UL18MiniAODv2-00001_1_cfg.py --eventcontent MINIAODSIM --customise Configuration/DataProcessing/Utils.addMonitoring --datatier MINIAODSIM --fileout file:B2G-RunIISummer20UL18MiniAODv2-00001.root --conditions 106X_upgrade2018_realistic_v16_L1v1 --step PAT --procModifiers run2_miniAOD_UL --geometry DB:Extended --filein file:B2G-RunIISummer20UL18RECO-00001.root --era Run2_2018 --runUnscheduled --no_exec --mc -n 10000"
cmsRelease = 'CMSSW_10_6_20/'
cfgFilename = 'crab_diquark_MINIAOD_prod_cfg.py'
cfgStep     = 'MINIAOD'
pythonFilename = 'B2G-RunIISummer20UL18MiniAODv2-00001_1_cfg.py'
def main(argv):
        databaseFile = open("productionDatabases.txt",'r')
        for line in databaseFile:
                #print(line)
                outputDatabases.append(line.rstrip('\n'))
        for index,directory in enumerate(dirs):
                os.chdir(homeDirec+"/"+directory+"/"+cmsRelease+'/src')
                os.system("source /cvmfs/cms.cern.ch/cmsset_default.sh")
                print("New sample started - in directory %s."%str(os.getcwd()))
                os.system("eval `scramv1 runtime -sh`")
                os.system(prodCommand)
                #os.system("echo $SHELL")
                oldCFG = open('crab_diquark_%s_prod_cfg.py'%cfgStep,'r')
                newCFG = open('crab_diquark_%s_prod_new_cfg.py'%cfgStep,'w')
                for line in oldCFG:
                        sentence = line.split()
                        if len(sentence) == 0:
                                continue;
                        elif(sentence[0] == 'config.JobType.psetName'):
                        		newCFG.write("config.JobType.psetName = '" +homeDirec+ "/" +directory+ "/" +cmsRelease+ "/src/%s'\n"%pythonFilename)
                        elif(sentence[0] == 'config.General.workArea'):
                        		newCFG.write("config.General.workArea = '" +homeDirec+ "/" +directory+ "/" +cmsRelease+ "/src/crab_projects'\n")
                        elif(sentence[0] == 'config.General.requestName'):
                                newCFG.write("config.General.requestName = 'MC_prod_"+directory+"_ALL_DECAYS_"+cfgStep+ "_0001'\n")
                        elif((sentence[0] == 'config.Data.inputDataset')):
                                newCFG.write("config.Data.inputDataset = '" + outputDatabases[index]+ "'" + "\n")
                        elif((sentence[0] == 'config.Data.outputDatasetTag')):
                                newCFG.write("config.Data.outputDatasetTag = 'B2G-RunIISummer20UL18p_" +directory +"_ALLDECAYS_TuneCP5_13TeV-pythia8_" +cfgStep+"'\n")
                        else:
                                newCFG.write(line)
                oldCFG.close()
                newCFG.close()
                print("Crab cfg file created - returning to UL home directory.")
                os.chdir(homeDirec)

                #os.system('crab submit -c %s'%cfgFilename)


if __name__ == "__main__":
        main(sys.argv[1:])
