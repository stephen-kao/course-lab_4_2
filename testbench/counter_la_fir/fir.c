#include "fir.h"

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial your fir
	for (int i=0; i<(N+DATA_LENGTH); i++) {
		outputsignal[i] = 0;
	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	// write down your fir
	for (int i=0; i<DATA_LENGTH; i++) {
		inputbuffer[i] = i;
	}
	for (int i=0; i<(N+DATA_LENGTH); i++) {
		if (i<N) {
			outputsignal[i] = taps[i];
		} else {
			outputsignal[i] = inputbuffer[i-N];
		}
	}
	return outputsignal;
}
		
