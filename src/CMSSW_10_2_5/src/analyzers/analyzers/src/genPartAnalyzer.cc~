// system include files
#include <memory>
// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/EDAnalyzer.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"
// new includes
#include "DataFormats/HepMCCandidate/interface/GenParticle.h"
#include "DataFormats/JetReco/interface/GenJet.h"
#include "FWCore/ServiceRegistry/interface/Service.h"
#include "CommonTools/UtilAlgos/interface/TFileService.h"
#include "DataFormats/PatCandidates/interface/Jet.h"
#include "PhysicsTools/CandUtils/interface/Thrust.h"
#include <TTree.h>
#include "TLorentzVector.h"
#include "DataFormats/Candidate/interface/Candidate.h"
#include  "DataFormats/PatCandidates/interface/PackedCandidate.h"
#include "DataFormats/Candidate/interface/LeafCandidate.h"
using namespace reco;
class genPartAnalyzer : public edm::EDAnalyzer {
public:
   explicit genPartAnalyzer(const edm::ParameterSet&);
private:
   virtual void analyze(const edm::Event&, const edm::EventSetup&);
   void calc_boosted_jet(double jet_daughters[6][300], int nconstituents, double boost_val);

   edm::EDGetTokenT<std::vector<reco::GenParticle>> genPartToken_;
   edm::EDGetTokenT<std::vector<reco::GenJet>> genJetToken_;
   edm::EDGetTokenT<std::vector<pat::Jet>> fatJetToken_;
   edm::EDGetTokenT<std::vector<pat::PackedCandidate>> ppfCandToken_;

   TTree * tree;
   int ngenPart;
   int ngenJet;
   int nfatJet;
   int nconstituents;
   int jetnDaughters[100];
   double pt[100], eta[100], phi[100], jetpt[100], jeteta[100], jetphi[100], genjetpt[100], genjeteta[100], genjetphi[100];
   double jet_daughters[6][300];
   double Z2pt, Z1pt, Z1eta, Z2eta, Z1phi, Z2phi, Z1E, Z2E, thrust;
};

genPartAnalyzer::genPartAnalyzer(const edm::ParameterSet& iConfig)
{
   genPartToken_ = consumes<std::vector<reco::GenParticle>>(iConfig.getParameter<edm::InputTag>("genPartCollection"));
   genJetToken_ =    consumes<std::vector<reco::GenJet>>(iConfig.getParameter<edm::InputTag>("genJetCollection"));
   fatJetToken_ =    consumes<std::vector<pat::Jet>>(iConfig.getParameter<edm::InputTag>("fatJetCollection"));
   ppfCandToken_ =    consumes<std::vector<pat::PackedCandidate>>(iConfig.getParameter<edm::InputTag>("packedPFCandidateCollection"));

   edm::Service<TFileService> fs;      genJetToken_ =    consumes<std::vector<reco::GenJet>>(iConfig.getParameter<edm::InputTag>("genJetCollection"));
   tree = fs->make<TTree>("tree", "tree");

   tree->Branch("ngenPart", &ngenPart, "ngenPart/I");
   tree->Branch("nfatJet", &nfatJet, "nfatJet/I");
   tree->Branch("ngenJet", &ngenJet, "ngenJet/I");
   tree->Branch("nconstituents", &nconstituents, "nconstituents/I");
   tree->Branch("thrust", &thrust, "thrust/D");
   tree->Branch("pt", pt, "pt[ngenPart]/D");
   tree->Branch("eta", eta, "eta[ngenPart]/D");
   tree->Branch("phi", phi, "phi[ngenPart]/D");
   tree->Branch("Z1pt", &Z1pt, "Z1pt/D");
   tree->Branch("Z2pt", &Z2pt, "Z2pt/D");
   tree->Branch("Z1eta", &Z1eta, "Z1eta/D");
   tree->Branch("Z2eta", &Z2eta, "Z2eta/D");
   tree->Branch("Z1phi", &Z1phi, "Z1phi/D");
   tree->Branch("Z2phi", &Z2phi, "Z2phi/D");
   tree->Branch("Z1E", &Z1E, "Z1E/D");
   tree->Branch("Z2E", &Z2E, "Z2E/D");



   tree->Branch("jetpt", jetpt, "jetpt[nfatJet]/D");
   tree->Branch("jeteta", jeteta, "jeteta[nfatJet]/D");
   tree->Branch("jetphi", jetphi, "jetphi[nfatJet]/D");
   tree->Branch("jetnDaughters", jetnDaughters, "jetnDaughters[nfatJet]/I");
   tree->Branch("genjetpt", genjetpt, "genjetpt[ngenJet]/D");
   tree->Branch("genjeteta", genjeteta, "genjeteta[ngenJet]/D");
   tree->Branch("genjetphi", genjetphi, "genjetphi[ngenJet]/D");   
}


