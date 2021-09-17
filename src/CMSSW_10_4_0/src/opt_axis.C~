#include <iostream>
#include <TChain.h>
#include <TH1D.h>
#include <TCanvas.h>
#include <cmath>

float calc_opt_axis(float phi1, float phi2, float pt1, float pt2) {
	float startphi = 0;
	float endphi = 2*M_PI;
	float nsteps = 1000;
	float nsteps2 = 10000;
	float pt1x = pt1*cos(phi1);
	float pt1y = pt1*sin(phi1);
	float pt2x = pt2*cos(phi2);
	float pt2y = pt2*sin(phi2);
	float min = 99999999999999.;
	float min_theta = 9999999999.;
	float theta;
	float transf_sq;


	for (int j=0; j<nsteps; j++){

		theta = startphi + j*(endphi-startphi)/nsteps;
		transf_sq = pow((pt1x*sin(theta)+pt1y*cos(theta)),2) + pow((pt2x*sin(theta) + pt2y*cos(theta)),2);
		

		if (transf_sq < min) {
			min = transf_sq;
			min_theta = theta;
			cout << transf_sq << " " << theta << " " << j << endl;

		} 

	}
	cout << "Round 2" << endl;
	for (int i=0; i<nsteps2; i++){
		endphi   = min_theta + M_PI/12.;
		startphi = min_theta - M_PI/12.;
		theta = startphi + i*(endphi-startphi)/nsteps2;
		transf_sq = pow((pt1x*sin(theta)+pt1y*cos(theta)),2) + pow((pt2x*sin(theta) + pt2y*cos(theta)),2);

		if (transf_sq < min) {
			min = transf_sq;
			min_theta = theta;
			cout << transf_sq << " " << theta << " " << i<< endl;

		}
	}

	//cout << min;
	return min_theta;
}

int opt_axis() {

	cout << calc_opt_axis(3.4612, 0.293, 25, 18) << endl;

	return 0;
}
