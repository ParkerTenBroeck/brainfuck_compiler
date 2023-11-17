
extern "C"{
		__attribute__ ((section(".text.start")))
	void _start(int);
	
	int print(int);
	void lol_jpg();
	int factorial(int);
}

void _start(int val){
	for(int i = 0; i < val; i ++){
		print(i);
		// print(factorial(i));
	}

	lol_jpg();
}

int factorial(int val){
	if(val <= 1) return 1;
	return factorial(val - 1) * val;
}