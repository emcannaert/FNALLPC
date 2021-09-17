#include <iostream>
#include <TChain.h>
#include <TH1D.h>
#include <TCanvas.h>
#include <cmath>


//muon isolation & lumi mask- external parser? , bitmap?
////////////////////////Helper Functions//////////////////////////////////////////////
float calc_dptx(float lead_pt, float lead_phi, float sublead_pt, float sublead_phi, float jet3_pt, float jet3_phi)
{
   float lead_ptx = lead_pt*cos(lead_phi);
   float sublead_ptx = sublead_pt*cos(sublead_phi);
   float jet3_ptx = jet3_pt*cos(jet3_phi);

   float delta_ptx = lead_ptx + sublead_ptx +jet3_ptx;

   return delta_ptx;

}

float calc_dpty(float lead_pt, float lead_phi, float sublead_pt, float sublead_phi, float jet3_pt, float jet3_phi){
   float lead_pty = lead_pt*sin(lead_phi);
   float sublead_pty = sublead_pt*sin(sublead_phi);
   float jet3_pty = jet3_pt*sin(jet3_phi);

   float delta_pty = lead_pty + sublead_pty +jet3_pty;

   return (delta_pty);

}
float calc_pt_sum(float lead_pt, float lead_phi, float sublead_pt, float sublead_phi, float jet3_pt, float jet3_phi){
   float lead_ptx = lead_pt*cos(lead_phi);
   float lead_pty = lead_pt*sin(lead_phi);
   float sublead_ptx = sublead_pt*cos(sublead_phi);
   float sublead_pty = sublead_pt*sin(sublead_phi);
   float jet3_ptx = jet3_pt*cos(jet3_phi);
   float jet3_pty = jet3_pt*sin(jet3_phi);
   float xsum = lead_ptx + sublead_ptx + jet3_ptx;
   float ysum = lead_pty + sublead_pty + jet3_pty;
   return (sqrt(pow(xsum,2) + pow(ysum,2)));

}
float calc_dpt(float met_phi, float met_pt, float ptx, float pty){
   float met_ptx = met_pt*cos(met_phi);
   float met_pty = met_pt*sin(met_phi);

   float sumx = met_ptx + ptx;
   float sumy = met_pty + pty;
   return (sqrt(pow(sumx,2)+ pow(sumy,2)));
}
float calc_dphi(float met_dphi,float ptx,float pty) {
   float sum_phi = atan(pty/ptx);
   if ((ptx < 0 ) && (pty < 0)) sum_phi = sum_phi + M_PI;
   else if ((ptx < 0) && (pty > 0)) sum_phi = sum_phi + M_PI;
   else if ((ptx > 0) && (pty < 0)) sum_phi = sum_phi + 2*M_PI;

   if (sum_phi < 0) sum_phi = sum_phi + 2*M_PI;

   if (abs(met_dphi - sum_phi) > M_PI) {
      return (abs(2*M_PI - abs(met_dphi - sum_phi)));
   }
   else if (abs(met_dphi-sum_phi) < M_PI) {
      return abs(met_dphi - sum_phi);
   } 
   else {
      return -1;
   }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////
void jets_eventloop()

{  

   int totalevents = 0;
   int lumievents  = 0;
   int passtrigger = 0;
   int nophotons   = 0;
   int noelectrons = 0;
   int nomuons     = 0;
   int notaus      = 0;
   int threejets   = 0;
   int lowmet      = 0;
   TChain * chain = new TChain("Events");


chain->Add("0215383B-6917-0E41-AF82-4DF9C450AF4F.root");
chain->Add("075CA70F-DBF2-984B-BF84-9B0C2EDE4906.root");


chain->Add("D75D8272-D20E-FA43-8B80-F66550730615.root");
chain->Add("D7E9CFE2-4A8E-0B41-9CA4-17340DE02CE8.root");
chain->Add("F169C1AC-2AFA-284E-B0B3-CD23C90A70DB.root");
chain->Add("C2D25878-12DA-6D45-802F-4E9F341A426C.root");
chain->Add("F29208D8-F974-B649-80BD-1077E45A4844.root");
chain->Add("D1697830-4386-284B-B00A-8E6FF3D04216.root");
chain->Add("F618FAB9-C9C2-274A-B25E-4AF452DDED56.root");
chain->Add("D2FFFC0D-7C72-4B4D-9B7A-2317A8E2F689.root");
chain->Add("D50842E9-4E54-5247-AB93-A496E9FE9011.root");
   //chain->Add("root://cmsxrootd.fnal.gov//store/mc/RunIIFall17NanoAODv4/DYJetsToLL_M-50_TuneCP5_13TeV-amcatnloFXFX-pythia8/NANOAODSIM/PU2017_12Apr2018_Nano14Dec2018_102X_mc2017_realistic_v6-v1/20000/CCF670CF-51AD-FA46-8EEF-A10CE19C3474.root");
   Bool_t HLT_PFHT510; 
   chain->SetBranchAddress("HLT_PFHT510", &HLT_PFHT510);

   Int_t nFatJet; 
   chain->SetBranchAddress("nFatJet", &nFatJet);

   Float_t FatJet_msoftdrop[100];
   chain->SetBranchAddress("FatJet_msoftdrop", FatJet_msoftdrop);

   Float_t FatJet_pt[100];
   chain->SetBranchAddress("FatJet_pt", FatJet_pt);

   Int_t Electron_cutBased_Fall17_V1[100];
   chain->SetBranchAddress("Electron_cutBased_Fall17_V1",Electron_cutBased_Fall17_V1);

   Int_t nElectron;
   chain->SetBranchAddress("nElectron", &nElectron);

   Float_t Electron_eta[100];
   chain->SetBranchAddress("Electron_eta",Electron_eta);

   Float_t Electron_pt[100];
   chain->SetBranchAddress("Electron_pt",Electron_pt);

   Int_t nMuon;
   chain->SetBranchAddress("nMuon",&nMuon);

   Bool_t Muon_mediumId[100];
   chain->SetBranchAddress("Muon_mediumId",Muon_mediumId);

   Float_t Muon_pt[100];
   chain->SetBranchAddress("Muon_pt",Muon_pt);

   Float_t Muon_eta[100];
   chain->SetBranchAddress("Muon_eta",Muon_eta);

   Int_t nTau;
   chain->SetBranchAddress("nTau",&nTau);

   Float_t Tau_pt[100];
   chain->SetBranchAddress("Tau_pt",Tau_pt);
   Float_t Tau_eta[100];
   chain->SetBranchAddress("Tau_eta",Tau_eta);

   Int_t FatJet_jetId[100];
   chain->SetBranchAddress("FatJet_jetId",FatJet_jetId);

   Float_t FatJet_eta[100];
   chain->SetBranchAddress("FatJet_eta",FatJet_eta);
  
   Int_t Tau_idMVAoldDM2017v2[100];
   chain->SetBranchAddress("Tau_idMVAoldDM2017v2",Tau_idMVAoldDM2017v2);

   UInt_t luminosityBlock;
   chain->SetBranchAddress("luminosityBlock",&luminosityBlock);

   Float_t MET_pt;
   chain->SetBranchAddress("MET_pt",&MET_pt);

   Float_t FatJet_phi[100];
   chain->SetBranchAddress("FatJet_phi",FatJet_phi);

   Float_t MET_phi;
   chain->SetBranchAddress("MET_phi",&MET_phi);

   Bool_t Electron_mvaFall17V1Iso_WP90[100];
   chain->SetBranchAddress("Electron_mvaFall17V1Iso_WP90",Electron_mvaFall17V1Iso_WP90);

   UChar_t Muon_miniIsoId[100];
   chain->SetBranchAddress("Muon_miniIsoId",Muon_miniIsoId);
   
   Bool_t Electron_convVeto[100];
   chain->SetBranchAddress("Electron_convVeto",Electron_convVeto);

   UInt_t nPhoton;
   chain->SetBranchAddress("nPhoton",&nPhoton);

   Float_t Photon_eta[100];
   chain->SetBranchAddress("Photon_eta",Photon_eta);

   Float_t Photon_pt[100];
   chain->SetBranchAddress("Photon_pt",Photon_pt);

   Int_t Photon_cutBasedBitmap[100];
   chain->SetBranchAddress("Photon_cutBasedBitmap",Photon_cutBasedBitmap);

   Bool_t Photon_electronVeto[100];
   chain->SetBranchAddress("Photon_electronVeto",Photon_electronVeto);

   Bool_t Photon_mvaID_WP90[100];
   chain->SetBranchAddress("Photon_mvaID_WP90",Photon_mvaID_WP90);

   Bool_t Muon_triggerIdLoose[100];
   chain->SetBranchAddress("Muon_triggerIdLoose",Muon_triggerIdLoose);

   Int_t Electron_cutBased[100];
   chain->SetBranchAddress("Electron_cutBased",Electron_cutBased);


   TH1D * h_lead_FatJet_pt = new TH1D("h_lead_FatJet_pt", ";leading AK8 jet p_{T} [GeV];events ", 40, 0., 2000.);
   TH1D * h_sublead_FatJet_pt = new TH1D("h_sublead_FatJet_pt", ";sub-leading AK8 jet p_{T} [GeV];events", 40, 0., 2000.);
   TH1D * h_jet3_FatJet_pt = new TH1D("h_jet3_FatJet_pt", ";Jet 3 AK8 jet p_{T} [GeV];events", 40, 0., 2000.);
   TH1D * h_electron_pt = new TH1D("h_electron_pt", ";Electron p_{T} [GeV];events", 50, 0., 100.);
   TH1D * h_muon_pt = new TH1D("h_muon_pt", ";leading AK8 jet p_{T} [GeV];events", 50, 0., 100.);  
   TH1D * h_tau_pt = new TH1D("h_tau_pt", ";Tau p_{T} [GeV];events / GeV", 50, 0., 100);
   TH1D * h_photon_pt = new TH1D("h_photon_pt", ";Photon p_{T} [GeV];events", 50, 0., 100.);
   TH1D * h_met_pt = new TH1D("h_met_pt", ";MET p_{T} [GeV];events", 50, 0., 250.);

   TH1D * h_nelectrons_idcut = new TH1D("h_nelectrons_idcut", ";Number Electrons after ID cut per event;events", 12, 0, 12.);
   TH1D * h_nelectrons_ptcut = new TH1D("h_nelectrons_ptcut", ";Number Electrons after pt cut per event;events", 12, 0, 12.);
   TH1D * h_nelectrons_etacut = new TH1D("h_nelectrons_etacut", ";Number Electrons after Eta Cut per event;events", 12, 0, 12.);
   TH1D * h_nelectrons_vetocut = new TH1D("h_nelectrons_vetocut", ";Number Electrons after Veto Cut per event;events", 12, 0, 12.);
   TH1D * h_nelectrons_isocut = new TH1D("h_nelectrons_isocut", ";Number Electrons after Iso Cut per event;events", 12, 0, 12.);


   TH1D * h_nelectrons_uc = new TH1D("h_nelectrons_uc", ";Uncut Number Electrons per event;events", 12, 0, 12.);
   TH1D * h_nmuons_uc = new TH1D("h_nmuons_uc", ";Uncut Number of Muons per event;events", 12, 0, 12);
   TH1D * h_fatjets_uc = new TH1D("h_fatjets_uc", ";Uncut Number of Fat Jets per event;events", 12, 0, 12);
   TH1D * h_nphotons_uc = new TH1D("h_nphotons_uc", ";Uncut Number Photons per event;events ", 12, 0, 12.);

   TH1D * h_nelectrons = new TH1D("h_nelectrons", ";Number Electrons per event;events", 12, 0, 12.);
   TH1D * h_nmuons = new TH1D("h_nmuons", ";Number of Muons per event;events", 12, 0, 12);
   TH1D * h_ntaus = new TH1D("h_ntaus", ";Number of Taus per event;events", 12, 0,12);
   TH1D * h_nFatJet = new TH1D("h_nFatJet", ";Number of AK8 jets per event;events", 12, 0, 12);
   TH1D * h_nphotons = new TH1D("h_nphotons", ";Number of Photons per event;events", 12, 0, 12);

   TH1D * h_dptx = new TH1D("h_dptx", "; Sum of xpt [GeV];events", 50, 0, 300);
   TH1D * h_dpty = new TH1D("h_dpty", "; Sum of ypt [GeV];events", 50, 0, 300);
   TH1D * h_jet_pt_sum = new TH1D("h_jet_pt_sum", "; |Sum of jet pt|;events", 50, 0, 400);
   TH1D * h_met_dpt = new TH1D("h_met_dpt", "; |MET pt + Sum of jet pt|; events", 50, 0, 400);
   TH1D * h_met_sum_dphi = new TH1D("h_met_sum_dphi", "; Delta Phi Between Sum of Jet Momenta and MET Vector;events", 20, 0, 4.);

   TH1D * h_cut_met_sum_dphi = new TH1D("h_cut_met_sum_dphi", "; Delta Phi Between Sum of Jet Momenta and MET Vector for MET pt < 45 GeV;events", 20, 0, 4.);
   TH1D * h_cut_met_dpt = new TH1D("h_cut_met_dpt", "; |MET pt + Sum of jet pt| for MET pt < 45 GeV; events", 50, 0, 400);

            //Event//
   for (int i = 0; i < chain->GetEntries(); ++i) {
      totalevents++;
      if (i%10000==0) std::cout << "beginning entry " << i << std::endl;

      lumievents++;

      chain->GetEntry(i);
      if (HLT_PFHT510==false) continue;
      passtrigger++;

      int nCutPhotons = 0;
      h_nphotons_uc->Fill(nPhoton);
      for (int j=0; j<nPhoton; j++) {
         if ((Photon_pt[j]< 10.) || (Photon_cutBasedBitmap[j]< 2) || (Photon_electronVeto[j] == false) || (abs(Photon_eta[j])> 2.5)) continue;
         nCutPhotons++;
         h_photon_pt->Fill(Photon_pt[j]);
      }
      if (nCutPhotons > 0) h_nphotons->Fill(nCutPhotons);
      if(nCutPhotons >0) continue;

      nophotons++;
      //Electrons///////////////////////////////////////////////////////////////////////
      int nCutElectrons=0;
      int nElectron_idcut =0;
      int nElectron_ptcut = 0;
      int nElectron_etacut = 0;
      int nElectron_vetocut = 0;
      int nElectron_isocut = 0;
      h_nelectrons_uc->Fill(nElectron);
      h_nmuons_uc->Fill(nMuon);

      for (int j=0; j<nElectron; j++ ){

         if ((Electron_cutBased[j] < 2)) continue;
         nElectron_idcut++;
         if (Electron_pt[j] < 8.) continue;
         nElectron_ptcut++;
         if (abs(Electron_eta[j]) > 2.5) continue;
         nElectron_etacut++;
         if (Electron_convVeto[j]==false) continue;
         nElectron_vetocut++;
         //isolation: if this is an isolated electron, mark as real electron
         if (Electron_mvaFall17V1Iso_WP90[j] == false) continue;

         nCutElectrons++;
         h_electron_pt->Fill(Electron_pt[j]);
      }
      if (nElectron_idcut >0) h_nelectrons_idcut->Fill(nElectron_idcut);
      if (nElectron_ptcut >0) h_nelectrons_ptcut->Fill(nElectron_ptcut);
      if (nElectron_etacut >0) h_nelectrons_etacut->Fill(nElectron_etacut);
      if (nElectron_vetocut >0) h_nelectrons_vetocut->Fill(nElectron_vetocut);
      if (nCutElectrons>0) h_nelectrons_isocut->Fill(nCutElectrons);
         
      if (nCutElectrons>0) h_nelectrons->Fill(nCutElectrons);
      if (nCutElectrons > 0) continue;

      noelectrons++;




      //Muons//////////////////////////////////////////////////////////////////////////
      int nCutMuons=0;
      for (int j=0; j<nMuon; j++){
         if ((Muon_triggerIdLoose[j] == true) && (Muon_pt[j] > 8.) && (abs(Muon_eta[j]) < 2.4)) {

            if (Muon_miniIsoId[j] < 2) continue;   //only count isoalted muons
            nCutMuons++;
            h_muon_pt->Fill(Muon_pt[j]);

         }
      }
      if (nCutMuons>0) h_nmuons->Fill(nCutMuons);
      if (nCutMuons>0) continue;

      nomuons++;


      //Taus////////////////////////////////////////////////////////////////////////////
      int nCutTaus = 0;
      for (int j=0; j <nTau; j++) {
         int tau_iso = log2(Tau_idMVAoldDM2017v2[j]);
         if ((tau_iso <3) || (abs(Tau_eta[j]) > 2.5)) continue;

         nCutTaus++;
         h_tau_pt->Fill(Tau_pt[j]);

      }
      h_ntaus->Fill(nCutTaus);
      if (nCutTaus > 0) continue;

      notaus++;



      //Jets////////////////////////////////////////////////////////////////////////////
      int nAK8Jets = 0;
      int lead_FatJet_idx    = -1;
      int sublead_Fatjet_idx = -1;
      int jet3_Fatjet_idx    = -1;
      h_fatjets_uc->Fill(nFatJet);
      if (nFatJet == 0) continue;
      for (int j = 0; j < nFatJet; j++) {

            // get a hold of 2nd bit of fat jet id, which is for tight jets
            int second_bit = (FatJet_jetId[j] & ( 1 << 2 )) >> 2;
            if ((second_bit != 1) || (abs(FatJet_eta[j]) > 2.7) || (FatJet_pt[j] < 200.)) continue;
            nAK8Jets++;
            if (lead_FatJet_idx == -1) lead_FatJet_idx = j;
            else if (sublead_Fatjet_idx == -1) sublead_Fatjet_idx = j;
            else if (jet3_Fatjet_idx == -1) jet3_Fatjet_idx = j;
         //}
      }

      h_nFatJet->Fill(nAK8Jets);
      if (nAK8Jets != 3) continue;

      threejets++; 

      if (lead_FatJet_idx != -1) h_lead_FatJet_pt->Fill(FatJet_pt[lead_FatJet_idx]);
      if (sublead_Fatjet_idx != -1) h_sublead_FatJet_pt->Fill(FatJet_pt[sublead_Fatjet_idx]);
      if (jet3_Fatjet_idx != -1) h_jet3_FatJet_pt->Fill(FatJet_pt[jet3_Fatjet_idx]);

      if ((lead_FatJet_idx == -1) || (sublead_Fatjet_idx == -1) || (jet3_Fatjet_idx == -1)) continue;

      //MET//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      float pt_sum = calc_pt_sum(FatJet_pt[lead_FatJet_idx], FatJet_phi[lead_FatJet_idx], FatJet_pt[sublead_Fatjet_idx], FatJet_phi[sublead_Fatjet_idx], FatJet_pt[jet3_Fatjet_idx], FatJet_phi[jet3_Fatjet_idx]);
      float pty = calc_dpty(FatJet_pt[lead_FatJet_idx], FatJet_phi[lead_FatJet_idx], FatJet_pt[sublead_Fatjet_idx], FatJet_phi[sublead_Fatjet_idx], FatJet_pt[jet3_Fatjet_idx], FatJet_phi[jet3_Fatjet_idx]);
      float ptx = calc_dptx(FatJet_pt[lead_FatJet_idx], FatJet_phi[lead_FatJet_idx], FatJet_pt[sublead_Fatjet_idx], FatJet_phi[sublead_Fatjet_idx], FatJet_pt[jet3_Fatjet_idx], FatJet_phi[jet3_Fatjet_idx]);
      if(calc_dphi(MET_phi, ptx, pty)>0) h_met_sum_dphi->Fill(calc_dphi(MET_phi, ptx, pty));
      h_met_dpt->Fill(calc_dpt(MET_phi, MET_pt, ptx,pty));
      h_dptx->Fill(ptx);
      h_dpty->Fill(pty);
      h_jet_pt_sum->Fill(pt_sum);
      h_met_pt->Fill(MET_pt);  
      if (MET_pt < 40.) {
         if(calc_dphi(MET_phi, ptx, pty)>0) h_cut_met_sum_dphi->Fill(calc_dphi(MET_phi, ptx, pty));
         h_cut_met_dpt->Fill(calc_dpt(MET_phi, MET_pt, ptx,pty));
         lowmet++;

      }

   }


   cout<< totalevents << endl;
   cout <<lumievents << endl;
   cout << passtrigger<< endl;
   cout << nophotons  << endl;
   cout << noelectrons<< endl;
   cout << nomuons<< endl;
   cout << notaus<< endl;
   cout <<threejets << endl;
   cout << lowmet<< endl;

   TCanvas * c = new TCanvas("c", "", 800, 600);
   TFile *f = new TFile("jets3.root","recreate");
   f->cd();
   h_lead_FatJet_pt->Draw();
   h_lead_FatJet_pt->Print();
   h_lead_FatJet_pt->Write();

   h_sublead_FatJet_pt->Draw();
   h_sublead_FatJet_pt->Print();
   h_sublead_FatJet_pt->Write();

   h_jet3_FatJet_pt->Draw();
   h_jet3_FatJet_pt->Print();
   h_jet3_FatJet_pt->Write();

   h_electron_pt->Draw(); 
   h_electron_pt->Print();
   h_electron_pt->Write();

   h_muon_pt->Draw(); 
   h_muon_pt->Print();
   h_muon_pt->Write();

   h_tau_pt->Draw(); 
   h_tau_pt->Print();
   h_tau_pt->Write();

   h_nelectrons->Draw(); 
   h_nelectrons->Draw();
   h_nelectrons->Write();

   h_nmuons->Draw();
   h_nmuons->Print(); 
   h_nmuons->Write();

   h_ntaus->Draw();
   h_ntaus->Print();
   h_ntaus->Write();

   h_nFatJet->Draw();
   h_nFatJet->Print();
   h_nFatJet->Write();

   h_dptx->Draw();
   h_dptx->Print();
   h_dptx->Write();

   h_dpty->Draw();
   h_dpty->Print();
   h_dpty->Write();

   h_jet_pt_sum->Draw();
   h_jet_pt_sum->Print();
   h_jet_pt_sum->Write();

   h_met_dpt->Draw();
   h_met_dpt->Print();
   h_met_dpt->Write();

   h_met_sum_dphi->Draw();  
   h_met_sum_dphi->Print(); 
   h_met_sum_dphi->Write();

   h_nelectrons_uc->Draw();
   h_nelectrons_uc->Print();
   h_nelectrons_uc->Write();

   h_nmuons_uc->Draw();
   h_nmuons_uc->Print();
   h_nmuons_uc->Write();

   h_fatjets_uc->Draw();
   h_fatjets_uc->Print();
   h_fatjets_uc->Write();

   h_nphotons->Draw();
   h_nphotons->Print();
   h_nphotons->Write();

   h_photon_pt->Draw();
   h_photon_pt->Print();
   h_photon_pt->Write();

   h_nphotons_uc->Draw();
   h_nphotons_uc->Print();
   h_nphotons_uc->Write();

   h_nelectrons_idcut->Draw();
   h_nelectrons_idcut->Print();
   h_nelectrons_idcut->Write();

   h_nelectrons_ptcut->Draw();
   h_nelectrons_ptcut->Print();
   h_nelectrons_ptcut->Write();

   h_nelectrons_etacut->Draw();
   h_nelectrons_etacut->Print();
   h_nelectrons_etacut->Write();

   h_nelectrons_vetocut->Draw();
   h_nelectrons_vetocut->Print();
   h_nelectrons_vetocut->Write();

   h_nelectrons_isocut->Draw();
   h_nelectrons_isocut->Print();
   h_nelectrons_isocut->Write();

   h_met_pt->Draw();
   h_met_pt->Print();
   h_met_pt->Write();

   h_cut_met_sum_dphi->Draw();
   h_cut_met_sum_dphi->Print();
   h_cut_met_sum_dphi->Write();

   h_cut_met_dpt->Draw();
   h_cut_met_dpt->Print();
   h_cut_met_dpt->Write();

   f->Close();


}

void jets() {

   jets_eventloop();
   


}

