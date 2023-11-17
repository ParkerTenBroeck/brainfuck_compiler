
extern "C"{
	// void _start(int);

	int print(int);
	void lol_jpg();
	// int factorial(int);
		__attribute__ ((section(".text.start")))
	void _start(char* buf);
}

// void _start(int val){
// 	char vals[100];
// 	for(int i = 0; i < 100; i ++){
// 		vals[i] = 0;
// 	}
// 	test_comp(vals);
// 	// for(int i = 0; i < val; i ++){
// 	// 	print(i);
// 	// 	// print(factorial(i));
// 	// }

// 	// lol_jpg();
// }

// int factorial(int val){
// 	if(val <= 1) return 1;
// 	return factorial(val - 1) * val;
// }