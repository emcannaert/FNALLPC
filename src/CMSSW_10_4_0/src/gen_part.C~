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
   float lead_pty = lead_pt*sin(lead_phi);
   float sublead_ptx = sublead_pt*cos(sublead_phi);
   float sublead_pty = sublead_pt*sin(sublead_phi);
   float jet3_ptx = jet3_pt*cos(jet3_phi);
   float jet3_pty = jet3_pt*sin(jet3_phi);

   float delta_ptx = lead_ptx + sublead_ptx +jet3_ptx;

   return delta_ptx;

}

float calc_dpty(float lead_pt, float lead_phi, float sublead_pt, float sublead_phi, float jet3_pt, float jet3_phi)
{
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
   if (abs(met_dphi - sum_phi) > M_PI) {
      return (abs(M_PI - abs(met_dphi - sum_phi)));
   }
   else {
      return abs(met_dphi - sum_phi);
   } 
   
}
float calc_inv_mass(float pt1, float phi1, float mass1, float eta1, float pt2, float phi2, float mass2, float eta2){
   float theta1 = 2*atan(exp(-eta1));
   float theta2 = 2*atan(exp(-eta2));

   float E21 = sqrt(pow(pt1/sin(theta1),2) + pow(mass1,2));
   float E22 = sqrt(pow(pt2/sin(theta2),2) + pow(mass2,2));
   float Etot = E21 + E22;
   float dptx2 = pow((pt1*cos(phi1)+ pt2*cos(phi2)),2);
   float dpty2 = pow((pt1*sin(phi1)+ pt2*sin(phi2)),2);
   float dpz   = pow((pt1/tan(theta1)+pt2/tan(theta2)),2);
   float inv_mass = sqrt(pow(Etot,2)-dptx2-dpty2-dpz);

   return inv_mass;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
void jets_eventloop()

{  


   TChain * chain = new TChain("Events");
   //chain->Add("C2A75FC1-6E4E-E811-AED8-0CC47AB35DC0.root");
   //chain->Add("9684B2B7-CF4D-E811-A0F4-0CC47AB35DC0.root");
   chain->Add("root://cmsxrootd.fnal.gov//store/mc/RunIIFall17NanoAODv4/DYJetsToLL_M-50_TuneCP5_13TeV-amcatnloFXFX-pythia8/NANOAODSIM/PU2017_12Apr2018_Nano14Dec2018_102X_mc2017_realistic_v6-v1/20000/CCF670CF-51AD-FA46-8EEF-A10CE19C3474.root");
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

   Float_t Electron_pt[100];
   chain->SetBranchAddress("Electron_pt",Electron_pt);

   Int_t nMuon;
   chain->SetBranchAddress("nMuon",&nMuon);

   Bool_t Muon_mediumId[100];
   chain->SetBranchAddress("Muon_mediumId",Muon_mediumId);

   Float_t Muon_pt[100];
   chain->SetBranchAddress("Muon_pt",Muon_pt);

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

   Int_t Electron_charge[100];
   chain->SetBranchAddress("Electron_charge",Electron_charge);

   Bool_t Electron_mvaFall17V1Iso_WP90[100];
   chain->SetBranchAddress("Electron_mvaFall17V1Iso_WP90",Electron_mvaFall17V1Iso_WP90);

   UChar_t Muon_miniIsoId[100];
   chain->SetBranchAddress("Muon_miniIsoId",Muon_miniIsoId);
   
   Bool_t Electron_convVeto[100];
   chain->SetBranchAddress("Electron_convVeto",Electron_convVeto);

   UInt_t nGenPart;
   chain->SetBranchAddress("nGenPart", &nGenPart);

   Int_t GenPart_genPartIdxMother[100];
   chain->SetBranchAddress("GenPart_genPartIdxMother", GenPart_genPartIdxMother);

   Int_t GenPart_pdgId[100];
   chain->SetBranchAddress("GenPart_pdgId", GenPart_pdgId);

   Float_t Electron_mass[100];
   chain->SetBranchAddress("Electron_mass", Electron_mass);

   Float_t Muon_mass[100];
   chain->SetBranchAddress("Muon_mass", Muon_mass);

   Float_t Electron_phi[100];
   chain->SetBranchAddress("Electron_phi", Electron_phi);

   Int_t Muon_charge[100];
   chain->SetBranchAddress("Muon_charge", Muon_charge);

   Float_t Muon_phi[100];
   chain->SetBranchAddress("Muon_phi", Muon_phi);

   Int_t Tau_charge[100];
   chain->SetBranchAddress("Tau_charge", Tau_charge);

   Float_t Tau_phi[100];
   chain->SetBranchAddress("Tau_phi", Tau_phi);

   Float_t Tau_mass[100];
   chain->SetBranchAddress("Tau_mass", Tau_mass);

   Float_t Electron_eta[100];
   chain->SetBranchAddress("Electron_eta", Electron_eta);

   Float_t Muon_eta[100];
   chain->SetBranchAddress("Muon_eta", Muon_eta);

   TH1D * h_lead_FatJet_pt = new TH1D("h_lead_FatJet_pt", ";leading AK8 jet p_{T} [GeV];events / GeV", 20, 250., 1250.);
   TH1D * h_sublead_FatJet_pt = new TH1D("h_sublead_FatJet_pt", ";sub-leading AK8 jet p_{T} [GeV];events / 50 GeV", 20, 250., 1250.);
   TH1D * h_jet3_FatJet_pt = new TH1D("h_jet3_FatJet_pt", ";Jet 3 AK8 jet p_{T} [GeV];events / 50 GeV", 20, 250., 1250.);
   TH1D * h_electron_pt = new TH1D("h_electron_pt", ";Electron p_{T} [GeV];events / GeV", 50, 0., 50.);
   TH1D * h_muon_pt = new TH1D("h_muon_pt", ";leading AK8 jet p_{T} [GeV];events / GeV", 50, 0., 50.);  
   TH1D * h_tau_pt = new TH1D("h_tau_pt", ";Tau p_{T} [GeV];events / GeV", 50, 0., 50);

   TH1D * h_nelectrons_uc = new TH1D("h_nelectrons_uc", ";Uncut Number Electrons per event;events / num electrons", 12, 0, 12.);
   TH1D * h_nmuons_uc = new TH1D("h_nmuons_uc", ";Uncut Number of Muons per event;events / num muons", 12, 0, 12);

   TH1D * h_nelectrons = new TH1D("h_nelectrons", ";Number Electrons per event;events / num electrons", 12, 0, 12.);
   TH1D * h_nmuons = new TH1D("h_nmuons", ";Number of Muons per event;events / num muons", 12, 0, 12);
   TH1D * h_ntaus = new TH1D("h_ntaus", ";Number of Taus per event;events / num taus", 12, 0,12);
   TH1D * h_nFatJet = new TH1D("h_nFatJet", ";Number of AK8 jets per event;events / num AK8 jets", 12, 0, 12);

   TH1D * h_dptx = new TH1D("h_dptx", "; Sum of x-momentum [GeV];events / GeV", 50, 0, 150);
   TH1D * h_dpty = new TH1D("h_dpty", "; Sum of y-momentum [GeV];events / GeV", 50, 0, 150);
   TH1D * h_jet_pt_sum = new TH1D("h_jet_pt_sum", "; |Sum of jet momentum|; [GeV];events / GeV", 50, 0, 200);
   TH1D * h_met_dpt = new TH1D("h_met_dpt", "; |MET pt - Sum of jet pt|; [GeV];events / GeV", 50, 0, 200);
   TH1D * h_met_sum_dphi = new TH1D("h_met_sum_dphi", "; Delta Phi Between Sum of Jet Momemta and MET Vector;events / radians", 20, 0, 4.);
   TH1D * h_genpart_split = new TH1D("h_genpart_split", "; Split Up of Gen Particle Decay Types; Counts", 10, 0, 5);

   TH1D * h_inv_mass_e = new TH1D("h_inv_mass_e", "; Invariant Mass of Electrons [GeV]; Events", 20, 0, 120);
   TH1D * h_inv_mass_muon = new TH1D("h_inv_mass_muon", "; Invariant Mass of Muons [GeV]; Events", 20, 0, 120);
   TH1D * h_inv_mass_tau = new TH1D("h_inv_mass_tau", "; Invariant Mass of Taus [GeV]; Events", 20, 0, 120);

   int makeshere = 0;
            //Event//
   for (int i = 0; i < chain->GetEntries(); ++i) {
      if (i%10000==0) std::cout << "beginning entry " << i << std::endl;
      if (i > 30000) break;
      chain->GetEntry(i);
      //if (HLT_PFHT510==false) continue;


      //Classify event as muon/electron/tau decay///////////////////////////////////////
      int ngen_taus = 0;
      int ngen_e    = 0;
      int ngen_muons= 0;
      for (int j=0; j<nGenPart; j++){
         if (GenPart_pdgId[GenPart_genPartIdxMother[j]]!= 23) continue;

         if (abs(GenPart_pdgId[j])==11) ngen_e++;
         else if (abs(GenPart_pdgId[j])==13) ngen_muons++;
         else if (abs(GenPart_pdgId[j])==15) ngen_taus++;


      }


     // cout << "taus: " << ngen_taus << ", muons: " << ngen_muons << " electrons: " << ngen_e;

      //Electrons///////////////////////////////////////////////////////////////////////
      int nCutElectrons=0;
      h_nelectrons_uc->Fill(nElectron);
      h_nmuons_uc->Fill(nMuon);
      int neg_charge = 0;
      int pos_charge = 0;
      int pos_idx = 0;
      int neg_idx = 0;

      if (ngen_e == 2) {
      for (int j=0; j<nElectron; j++ ){

         if ((Electron_cutBased_Fall17_V1[j] < 3) || (Electron_pt[j] < 10.) || (abs(Electron_eta[j]) > 2.5) || (Electron_convVeto[j]==false)) continue;
         //isolation: if this is an isolated electron, mark as real electron
         if (Electron_mvaFall17V1Iso_WP90[j] == false) continue;

         nCutElectrons++;

         ////////////////////check to see if electrons are oppositely charged/////////////////////////
         if (Electron_charge[j] < 0){
            neg_idx = j;
            neg_charge = 1;
         }
         else if (Electron_charge[j] > 0) {
               pos_charge = 1;
               pos_idx = j;
         }
         /////////////////////////////////////////////////////////////////////////////////////////////
         h_electron_pt->Fill(Electron_pt[j]);

      }

      if (nCutElectrons>0) h_nelectrons->Fill(nCutElectrons);
      if ((nCutElectrons ==2) && (neg_charge == 1) && (pos_charge == 1)){
         float inv_mass = calc_inv_mass(Electron_pt[pos_idx],Electron_phi[pos_idx],Electron_mass[pos_idx],Electron_eta[pos_idx],Electron_pt[neg_idx],Electron_phi[neg_idx],Electron_mass[neg_idx], Electron_eta[neg_idx]);
         h_inv_mass_e->Fill(inv_mass);
      } 
      h_genpart_split->Fill(0);
      continue;
     // if (nCutElectrons > 0) continue;
   }
      

      else if (ngen_muons==2) {
      //Muons//////////////////////////////////////////////////////////////////////////
      int nCutMuons=0;
      for (int j=0; j<nMuon; j++){
         if ((Muon_mediumId[j] == true) && (Muon_pt[j] > 10.) && (abs(Muon_eta[j]) < 2.4)) {

         if (Muon_miniIsoId[j] < 2) continue;   //only count isoalted muons
         nCutMuons++;
         if (Muon_charge[j] <0){
            neg_idx = j;
            neg_charge = 1;
         }
         else if (Muon_charge[j] > 0){
            pos_idx = j;
            pos_charge = 1;
         }

         h_muon_pt->Fill(Muon_pt[j]);

         }
      }
      if (nCutMuons>0) h_nmuons->Fill(nCutMuons);
      if ((nCutMuons == 2) && (pos_charge == 1) && (neg_charge == 1)) {
         float inv_mass = calc_inv_mass(Muon_pt[pos_idx], Muon_phi[pos_idx], Muon_mass[pos_idx], Muon_eta[pos_idx], Muon_pt[neg_idx], Muon_phi[neg_idx], Muon_mass[neg_idx], Muon_eta[neg_idx]);
         h_inv_mass_muon->Fill(inv_mass);

      }
      h_genpart_split->Fill(1);
      continue;
      //if (nCutMuons>0) continue;
   }

      //Taus////////////////////////////////////////////////////////////////////////////
      else if (ngen_taus==2){
      int nCutTaus = 0;
      for (int j=0; j <nTau; j++) {
         int tau_iso = log2(Tau_idMVAoldDM2017v2[j]);
         if ((tau_iso <3) || (abs(Tau_eta[j]) > 2.5)) continue;

         nCutTaus++;
         if (Tau_charge[j] < 0) {
            neg_idx = j;
            neg_charge = 1;
         }
         else if (Tau_charge[j] > 0){
            pos_idx = j;
            pos_charge = 1;
         }
         h_tau_pt->Fill(Tau_pt[j]);

      }
      h_genpart_split->Fill(2);
      if ((nCutTaus == 2) && (pos_charge == 1) && (neg_charge == 1)){
         float inv_mass = calc_inv_mass(Tau_pt[pos_idx], Tau_phi[pos_idx], Tau_mass[pos_idx], Tau_eta[pos_idx],Tau_pt[neg_idx], Tau_phi[neg_idx], Tau_mass[neg_idx], Tau_eta[neg_idx]);
         h_inv_mass_tau->Fill(inv_mass);
      }
      if (nCutTaus >0) h_ntaus->Fill(nCutTaus);
      continue;
      //if (nCutTaus > 0) continue;
      }
}

   TCanvas * c = new TCanvas("c", "", 800, 600);
   TFile *f = new TFile("jets1.root","recreate");
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

   h_nelectrons_uc->Draw();
   h_nelectrons_uc->Print();
   h_nelectrons_uc->Write();

   h_nmuons_uc->Draw();
   h_nmuons_uc->Print();
   h_nmuons_uc->Write();

   h_genpart_split->Draw();
   h_genpart_split->Print();
   h_genpart_split->Write();

   h_inv_mass_muon->Draw();
   h_inv_mass_muon->Print();
   h_inv_mass_muon->Write();

   h_inv_mass_e->Draw();
   h_inv_mass_e->Print();
   h_inv_mass_e->Write();

   h_inv_mass_tau->Draw();
   h_inv_mass_tau->Print();
   h_inv_mass_tau->Write();
   f->Close();
}

void gen_part() {
   jets_eventloop();

}
void jets_project()
{
   TChain * chain = new TChain("Events");
   chain->Add("C2A75FC1-6E4E-E811-AED8-0CC47AB35DC0.root");
   chain->Add("9684B2B7-CF4D-E811-A0F4-0CC47AB35DC0.root");

   TH1D * h_FatJet_pt = new TH1D("h_FatJet_pt", ";leading AK8 jet p_{T} [GeV];events / 50 GeV", 20, 250., 1250.);  
   chain->Project("h_FatJet_pt", "FatJet_pt[0]", "HLT_AK8PFHT750_TrimMass50==1 && Sum$(FatJet_pt>=250. && FatJet_msoftdrop>=50.)>=3");

   TCanvas * c = new TCanvas("c", "", 400, 400);
   h_FatJet_pt->Draw();
}

