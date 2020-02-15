#include "datatypes.hpp"
#include "toplevel.hpp"
#include <iostream>
#include "hls_stream.h"
using namespace std;

#define N_CYCLES 3
#define __PRINT_PATTERN__ 1
#define PRINT_LANES 20

int main(){

	adcaxis_t istream[N_GROUPS*N_CYCLES], qstream[N_GROUPS*N_CYCLES];
	pfbaxisin_t lane[N_GROUPS*N_CYCLES][N_LANES];
	bool fail=false;

	//Generate data
	for (int i=0; i<N_CYCLES; i++){
		for (int j=0; j<N_GROUPS; j++){
			for (int k=0; k<N_ADC_OUT; k++){
				istream[i*N_GROUPS+j].data[k]=i*N_GROUPS*N_ADC_OUT+j*N_ADC_OUT+k;
				qstream[i*N_GROUPS+j].data[k]=0;//i*N_GROUPS*N_ADC_OUT+j*N_ADC_OUT+k;
			}
		}
	}

	//Run the stream input
	for (int i=0; i<N_CYCLES;i++) { // Go through more than once to see the phase increment
		for (int j=0;j<N_GROUPS;j++) { //takes N_RES_GROUPS cycles to get through each resonator once
			adc_to_opfb(istream[i*N_GROUPS+j], qstream[i*N_GROUPS+j], lane[i*N_GROUPS+j]);
		}
	}

	//Compare the result
	for (int k=0; k<N_LANES; k++){
		for (int i=0; i<N_CYCLES;i++) { // Go through more than once to see the phase increment
			if (i==0 &&k<PRINT_LANES) cout<<"Lane "<<k<<",";
			for (int j=0;j<N_GROUPS;j++) { //takes N_RES_GROUPS cycles to get through each resonator once

				//istream[j].data[k/2] odds went into odd k
				//istream[j].data[k/2] evens went into even k
				int cycle=N_GROUPS*i+j;
				bool even_lane=(k+1)%2;
				bool odd_lane=k%2;
				bool odd_cycle=cycle%2;
				bool even_cycle=(cycle+1)%2;

				int predicted=N_LANES*(cycle-1)/2 + 8*odd_lane + k/2 - 2040*even_cycle;
				int lanev=lane[cycle][k].data.to_int()&0xffff;// real();

				if ((k<PRINT_LANES&&i>0)&&!PRINT_LANES) {
					cout<<"p"<<predicted;
					if (predicted==lanev) cout<<"==";
					else cout<<"!=";
					cout<<lanev<<", ";
				}

				#ifdef __PRINT_PATTERN__
					if (k<PRINT_LANES&i>0) cout<<lanev<<", ";
				#endif

				fail|= (predicted!=lanev&&i>0);
			}
		}
		if (k<PRINT_LANES) cout<<"\n";
	}

	if (!fail) cout<<"PASS!!\n";
	return fail ? 1:0;

}
