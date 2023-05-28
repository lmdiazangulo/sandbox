import gmsh
import os
import sys

gmsh.initialize()

gmsh.model.add("testing")

# Importing from FreeCAD generated steps.
v1 = gmsh.model.occ.importShapes('py_gmsh/sphere.step')
v2 = gmsh.model.occ.importShapes('py_gmsh/box.step')
s1 = gmsh.model.occ.importShapes('py_gmsh/box_face.step')
gmsh.model.occ.synchronize()

# Geometry manipulation.
v3 = gmsh.model.occ.cut(v2,v1)
embeddedFace, embFaceMap = gmsh.model.occ.fragment(v2, s1)
gmsh.model.occ.remove(gmsh.model.occ.getEntities(2), True)
gmsh.model.occ.synchronize()

## Example of accessing entity name.
print("Entity name:", gmsh.model.get_entity_name(*s1[0]))

# Meshing.
gmsh.option.setNumber("Mesh.MeshSizeMin", 3.5)
gmsh.option.setNumber("Mesh.MeshSizeMax", 3.5)
gmsh.option.setNumber("Mesh.ElementOrder", 2)
gmsh.model.mesh.generate(3)

# Exporting
gmsh.write("mesh_from_step_files_o2.vtk")

gmsh.option.setNumber("Mesh.MshFileVersion", 2.2)
gmsh.write("mesh_from_step_files_o2.msh")

if '-nopopup' not in sys.argv:
    gmsh.fltk.run()

gmsh.finalize()
