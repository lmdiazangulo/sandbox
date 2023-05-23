#include <pybind11/pybind11.h>
#include "pybind11/eigen.h"

#define STRINGIFY(x) #x
#define MACRO_STRINGIFY(x) STRINGIFY(x)

class MyClass {
    Eigen::MatrixXd big_mat = Eigen::MatrixXd::Zero(10000, 10000);
public:
    Eigen::MatrixXd &getMatrix() { return big_mat; }
    const Eigen::MatrixXd &viewMatrix() { return big_mat; }
};

// Later, in binding code:
namespace py = pybind11;

PYBIND11_MODULE(matrix_example, m) {
    py::class_<MyClass>(m, "MyClass")
        .def(py::init<>())
        .def("copy_matrix", &MyClass::getMatrix) // Makes a copy!
        .def("get_matrix", &MyClass::getMatrix, py::return_value_policy::reference_internal)
        .def("view_matrix", &MyClass::viewMatrix, py::return_value_policy::reference_internal)
        ;
}
