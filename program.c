__attribute__((annotate("Run O1"))) float first_function()
{
	 float a = 9;
	 float b = 12;
	 float c = 0.2 * (9 - b + a);
	 return c;
}

__attribute__((annotate("Run O3"))) double second_function()
{
	int a = 5;
	int b = 7;
	int c = a + b;
	return c;
}

int third_function()
{
	int a = -3;
	int b = 4;
	int x = a - b;
	return x;
}

int fourth_function()
{
	float a = 9.4;
	float b = -2.7;
	float z = a / b;
	return z;
}

__attribute__((annotate("Run O2"))) double fifth_function()
{
	return -1;
}
