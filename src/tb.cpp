#include "datatypes.hpp"
#include "toplevel.hpp"
#include <iostream>
#include "hls_stream.h"
using namespace std;

#define N_CYCLES 4
#define __PRINT_PATTERN__ 1
#define PRINT_LANES 20

int main(){

	adcaxis_t istream[N_GROUPS*N_CYCLES], qstream[N_GROUPS*N_CYCLES];
	pfbaxisinarray_t lane[N_GROUPS*N_CYCLES][N_LANES];

	adcstream_t iin, qin;
	firstream_t iqout;

	bool fail=false;

	//Generate data
	for (int i=0; i<N_CYCLES; i++){
		for (int j=0; j<N_GROUPS; j++){
			for (int k=0; k<N_ADC_OUT; k++){
				istream[i*N_GROUPS+j].range(16*(k+1)-1,16*k)=i*N_GROUPS*N_ADC_OUT+j*N_ADC_OUT+k;
				qstream[i*N_GROUPS+j].range(16*(k+1)-1,16*k)=0;//i*N_GROUPS*N_ADC_OUT+j*N_ADC_OUT+k;
			}
		}
	}

	//Run the stream input
	for (int i=0; i<N_CYCLES;i++) { // Go through more than once to see the phase increment
		for (int j=0;j<N_GROUPS;j++) { //takes N_RES_GROUPS cycles to get through each resonator once
			ap_axiu<512,0,0,0> tmp;
			tmp.data=0;
			tmp.last=0;
			iin.write(istream[i*N_GROUPS+j]);
			qin.write(qstream[i*N_GROUPS+j]);

			adc_to_opfb(iin, qin, iqout);

			iqout.read(tmp);
			for (int k=0; k<N_LANES; k++) {
				lane[i*N_GROUPS+j][k].data=tmp.data.range(32*(k+1)-1,32*k);
				lane[i*N_GROUPS+j][k].last=tmp.last;
			}
		}
	}


	#ifdef __PRINT_PATTERN__
	cout<<"Clock  : ";
	for (int i=0; i<N_CYCLES;i++) { // Go through more than once to see the phase increment
		for (int j=0;j<N_GROUPS;j++) { //takes N_RES_GROUPS cycles to get through each resonator once
			int cycle=N_GROUPS*i+j;
			int comma = cycle % 128;
			if (comma<3 || comma>126) {
				cout<<setw(9)<<cycle;
				//if (i==0 && j==0) continue;
				if (comma==2) cout<<" ... ";
				else if (comma!=126) cout<<", ";
			}
		}
	}
	cout<<endl;
	#endif

	//Compare the result
	for (int k=0; k<N_LANES; k++){
		for (int i=0; i<N_CYCLES;i++) { // Go through more than once to see the phase increment
			if (i==0 &&k<PRINT_LANES) cout<<"Lane "<<setw(2)<<k<<": ";
			for (int j=0;j<N_GROUPS;j++) { //takes N_RES_GROUPS cycles to get through each resonator once

				//istream[j].data[k/2] odds went into odd k
				//istream[j].data[k/2] evens went into even k
				int cycle=N_GROUPS*i+j;
				bool even_lane=(k+1)%2;
				bool odd_lane=k%2;
				bool odd_cycle=cycle%2;
				bool even_cycle=(cycle+1)%2;

				int predicted=N_LANES*cycle/2 + k - 2040*even_cycle-8;
				int lanev=(lane[cycle][k].data.to_int()&0xffff);// real();

				if ((k<PRINT_LANES&&i>0)&&!PRINT_LANES) {
					cout<<"p"<<predicted;
					if (predicted==lanev) cout<<"==";
					else cout<<"!=";
					cout<<lanev<<", ";
				}

				#ifdef __PRINT_PATTERN__
					int comma = cycle % 128;
					if (comma<3 || comma>126) {
						cout<<setw(4)<<(cycle>511 ? lanev:lanev)<<":";
						cout<<setw(4)<<(cycle>511 ? predicted:0);
						//if (i==0 && j==0) continue;
						if (comma==2) cout<<" ... ";
						else if (comma!=126) cout<<", ";
					}
				#endif

				fail|= (predicted!=lanev&& cycle>511);
			}
		}
		if (k<PRINT_LANES) cout<<"\n";
	}

	if (!fail) cout<<"PASS!!\n";
	return fail ? 1:0;

}