//////////////////////////////////////get array of charge, cartesian momentum, energy, and mass, and then returns array of charge, cylindrical energy, energy, and mass
void genPartAnalyzer::calc_boosted_jet(double jet_daughters[6][300], int nconstituents, double boost_val)
{
   for(int i=0; i<nconstituents; i++)
   {
      TLorentzVector v1(jet_daughters[1][i],jet_daughters[2][i],jet_daughters[3][i],jet_daughters[4][i]);
      v1.Boost(0,0,boost_val);
      jet_daughters[1][i] = v1.Pt();
      jet_daughters[2][i] = v1.Eta();
      jet_daughters[3][i] = v1.Phi();
      jet_daughters[4][i] = v1.E();

   }
}
void genPartAnalyzer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
   ngenPart = 0;
   edm::Handle<std::vector<reco::GenParticle>> genParticles;
   iEvent.getByToken(genPartToken_, genParticles);
   int nZ0 = 0;
   for (auto iM = genParticles->begin(); iM != genParticles->end(); ++iM) 
   {


      if((iM->pdgId() !=23) || (iM->isLastCopy() == false)) continue;

      pt[ngenPart] = iM->pt();  
      eta[ngenPart] = iM->eta();
      phi[ngenPart] = iM->phi();
      nZ0++;
      
      if(nZ0 == 1) 
      {
         Z1pt = iM->pt();
         Z1phi = iM->phi();
         Z1eta = iM->eta();
         Z1E   = iM->energy();
      }
      else if (nZ0 == 2)
      {  
         Z2phi = iM->phi();
         Z2eta = iM->eta();
         Z2E   = iM->energy();
         Z2pt = iM->pt();
      }
      ++ngenPart;

   }



////////////////////Jets/////////////////////////////////////////

   edm::Handle<std::vector<reco::GenJet>> genJets;
   iEvent.getByToken(genJetToken_, genJets);
   ngenJet = 0;
   for(auto iM = genJets->begin(); iM != genJets->end(); ++iM) 
   {
      genjetpt[ngenJet] = iM->pt();
      genjetphi[ngenJet]= iM->phi();
      genjeteta[ngenJet]= iM->eta();

      ++ngenJet;
   }  





/////////////////////////AK8 Jets//////////////////////////////////////////////////////////////////////////
   edm::Handle<std::vector<pat::Jet>> fatJets;
   iEvent.getByToken(fatJetToken_, fatJets);
   int jetnum = 0;                                          //////////////Something to iterate to make sure only the 2 highest pt jets are chosen
   std::vector<LeafCandidate> constituents;       /////////////where the list of daughters of two jets will be stored

   if (fatJets->size() < 2) return;                        ////////////only want events w/ at least 2 jets

   nfatJet = 0;
   nconstituents = 0;
   for(auto iM = fatJets->begin(); iM != fatJets->end(); ++iM)
   { 
      if(iM->isPFJet() == false) continue;                  //don't want to count subjets
      jetpt[nfatJet] = iM->pt();
      jetphi[nfatJet]= iM->phi();
      jeteta[nfatJet]= iM->eta();
      jetnDaughters[nfatJet] = iM->numberOfDaughters();
      ++nfatJet;


      if ((iM->pt() < 250.) || (jetnum > 2)) continue;       //below is where we get list of daughter particles from two highest pt jets.
      //nconstituents+= (iM->numberOfDaughters()+ iM->daughter(0)->numberOfDaughters() + iM->daughter(1)->numberOfDaughters);    //possible bug here for numdaughters(0 or 1) not equal to 0
      for(unsigned ida = 0; ida < iM->numberOfDaughters(); ++ida)    //loop over all daughter particles of jet
      {
         const reco::Candidate* cand = iM->daughter(ida);           // define candidate daughter particles that are added into vector in next line

         if (cand->numberOfDaughters() == 0)
         {
         //constituents.push_back(LeafCandidate(cand->charge(), Particle::LorentzVector(cand->pt(),cand->eta(),cand->phi(),cand->mass())));
            jet_daughters[0][nconstituents] = cand->charge();    
            jet_daughters[1][nconstituents] = cand->px();     
            jet_daughters[2][nconstituents] = cand->py();     
            jet_daughters[3][nconstituents] = cand->pz();     
            jet_daughters[4][nconstituents] = cand->energy();   
            jet_daughters[5][nconstituents] = cand->mass();   

            nconstituents++;
         }
         else 
         {
            for (unsigned jda = 0; jda < cand->numberOfDaughters(); ++jda)
            {
               const reco::Candidate* cand2 = cand->daughter(jda);
               jet_daughters[0][nconstituents] = cand2->charge();    
               jet_daughters[1][nconstituents] = cand2->px();     
               jet_daughters[2][nconstituents] = cand2->py();     
               jet_daughters[3][nconstituents] = cand2->pz();     
               jet_daughters[4][nconstituents] = cand2->energy(); 
               jet_daughters[5][nconstituents] = cand2->mass();   

               nconstituents++;
               //constituents.push_back(LeafCandidate(cand2->charge(), Particle::LorentzVector(cand2->pt(),cand->eta(),cand2->phi(),cand->mass())));
            }
         } 
      }

      calc_boosted_jet(jet_daughters, nconstituents, 0.999);
      for (int i=0; i<nconstituents; i++)
      {  
         constituents.push_back(LeafCandidate(jet_daughters[0][i],Particle::LorentzVector(jet_daughters[1][i],jet_daughters[2][i],jet_daughters[3][i],jet_daughters[5][i])));
      }
   ////////////////At this point, the jet daughters are all in the "constituents" vector and can be given to the Thrust function///////////////


      ++jetnum;
   }
   auto it1 = constituents.begin();          //Constituent iterators to be given to Thrust class constructor as inputs
   auto it2 = constituents.end();
   //nconstituents = constituents.size();

   Thrust t(it1, it2);
   thrust = t.thrust();
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   

/*
   edm::Handle<std::vector<pat::PackedCandidate>> ppfCand;
   iEvent.getByToken(ppfCandToken_, ppfCand);
   Thrust t(ppfCand->begin(),ppfCand->end());
   thrust = t.thrust();

*/
   tree->Fill();
}

//define this as a plug-in
DEFINE_FWK_MODULE(genPartAnalyzer);

