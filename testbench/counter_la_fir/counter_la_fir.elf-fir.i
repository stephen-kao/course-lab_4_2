# 0 "fir.c"
# 1 "/home/ubuntu/course-lab_4_2/testbench/counter_la_fir//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "fir.c"
# 1 "fir.h" 1






int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[64];

int outputsignal[11 +64];
# 2 "fir.c" 2

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {

 for (int i=0; i<(11 +64); i++) {
  outputsignal[i] = 0;
 }
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
 initfir();

 for (int i=0; i<64; i++) {
  inputbuffer[i] = i;
 }
 for (int i=0; i<(11 +64); i++) {
  if (i<11) {
   outputsignal[i] = taps[i];
  } else {
   outputsignal[i] = inputbuffer[i-11];
  }
 }
 return outputsignal;
}
