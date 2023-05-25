#include <iostream>

#include <mfem.hpp>

#include "libexample.h"


using mfem::Vector;

int main()
{
	auto eigenMatrix{create2x2matrix()};
	
	Vector a(10);
	Vector b;
	a.Print(std::cout);

	mfem::DenseMatrix A(2, 2);
	A(0, 0) = 1.0;
	A(1, 0) = 2.0;
	A(0, 1) = 3.0;
	A(1, 1) = 4.0;

	std::cout << std::flush;
}