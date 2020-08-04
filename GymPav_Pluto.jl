### A Pluto.jl notebook ###
# v0.11.1

using Markdown
using InteractiveUtils

# ╔═╡ 51d49281-fc4b-41cd-929f-334cfaf92eed
md"""
# Irina Viner-Usmanova Rhythmic Gymnastics Pavilion
"""

# ╔═╡ 7655d08a-c183-4017-a225-760a96742a05
md"""
The project presented in this notebook is an adaptation of the Irina Viner-Usmanova Rhythmic Gymnastics Pavilion, originally designed by CPU Pride for Moscow, Russia. Its most prominent feature is the wavy roof-structure, inspired by the movement of a rhythmic gymnastic’s strip. The program elaborated here is a personal interpretation of the original design, developed in a 5 day collaborative sprint. This notebook uses the __Julia__ programming language and the __Khepri__ algorithmic design tool to model the building's geometry.
"""

# ╔═╡ c8c6c062-4bbe-455b-a9ef-23925b727d8d
md"
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Renders/blue.png?raw=true)
"

# ╔═╡ 1ff9afd3-40c3-49e5-be62-d5cf858a29c2
md"""
__SET UP__
"""

# ╔═╡ 73b03050-d337-11ea-1c22-0735b7bc0330
md"""Khepri backends size:"""

# ╔═╡ 898e7ade-3826-40ae-bb1f-41e104cc6bdf
md"""
Khepri `render_dir` command defines where the render images are saved in your PC. Use `render_view` to save renders to the chosen file path.
"""

# ╔═╡ d5274e10-3735-4bf3-b302-dbc050acb691
# render_dir("C:\\Users\\Renata\\Documents\\GitHub\\GymnasticsPavilion_Moscow\\Plots")

# ╔═╡ b1d0493d-b0b8-47c7-815a-d0f6ddce7ffb
md"""
## Sinusoidal Curves
"""

# ╔═╡ 054bc271-ce76-46f2-82d6-9675a9e70305
md"
| Sinunoisal wave parameters | Other sinusoidal curves |
|:--------------------------:|:-----------------------:|
| ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Figures/sin_wave.png?raw=true) | ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Figures/sin_curves.png?raw=true) |
"

# ╔═╡ e5d64603-397a-4849-982a-4b92d901ae62
md"""
`sinusoidal` parameters explained:
* a is the amplitude
* omega is the frequency
* fi is the phase
"""

# ╔═╡ d0b32c8c-5b61-4567-9d78-63137aefc00a
#=
begin
    backend(notebook)
    new_backend()
    line(sin_array_y(u0(), 5, 1, 0, 50, 100))
end
=#

# ╔═╡ 49711be8-b085-4f3a-9c48-231dbdae68ad
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/sin_array_y.png?raw=true)
"""

# ╔═╡ 1e7ac839-1905-4f76-a64f-f880eb276536
md"""
`damped_sin_wave`'s parameters explained
* a is the initial amplitude (the highest peak)
* b is the decay constant
* omega is the angular frequency
"""

# ╔═╡ 439411ae-4cdf-4fda-8aeb-2367f2c9cc7a
#=
begin
    backend(notebook)
    new_backend()
    line(damped_sin_array_z(u0(), 5, 0.1, 1, 50, 100))
end
=#

# ╔═╡ 90e1778a-e982-4d2b-9265-fcfe2fb341a0
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/damped_sin_array.png?raw=true)
"""

# ╔═╡ 0a42b25b-29be-4be1-a40d-f718bf668949
md"""
`d_i` is the distance between the pavilion starting point and the beginning of the dumped sine curve.
"""

# ╔═╡ 4d2a8740-d33d-11ea-08a2-f1f9889a54fa
#=
begin
	backend(meshcat)
	new_backend()
end
=#

# ╔═╡ a4a3d0e7-f558-42f6-a612-d012b612c466
# surface_grid(damped_sin_roof_pts(u0(), 20, 3, 10, 15, pi, 0.03, pi/50, pi/10, 60, 100, 120, 800))

# ╔═╡ 526bf79f-60a9-4308-bd2b-13e23200fc84
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/roof_surface.png?raw=true)
"""

# ╔═╡ f0259c55-7378-4062-900e-87e7595cced5
md"""
## Pavilion Dimensions
"""

# ╔═╡ 6eca365d-c522-490f-9bbd-036fe3d3394d
md"""
| Roof dimentions explained | `d_i` explained |
|:-------------------------:|:---------------:|
| ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Figures/roof_dims.jpg?raw=true) | ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Figures/roof_di.jpg?raw=true) |
"""

# ╔═╡ 9f0aef62-df88-4df3-9405-8377ffb7801a
md"""
__Double sinuoid parameters:__

* amp_x = amplitude of the sinusoid along the x axis
* amp_y_min_top = minimum amplitude of the damped sinusoid along the y axis for the top layer of the roof
* amp_y_max_top = maximum amplitude of the damped sinusoid along the y axis for the top layer of the roof
* amp_y_max_bottom = maximum amplitude of the damped sinusoid along the y axis for the bottom layer of the roof
* amp_y_min_bottom = minimum amplitude of the damped sinusoid along the y axis for the bottom layer of the roof
* fi = sinusoid's phase along the x axis
* decay = damped sinusoid's decay along the y axis
* om_x = frequency of the sinusoid in x
* om_y = frequency of the damped sinusoid in y

__General pavilion parameters:__

* pav_width = pavilion's width (along x axis)
* pav_length = pavilion's lenght (along y axis)
* pav_height = pavilion's height (z axis)
* d_width = distance between roof layers in the x axis (top layer is wider)
* d_length = distance between roof layers in the y axis (top layer is longer)
* d_height = distance between roof layers in the z axis (height of the roof truss)
* d_i = distance before the damped sinusoid starts shaping the roof

__Construction elements parameters:__

* glass_panel_height = façade glass panel's height (width is defined by the number of points in the `damped_sinusoid` array)
* n_panels_y = number of row subdivisions for triangular roof panels and glass wall vertical lines in length
* n_panels_x = number of row subdivisions for triangular roof panels and glass wall vertical lines in width
* n_glass_verts = number of vertical panels per glass line
* pinwheel_rec_level = number of times the pattern gets recursively subdivided
* pav_slab_thickness = floor slab thickness
* pav_struct_thickness = inner structural wall's thickness
* n_floors = number of floors inside the pavilion
* n_wall_in_width = number of transverse walls on each floor
* n_wall_in_length = number of longitudinal walls on each floor
"""

# ╔═╡ 1422e273-8f70-4051-a2e1-acde290216db
md"""
## BIM families
"""

# ╔═╡ 83681e9e-eaa6-451b-aa40-a5bc312b4c94
md"""
BIM families for truss elements:
"""

# ╔═╡ 6ad8d561-7d18-49ab-adaa-b569f657d215
md"""
BIM families for roof panels:
"""

# ╔═╡ 6c170e71-4cc3-4ce4-8c3e-8a6b18049be5
md"""
Frame BIM family:
"""

# ╔═╡ 2e6ad563-4ed5-405a-b892-4cc7513d4dc5
md"""
BIM families for walls and slabs:
"""

# ╔═╡ bfee02b3-b586-4f45-a51b-a8882dcf15c9
md"""
Ground family:
"""

# ╔═╡ 1f1e8697-d3bb-42c3-b469-548d2137f932
md"""
BIM family materials for Unity backend:
"""

# ╔═╡ 57d128de-1e71-428b-aaad-907003628c6e
md"""
## Roof Truss
"""

# ╔═╡ de0f86da-6dd4-4c10-b366-f1f4826b804b
md"""
### Basic truss elements
"""

# ╔═╡ 1583d804-01b8-4694-b1bb-fc9b38e089ed
md"""
The following functions create truss elements:
* `free_node` and `fixed_node` create truss nodes
* `bar` creates truss bars
* `panel` creates truss panels
"""

# ╔═╡ 8eabc182-b0ee-426f-b908-7b687466c9dc
md"""
Truss elements:
"""

# ╔═╡ 51202767-d698-4bb8-90a6-eff24f43c54e
md"""
### Spatial truss
"""

# ╔═╡ 70a153c0-89b6-4118-95f9-047bc303be1c
md"""
`truss_ptss` receives two sets of points, the bottom and top points defining the shape of the truss to create.
It returns the points defining the truss structure.
"""

# ╔═╡ 739f9eca-a0d2-46ac-8882-91017dd15842
md"""
`truss` receives the type of truss to create, as well as both bottom and top points defining its shape.
It creates a 3D spatial truss.
"""

# ╔═╡ a9895115-4058-4531-9611-2780b1371c9c
md"""
| Vierendeel modular block front | Vierendeel modular block side |
|:------------------------------:|:-----------------------------:|
| ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Figures/front_vierendeel.png?raw=true) | ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Figures/side_vierendeel.png?raw=true) |
"""

# ╔═╡ 06f753ab-7f16-4c96-a369-89cb31a8463c
md"""
`vierendeel` creates a vierendeel truss structure.
"""

# ╔═╡ 8f833d30-d33d-11ea-3511-e3adb8e3d939
#=
begin
	backend(meshcat)
	new_backend()
end
=#

# ╔═╡ d7b5abc2-c52e-47ac-bc7e-c1fcdc4cb272
#=
begin
    ampx = 3
	ampy_top_min = 10
	ampy_top_max = 15
	ampy_bottom_min = 10
	ampy_bottom_max = 12
	h = 20
	truss(vierendeel,
	  top_ptss=damped_sin_roof_pts(u0(), pav_height,
							  ampx, ampy_top_min, ampy_top_max,
							  fi, decay, om_x, om_y,
							  pav_width, pav_length-d_length, 50, 80),
	  bottom_ptss=damped_sin_roof_pts(xy(d_width,d_length), pav_height-d_height,
							 ampx, ampy_bottom_min, ampy_bottom_max,
							 fi, decay, om_x, om_y_bottom,
							 pav_width - d_width*2, pav_length-2*d_length, 50, 80))
end
=#

# ╔═╡ a3c1bdd8-1702-49c3-8d36-7dd11d0ce701
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/truss_roof_meshcat.png?raw=true)
"""

# ╔═╡ c73d4096-3987-432b-836e-6f67194c9a0c
#=
begin
    backend(unity)
    delete_all_shapes()
    ground()
    truss(vierendeel,
      top_ptss=damped_sin_roof_pts(u0(), pav_height,
                                      amp_x, amp_y_min_top, amp_y_max_top,
                                      fi, decay, om_x, om_y,
                                      pav_width, pav_length-d_length, 5, 8),
      bottom_ptss=damped_sin_roof_pts(xy(d_width,d_length), pav_height-d_height,
                                     amp_x, amp_y_min_bottom, amp_y_max_bottom,
                                     fi, decay, om_x, om_y_bottom,
                                     pav_width - d_width*2, pav_length-2*d_length, 5, 8))
#     render_view("truss_roof_unity")
end
=#

# ╔═╡ 9ecb436e-80af-4096-8d50-b88699c3583b
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/truss_roof_unity.png?raw=true)
"""

# ╔═╡ a5fa27cc-2f49-4cf7-ae3a-00a3fe6633c9
md"""
## Roof Surface
"""

# ╔═╡ bb253fd6-91ec-4d8d-8054-65d289c49612
md"""
### Auxiliar functions
"""

# ╔═╡ 9ffde841-2ff8-474c-846d-3930b3183b34
md"""
`transpose_array` receives an array of arrays and transposes it.
"""

# ╔═╡ 46a379ea-d0ed-442e-bff3-aee5cecacf7a
md"""
`pts_distances` receives an array of points and returns an array with the distances between ordered points.
"""

# ╔═╡ cbcc0d84-017a-4fc0-bc72-b9ac87d28424
md"""
`itera_2triangs` receives an array of arrays of points. It returns the same points rearranged to create a triangular grid of points.
"""

# ╔═╡ fa496147-a7b7-4fb4-9ecb-1a15d01ca0ac
md"""
### Roof option 1: simple surfaces
"""

# ╔═╡ c2e0b9ee-9786-4952-9af8-50b7d8fcea5a
#=
begin
    backend(autocad)
    delete_all_shapes()
    top_roof_test = damped_sin_roof_pts(x(0), 15,
                                   3, 6, 9,
                                   fi, decay, om_x, om_y,
                                   pav_width, pav_length-d_length, 50, 100)
    bottom_roof_test = damped_sin_roof_pts(xy(d_width,d_length*1), 15-d_height,
                                      3, 6, 8,
                                      fi, decay, om_x, om_y_bottom,
                                      pav_width - d_width*2, pav_length-2*d_length, 50, 100)
    surface_grid(top_roof_test)
    surface_grid(bottom_roof_test)
end
=#

# ╔═╡ c8a3ad58-b248-41d4-8f0f-f8b1fea80eef
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/roof_surf_grid.png?raw=true)
"""

# ╔═╡ 3c05357d-2e87-440f-8bf7-72a6c1432b2a
md"""
### Roof option 2: triangular roof panels
"""

# ╔═╡ e14b5229-dbcc-4af1-8869-464d00a40f4d
md"""
CAD version: using `surface_polygon` subdivision
"""

# ╔═╡ 2ac92e46-3bda-4875-b260-af88fb5e1d94
#=
begin
    backend(autocad)
    new_backend()
    map(ps->surface_polygon(ps), itera_2triangs(top_roof_test))
    map(ps->surface_polygon(ps), itera_2triangs(bottom_roof_test))
end
=#

# ╔═╡ 47baa8d1-ae3b-4c87-ab1f-6547d471d8e7
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/roof_surf_polygons_cad.png?raw=true)
"""

# ╔═╡ 7fa03271-c972-47ad-a117-da8090d5ea7d
md"""
BIM version: using `panel` subdivision
"""

# ╔═╡ 631946d3-7b03-48a8-8ded-0879d2a7cb2e
#=
begin
    backend(unity)
    delete_all_shapes()
    ground()
    map(ps->panel(ps, family=roof_panel_fam), itera_2triangs(top_roof_test))
    map(ps->panel(ps, family=roof_panel_fam), itera_2triangs(bottom_roof_test))
end
=#

# ╔═╡ a90b4f14-33b8-433a-b52b-90ed8f37d33b
# render_view("roof_panels_unity")

# ╔═╡ de3718bb-d1a0-4cb4-a644-a6a376efcc15
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/roof_panels_unity.png?raw=true)
"""

# ╔═╡ a242521a-93c6-4401-98c0-f92319ea99c6
md"""
### Roof lateral edges option 1: simple triangular panels
"""

# ╔═╡ f92d7869-227e-46d8-8c4c-99c94e941fbe
#=
begin
    backend(autocad)
    delete_all_shapes()
    map(ps->surface_polygon(ps), itera_2triangs([top_roof_test[1],bottom_roof_test[1]]))
    map(ps->surface_polygon(ps), itera_2triangs([top_roof_test[end],bottom_roof_test[end]]))
    map(ps->surface_polygon(ps), itera_2triangs([transpose_array(top_roof_test)[end], transpose_array(bottom_roof_test)[end]]))
end
=#

# ╔═╡ 07a74677-ba61-43f9-bcbb-51f8539bbdb8
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/triangle_roof_side.png?raw=true)
"""

# ╔═╡ 1744efbe-c2ac-4201-bf3a-1f3e765377bb
md"""
### Roof lateral edges option 2: Pinwheel tiling panels
"""

# ╔═╡ a1a24a6f-02e9-44cc-87f3-11eb22e7ac1e
md"""
`pattern` creates different patterns on parametric surfaces
"""

# ╔═╡ 619ecdcc-8685-49c0-ae55-50f62a61ee28
md"""
`pinwheel_rule` defines the basic subdivision rule of the pinwheel tiling.
"""

# ╔═╡ b52caa50-d327-11ea-3901-cbec8cfb2e96
md"""
Pinwheel rule Tiling

![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Figures/tiling.png?raw=true)
"""

# ╔═╡ 739ef686-dc80-478a-884f-eb82fa98bf77
md"""
`pinwheel_recursive_rule` repeats the basic subdivision rule `pinwheel_rule` several times (value set by the parameter `level`).
"""

# ╔═╡ 94f4b5c4-b0b3-48ec-9b50-d3a543ef269a
md"""
`pinwheel_tiling` receives a surface (described by its points) and creates the pinwheel tiling on it.
"""

# ╔═╡ b70e4b72-e36e-4d56-87cb-9ef96f54950f
#=
begin
    backend(autocad)
    delete_all_shapes()
    pinwheel_tiling.(pattern.(shape_grid_polygon_vertices,
                              itera_2triangs([top_roof_test[1],bottom_roof_test[1]])),
                     level=3)
    pinwheel_tiling.(pattern.(shape_grid_polygon_vertices,
                              itera_2triangs([top_roof_test[end],bottom_roof_test[end]])),
                     level=3)
    pinwheel_tiling.(pattern.(shape_grid_polygon_vertices,
                              itera_2triangs([transpose_array(top_roof_test)[end],transpose_array(bottom_roof_test)[end]])),
                     level=3)
end
=#

# ╔═╡ 5997e782-92a6-4767-a77e-c9fa1c59f282
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/pinwheel_roof_side.png?raw=true)

![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/pinwheel_closeup.png?raw=true)
"""

# ╔═╡ ad01ae89-a11c-471b-bca5-819b8eb8ed61
#=
begin
    backend(unity)
    delete_all_shapes()
    ground()
    pinwheel_tiling.(pattern.(shape_grid_polygon_vertices,
                              itera_2triangs([top_roof_test[1],bottom_roof_test[1]])),
                     level=3)
    pinwheel_tiling.(pattern.(shape_grid_polygon_vertices,
                              itera_2triangs([top_roof_test[end],bottom_roof_test[end]])),
                     level=3)
    pinwheel_tiling.(pattern.(shape_grid_polygon_vertices,
                              itera_2triangs([transpose_array(top_roof_test)[end],transpose_array(bottom_roof_test)[end]])),
                     level=3)
end
=#

# ╔═╡ 4d500ceb-fcf5-4e48-b09d-af58b9336d98
# render_view("side_roof_panels_unity1")

# ╔═╡ 1dbed21e-7790-4135-bc1c-8a0838e17657
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/side_roof_panels_unity1.png?raw=true)

![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/side_roof_panels_unity2.png?raw=true)
"""

# ╔═╡ 0bc14ae6-810d-44e4-93b2-b5440d5d91a4
md"""
## Complete Roof structure
"""

# ╔═╡ 1c520b8f-270b-4ecf-ac11-ec4b56d325fc
md"""
Abstracting `pinwheel_tiling` function for the roof sides:
"""

# ╔═╡ 547b82ca-9d20-4096-8f40-7c3c8d38800b
md"""
Roof point matrices. `t_diff` defines the distance between the roof surface and the truss structure within. It's currently set to 20 cm:
"""

# ╔═╡ 0b0816cd-a5ff-4f1b-811f-bcd676029a26
md"""
Complete roof surface with top, bottom, and side panels:
"""

# ╔═╡ 35bc1c3f-4ea3-488c-803f-6e4e2d7cf55f
#=
begin
    backend(unity)
    delete_all_shapes()
    ground()
    roof_surf(u0(), 50, 100)
end
=#

# ╔═╡ dee7d758-6a8b-4cf0-b22b-ff04ea0ef04e
# render_view("complete_roof_panels_unity")

# ╔═╡ b022c5e9-d746-40ec-a3e6-fd3e2da55a99
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/complete_roof_panels_unity.png?raw=true)
"""

# ╔═╡ 6575ea0e-7f81-48db-abc8-68d4ef4b9188
md"""
Truss structure function using the new point matrices for the pavilion:
"""

# ╔═╡ 00135f66-6496-4e9e-b503-583d72faf131
#=
begin
    backend(unity)
    delete_all_shapes()
    ground()
    set_backend_family(yellow_panel_fam, unity, unity_material_family("Default/Materials/Glass"))
    roof_surf(u0(), 50, 100)
    roof_truss(u0(), 30, 70)
end
=#

# ╔═╡ 4a91dc26-1b28-4ced-87f1-3a7580275e11
# render_view("complete_roof_unity")

# ╔═╡ 59435d7e-5f2e-40f7-88a5-7d8ba4720d89
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/complete_roof_unity.png?raw=true)
"""

# ╔═╡ 106eae09-e12f-4d06-b570-0fe3794ce5d1
md"""
## Glass Façade
"""

# ╔═╡ 8e82e47f-2def-4c29-b890-5f19952a3770
md"""
`splines4surf` maps splines over a matrix of points, to visualise surfaces in the notebook backend faster.
"""

# ╔═╡ 6cbef7c8-1c11-4cc1-bbd2-f6e832b85ea1
md"""
### Wall points
"""

# ╔═╡ 033ac5f2-dc19-4016-954e-d564d3b3e926
md"""
`damped_sin_glass_wall` creates the pavilion's side glass wall matrices
"""

# ╔═╡ e4ec7d98-9072-4e54-928d-68e2ea1326bd
#=
begin
    backend(notebook)
    new_backend()
    west_glass_wall_test = damped_sin_glass_wall(x(d_width),
                                            amp_y_max_top,
                                            fi, decay, om_y,
                                            pav_length-2*d_length, pav_height-d_height, 20, 5)
    splines4surf(west_glass_wall_test)
end
=#

# ╔═╡ fecaa5d6-5be8-453a-975c-2814ef1f83c1
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/glass_lines.png?raw=true)
"""

# ╔═╡ 5e0a279e-e52b-4e6b-8dfe-0be6492c4e21
#=
begin
    backend(autocad)
    delete_all_shapes()
    west_glass_wall_t1 = damped_sin_glass_wall(xy(d_width, d_length),
                                            amp_y_max_top,
                                            fi, decay, om_y_bottom,
                                            pav_length-2*d_length, pav_height-d_height, 40, 10)
    east_glass_wall_t1 = damped_sin_glass_wall(xy(pav_width-d_width, d_length),
                                            amp_y_min_bottom,
                                            fi, decay, om_y_bottom,
                                            pav_length-2*d_length, pav_height-d_height, 40, 10)
    splines4surf(west_glass_wall_t1)
    splines4surf(east_glass_wall_t1)
#     surface_grid(bottom_roof_pts(u0(), 40, 100, false))
end
=#

# ╔═╡ 35a6dd7a-9d16-45e4-8a40-a68a2cb3b327
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/glass_lines_cad.png?raw=true)
"""

# ╔═╡ 8c6fb191-dca5-4142-8d68-adfdca175b27
md"""
### Vertical BIM panels
"""

# ╔═╡ c5161804-a0dd-409e-91fe-dd1031c81d88
md"""
Given a list of points (closed polygon vertices), this function creates a polygonal glass panel surrounded by a thin metal framing all around:
"""

# ╔═╡ 39415f00-d33e-11ea-3aea-a1e627b555aa
#=
begin
	backend(meshcat)
	new_backend()
end
=#

# ╔═╡ 0849a2fb-289d-4b5f-a4cc-f1e75d62c96c
#=
begin
	sides = 3
    radius = 5
	angle = pi/4
	delete_all_shapes()
	framed_panel(regular_polygon_vertices(sides, x(-10), radius, angle))
	framed_panel(regular_polygon_vertices(sides+2, x(0), radius, angle))
	framed_panel(regular_polygon_vertices(sides+5, x(10), radius, angle))
end
=#

# ╔═╡ 798c24c1-d345-48ad-9bb2-b4794a85c2f3
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/framed_panel.png?raw=true)
"""

# ╔═╡ 0961a8da-1eea-46a3-86dd-2c4a0173d7a2
md"""
Creates a vertical line of `framed_panels` given a list of points in z. Vector `v` considers the panel width:
"""

# ╔═╡ 7755a541-7676-4bca-9188-90a4516c1872
#=
begin
    backend(autocad)
    n_y = 40
    n_z = 10
    dist_y = pav_length-2*d_length
    dist_z = pav_height-d_height
    west_glass_wall = damped_sin_glass_wall(x(d_width),
                                            amp_y_max_top,
                                            fi, decay, om_y,
                                            dist_y, dist_z, n_y, n_z)
    east_glass_wall = damped_sin_glass_wall(x(pav_width-d_width),
                                            amp_y_min_bottom,
                                            fi, decay, om_y,
                                            dist_y, dist_z, n_y, n_z)
    panel_width = dist_y/n_y
    vertical_panel_line(west_glass_wall[1], vy(1), panel_width)
end
=#

# ╔═╡ 7e0f45f2-9bb7-4417-b83d-973a56e1442b
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/first_row_panels.png?raw=true)
"""

# ╔═╡ 84f52121-1fc0-4aaa-8347-6bd098cd7ee8
md"""
Makes a `vertical_panel_line` for all lines in the matrix:
"""

# ╔═╡ ada4b291-59bc-4df0-9a73-7147ec86b0d0
md"""
Predicate functions: is current `z` above the limit?
"""

# ╔═╡ 36922c03-28a8-4ce1-badf-adb8178ada1a
md"""
`vert_pts` creates the orgin points for all vertical panels above p. Stops creating points in z when the set limit is reached:
"""

# ╔═╡ 3869315d-6cc5-481b-ac27-b690ac9f1bd1
md"""
Different starting point for vertical panels in the odd case:
"""

# ╔═╡ df639722-5970-4ebf-be21-19026b9e3ad1
md"""
Interweaving 2 different functions depending on `count` being even or odd:
"""

# ╔═╡ 4d6d9a6d-5bbc-47c5-ac39-58ce3afb2656
md"""
`damped_sin_glass_pts` creates a vertical line of panels for all points between `p` and `p+vy(dist_y)`. The `z_limit` for all vertical lines of panels is defined by the`z` value of the `damped_sin_wave` at any moment in the `y` progression. Interweaving of functions. Different starting height for the first panel of odd rows.
"""

# ╔═╡ 336226ca-a905-4809-b1a1-f41ef83e8d22
md"""
 `glass_panel_height` defines façade glass panel's height (width is defined by the number of points in the `damped_sinusoid` array)
"""

# ╔═╡ ba6353ed-cdcd-4894-a42f-390e08609da2
#=
begin
    backend(autocad)
    west_glass_wall = damped_sin_glass_pts(x(d_width),
                                            amp_y_max_top,
                                            fi, decay, om_y,
                                            dist_y, dist_z, n_y, n_z, glass_panel_height)
    east_glass_wall = damped_sin_glass_pts(x(pav_width-d_width),
                                            amp_y_min_bottom,
                                            fi, decay, om_y,
                                            dist_y, dist_z, n_y, n_z, glass_panel_height)
    delete_all_shapes()
    vertical_panel_lines(west_glass_wall)
end
=#

# ╔═╡ bb01c0f5-8115-4a6b-bdcd-1b1cb4c5b246
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/panels_weave.png?raw=true)
"""

# ╔═╡ 87465fd5-8a6a-4f38-bfd0-d3e878231d35
md"""
`vertical_panel_line` corrections to match roof wave:
"""

# ╔═╡ 6585e6fe-5b45-4b67-80a1-91031230511f
#=
begin
    backend(autocad)
    delete_all_shapes()
    west_glass_wall_i = damped_sin_glass_wall(xy(d_width, d_length),
                                                amp_y_max_top,
                                                fi, decay,  om_y_bottom,
                                                dist_y, dist_z, n_y, n_z)
    west_glass_wall_r = damped_sin_glass_pts(xy(d_width, d_length),
                                                amp_y_max_top,
                                                fi, decay, om_y_bottom,
                                                dist_y, dist_z, n_y, n_z, glass_panel_height)
    splines4surf(west_glass_wall_i)
    centred_vertical_panel_lines(west_glass_wall_r)
end
=#

# ╔═╡ 05d8fef6-4929-4a06-a05f-a9ce46d71be6
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/wall_panel_comparison.png?raw=true)
"""

# ╔═╡ 445d7af7-0064-4570-b684-37b791fb94e6
#=
begin
    backend(unity)
    delete_all_shapes()
    ground()
    roof_surf(u0(), 50, 100)
    centred_vertical_panel_lines(west_glass_wall)
    centred_vertical_panel_lines(east_glass_wall)
end
=#

# ╔═╡ 4d449a8b-b951-484b-8082-1bbab7797298
# render_view("roof_side_walls_unity")

# ╔═╡ e53a1dea-32be-4386-85b2-7bed44eb87c7
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/roof_side_walls_unity.png?raw=true)
"""

# ╔═╡ 7c35987f-ce8b-48e8-98ba-6eefb561baa2
md"""
### Front glass wall
"""

# ╔═╡ e6b1e6f3-428e-44d9-b645-4280ed707c5c
md"""
This function joins all glass walls in the pavilion (sides and front):
"""

# ╔═╡ 17bf4009-67d1-432c-9992-b993885ef6b4
#=
begin
    backend(unity)
    delete_all_shapes()
    ground()
    roof_surf(u0(), 50, n_panels_y)
    pav_walls(u0(), 50, n_panels_y, n_glass_verts)
    set_view(xyz(29.727153778076172,163.0078582763672,10.998817443847656), xyz(29.728837966918945,162.0078582763672,10.998811721801758), 35.0)
#     render_view("all_walls_unity")
end
=#

# ╔═╡ 40d64945-3f6c-4f6e-ade4-0ae46953d9c9
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/all_walls_unity.png?raw=true)
"""

# ╔═╡ 7105c6b2-535b-4a71-a6b8-738ea6c96a07
md"""
## Interior Plan
"""

# ╔═╡ 27368c04-ffe9-4d22-97fa-29e26c2a4399
md"""
`pav_slabs` creates the main slabs
"""

# ╔═╡ 6303ce15-3182-4e9e-af9d-2af906833d37
#=
begin
    backend(autocad)
    delete_all_shapes()
    pav_slabs(u0(), 10, 7, 4, 3)
end
=#

# ╔═╡ e609e119-b5b4-469e-8a63-cbc404b960d0
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/slabs.png?raw=true)
"""

# ╔═╡ 721274aa-f6af-4120-9cbe-7ed96801b610
md"""
Update `pav_slabs` to include interior walls:
"""

# ╔═╡ d050c321-30fd-4ccf-b947-06b1a74e5342
md"""
`floors` joins structural walls to the previous function:
"""

# ╔═╡ c3d63191-9d74-4711-9654-1a2ef3162e3b
#=
begin
    backend(autocad)
    delete_all_shapes()
    floors(u0())
end
=#

# ╔═╡ 45a7535c-9357-41ce-b62f-9d99768edb44
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/slab_wall.png?raw=true)
"""

# ╔═╡ fc2abf83-2f48-4feb-b77f-1db801f7c428
#=
begin
    backend(unity)
    delete_all_shapes()
    set_backend_family(ground_fam, unity, unity_material_family("Default/Materials/Grass"))
    ground()
    pav_walls(u0(), n_panels_x, n_panels_y, n_glass_verts)
    roof_surf(u0(), n_panels_x, n_panels_y)
    floors(u0())
    set_view(xyz(120.72909545898438,142.31788635253906,18.540668487548828), xyz(120.00056457519531,141.63906860351562,18.4487361907959), 35.0)
#     render_view("interior_walls_unity")
end
=#

# ╔═╡ ea530fd7-e0d5-4410-87ff-2676862c877d
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/interior_walls_unity.png?raw=true)
"""

# ╔═╡ 59c35ebe-ef7f-4465-ab9f-fe7e37956bd2
md"""
## Site
"""

# ╔═╡ 15cfda6e-aa17-43b1-b13a-39fe1626b939
md"""
Ground:
"""

# ╔═╡ 1396a123-a339-4a84-9cd3-2afb9cfc1dfe
md"""
Random tree definition:
"""

# ╔═╡ 48867045-c40c-4640-9c7e-3c8038d15b0e
#=
begin
    backend(unity)
    delete_all_shapes()
    ground()
    map(n -> random_tree(x(n)), 0:2:20)
#     render_view("tress")
end
=#

# ╔═╡ 90fd9fd3-b7bd-490c-a4c4-4ae41393b05f
md"""
Expected result:
![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/trees.png?raw=true)
"""

# ╔═╡ 462ddb6a-916a-44c1-8230-e4c2fda33bd7
md"""
## Complete Building
"""

# ╔═╡ 36bcc19d-5dbc-4ec6-a118-8406018e5cc9
md"""
The `GymPav` function gathers all building elements modeled, plus the random tree line in front of the west façade. Given a point `p`, the function creates the full building structure in accordance with the parameters provided in `Pavilion Dimensions`.
"""

# ╔═╡ 34138a1e-b68d-4749-af36-f2832091337f
#=
begin
    backend(unity)
    delete_all_shapes()
    ground()
    GymPav(u0())
end
=#

# ╔═╡ abca05cc-e6d4-424c-b1b6-89634b2b3913
md"""
Saved render views:
"""

# ╔═╡ 5e5e6f44-cf2b-400d-9289-e99ac35bf061
begin
    # set_view(xyz(-27.78546905517578,-12.493826866149902,2.73970365524292), xyz(-27.147165298461914,-11.735978126525879,2.874735116958618), 35.0)
    # render_view("pav1")

    # set_view(xyz(37.13166809082031,96.70274353027344,8.049731254577637), xyz(36.132999420166016,96.71927642822266,8.098581314086914), 35.0)
    # render_view("pav2")

    # set_view(xyz(86.96595001220703,87.33833312988281,7.179433822631836), xyz(85.97071075439453,87.31035614013672,7.27283239364624), 35.0)
    # render_view("pav3")

    # set_view(xyz(-22.71254539489746,144.94818115234375,7.690451622009277), xyz(-22.17136001586914,144.1073455810547,7.7015814781188965), 35.0)
    # render_view("pav4")

    # set_view(xyz(-12.342000961303711,103.7385025024414,3.020662307739258), xyz(-11.917301177978516,102.83597564697266,3.0918772220611572), 35.0)
    # render_view("pav5")

    # set_view(xyz(-2.6654765605926514,130.2740020751953,1.4012055397033691), xyz(-2.5774435997009277,129.29388427734375,1.5790280103683472), 35.0)
    # render_view("pav6")

    # set_view(xyz(126.3520736694336,-49.96141815185547,27.672582626342773), xyz(125.61244201660156,-49.31004333496094,27.503311157226562), 35.0)
    # render_view("pav7")
end

# ╔═╡ 8b6f1a25-4734-4be2-915f-c91a455f8e72
md"""
__Unity renders__

| Pav 1 | Pav 2 |
|-------|-------|
| ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/pav1.png?raw=true) | ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/pav2.png?raw=true) |

| Pav 3 | Pav 4 |
|-------|-------|
| ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/pav3.png?raw=true)  | ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/pav4.png?raw=true) |

| Pav 7 | Pav 6 |
|-------|-------|
| ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/pav7.png?raw=true)  | ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/pav6.png?raw=true) |

| Pav 5 |
|-------|
| ![](https://github.com/KhepriNotebook/GymnasticsPavilion_Moscow/blob/master/Plots/pav5.png?raw=true) |
"""

# ╔═╡ 3f3c0207-0dfb-48db-96da-2b35710cdb06
md"""
_The end_
"""

# ╔═╡ f378f527-f63c-4171-9bbf-5f17ddd7ffa5
using PlutoUI

# ╔═╡ 7def8c5f-866a-4d21-9fba-c4e9ed9a65da
using WebIO

# ╔═╡ 4fc3a5ba-2b07-40c0-886a-4ae0275bc319
using Khepri

# ╔═╡ 7eebb5c3-9a95-4b9a-b85d-5d4d9194c427
render_size(700, 400)

# ╔═╡ 0ef0cdb2-0c8f-4d3d-9a9d-d2d5eb88530c
sinusoidal(a, omega, fi, x) = a*sin(omega*x+fi)

# ╔═╡ 5c56efd4-1b50-4de2-8552-5f0bacb3c5c9
sin_array_y(p, a, omega, fi, dist, n) = [p+vxy(i, sinusoidal(a, omega, fi, i)) for i in division(0, dist, n)]

# ╔═╡ 0c4a32a1-5d19-474e-86f0-d6c05dacd3a8
damped_sin_wave(a, d, omega, x) = a*exp(-(d*x))*sin(omega*x)

# ╔═╡ 6bd36159-2045-412b-a8cb-9ddf7baae185
damped_sin_array_z(p, a, d, omega, dist, n) = [p+vxz(i, damped_sin_wave(a, d, omega, i)) for i in division(0, dist, n)]

# ╔═╡ a95aa234-3281-49e3-9262-aaf1256ee568
begin
    amp_x = 2.5
    amp_y_min_top = 4
    amp_y_max_top = 11
    amp_y_max_bottom = 10
    amp_y_min_bottom = 3
    fi = pi
    decay = 0.03

    pav_width = 60
    pav_length = 100
    pav_height = 14
    d_width = 1.5
    d_length = 1
    d_height = 3
    d_i = d_length

    om_x = pi/pav_width
    om_y = 10*pi/pav_length
    om_y_bottom = 10*pi/(pav_length - 2*d_length)

    glass_panel_height = 1
    n_panels_y = 100
    n_panels_x = 50
    n_glass_verts = 10
    pinwheel_rec_level = 3
    pav_slab_thickness = 0.5
    pav_struct_thickness = 0.3
    n_floors = 3
    n_wall_in_width = 4
    n_wall_in_length = 6
end

# ╔═╡ da7aaf1e-8d38-4beb-b218-bcc91978ecf6
damped_sin_roof_pts(p, h, a_x, a_y_min, a_y_max, fi, decay, om_x, om_y, dist_x, dist_y, n_x, n_y) =
    map_division((x, y) ->
                y <= d_i ?
                p + vxyz(x,
                         -sin(y/d_i*(1*pi)),
                         y*h/d_i + sin(x/dist_x*pi)sinusoidal(a_x, om_x, fi-y*pi/dist_y, x)*(y*a_x/d_i)) :
                p + vxyz(x,
                         y,
                         h + sin(x/dist_x*pi)*sinusoidal(a_x, om_x, fi-y*pi/dist_y, x) +
                         damped_sin_wave(a_y_max - (a_y_max-a_y_min)/dist_x*x, decay, om_y, y)),
             0, dist_x, n_x,
             0, dist_y, n_y)

# ╔═╡ 62069f44-5e93-42d4-869c-d5bf09c0a994
free_node_fam = truss_node_family_element(default_truss_node_family(), support=Khepri.truss_node_support(), radius=0.1);

# ╔═╡ 84e6f5c3-92f7-448e-a13e-03fc00823b98
sup_node_fam = truss_node_family_element(default_truss_node_family(), support=Khepri.truss_node_support(ux=true, uy=true, uz=true), radius=0.1);

# ╔═╡ d83851a3-9c51-4b3d-bba5-5938f1990614
roof_panel_fam = panel_family_element(default_panel_family());

# ╔═╡ d7f6f9e9-b78e-4898-ae18-cd1c2d39dcb1
yellow_panel_fam = panel_family_element(default_panel_family());

# ╔═╡ 2b3c5bda-b296-41dc-922e-2922c3995765
frame_width=0.1

# ╔═╡ 3e362ee2-95e0-400c-b256-def28b308967
frame_fam = column_family_element(default_column_family(), profile=rectangular_profile(frame_width, frame_width));

# ╔═╡ 7c1f9ade-1fc3-48c9-8799-5d8f2091f7e5
pav_slab_fam = slab_family_element(default_slab_family(), thickness=pav_slab_thickness);

# ╔═╡ 8af60a44-c65d-439f-9618-dc09c2d514e5
pav_wall_struct_fam = wall_family_element(default_wall_family(), thickness=pav_struct_thickness);

# ╔═╡ 70437bd8-9cc5-4a84-b4f3-f8b8a71b06ac
ground_fam = slab_family_element(default_slab_family());

# ╔═╡ 7f21df8a-ad8b-405f-9dc0-d3989617bf7b
begin
    set_backend_family(default_truss_bar_family(), unity, unity_material_family("Default/Materials/Aluminum"))
    set_backend_family(free_node_fam, unity, unity_material_family("Default/Materials/Aluminum"))
    set_backend_family(sup_node_fam, unity, unity_material_family("materials/metal/Copper"))

    set_backend_family(ground_fam, unity, unity_material_family("Default/Materials/Grass")) # -- grass ground
    # set_backend_family(ground_fam, unity, unity_material_family("Default/Materials/White")) # -- white ground
    # set_backend_family(ground_fam, unity, unity_material_family("Default/Materials/WhiteUnlit")) # -- white ground no shadows

    set_backend_family(default_panel_family(), unity, unity_material_family("Default/Materials/GlassBlue"))
    set_backend_family(frame_fam, unity, unity_material_family("Default/Materials/Steel"))
    set_backend_family(roof_panel_fam, unity, unity_material_family("Default/Materials/Aluminum"))
    set_backend_family(yellow_panel_fam, unity, unity_material_family("materials/metal/YellowCopper"))
    set_backend_family(pav_slab_fam, unity, unity_material_family("Default/Materials/Plaster"))
end

# ╔═╡ db127285-e004-4a96-8e05-b9fcafc1099b
fixed_node(p) = truss_node(p, family=sup_node_fam)

# ╔═╡ 9a5b0085-ec84-49c6-a158-277b6f7e453f
free_node(p) = truss_node(p, family=free_node_fam)

# ╔═╡ 0ae86b2c-2cee-4e25-9fca-06405e507170
bar(p, q) = truss_bar(p, q)

# ╔═╡ b40a9e94-da12-4d69-8cc0-c4b2be24a4a8
truss_ptss(bottom_ptss,top_ptss) =
    length(top_ptss) == length(bottom_ptss) ?
    vcat([[pts,qts] for (pts,qts) in zip(bottom_ptss,top_ptss)]...) :
    vcat([[pts,qts] for (pts,qts) in zip(top_ptss[1:end-1],bottom_ptss)]..., [top_ptss[end]])

# ╔═╡ 9280baba-dd00-4107-a8eb-506c81370320
truss(truss_type; bottom_ptss=planar(p=x(0)), top_ptss=planar(p=z(1))) =
    let ptss = truss_ptss(bottom_ptss, top_ptss)
      truss_type(ptss)
  end

# ╔═╡ a2f35eeb-e6e7-4f64-a8ac-0dae4f17f252
vierendeel(ptss, first=true) =
    let ais = ptss[1],
        bis = ptss[2],
        cis = ptss[3],
        dis = ptss[4]
      (first ? fixed_node : free_node).(ais)
      free_node.(bis)
      bar.(ais, bis)
      bar.(ais, cis)
      bar.(bis, dis)
      bar.(ais[2:end], ais[1:end-1])
      bar.(bis[2:end], bis[1:end-1])
      if ptss[5:end] == []
          fixed_node.(cis)
          free_node.(dis)
          bar.(cis[2:end], cis[1:end-1])
          bar.(dis[2:end], dis[1:end-1])
          bar.(dis, cis)
      else
          vierendeel(ptss[3:end], false)
      end
    end

# ╔═╡ 56cc6e57-e4aa-4372-a2e6-af0a27ca62aa
transpose_array(arrays) =
    [[row[i] for row in arrays]
     for i in 1:length(arrays[1])]

# ╔═╡ a7638ad9-bc03-4d56-8e35-d793a77e45c3
pts_distances(pts, last_pt=true) =
    let n =  last_pt ? 0 : 1
      [distance(p,q)
       for (p,q) in zip(pts,[pts[2:end]...,pts[1]])][1:end-n]
       end

# ╔═╡ 690c7747-5338-46a8-a03d-f893815ba16c
shape_grid_polygon_vertices(pts) =
    () -> pts

# ╔═╡ dba23384-1c2e-460d-841b-72d23014034a
itera_2triangs(ptss) =
    vcat([vcat([[[p0,p1,p3],[p1,p2,p3]]
                for (p0,p1,p2,p3)
                in zip(pts0[1:end-1], pts1[1:end-1], pts1[2:end], pts0[2:end])]...)
         for (pts0, pts1) in zip(ptss[1:end-1], ptss[2:end])]...)

# ╔═╡ 174e924b-94a0-47ec-a9c4-5000c7f4ea2c
pattern(fshape, pts...; args...) =
  fshape(pts...)(; (k=>v(pts) for (k,v) in args)...)

# ╔═╡ efb0bc2b-1faa-48d2-bfd2-98705b478fb2
pinwheel_rule(pts, ratio1=0.383) =
    let dists = pts_distances(pts)
        max_dist = maximum(dists)
        min_dist = minimum(dists)
        ratio2 = 1 - ratio1
     if max_dist == dists[1]
         let pm = intermediate_loc(pts[1], pts[2], min_dist==dists[2] ? ratio1 : ratio2)
           [[pts[1],pm,pts[3]],
            [pts[2],pm,pts[3]]]
         end
     elseif max_dist == dists[2]
         let pm = intermediate_loc(pts[2], pts[3], min_dist==dists[1] ? ratio1 : ratio2)
           [[pts[1],pm,pts[2]],
            [pts[1],pm,pts[3]]]
         end
     else
        let pm = intermediate_loc(pts[1], pts[3], min_dist==dists[1] ? ratio1 : ratio2)
          [[pts[1],pm,pts[2]],
           [pts[2],pm,pts[3]]]
        end
     end
  end

# ╔═╡ 1e7dcb3a-7fdc-4cf8-84f8-d9d9552f723a
pinwheel_recursive_rule(pts, ratio1=0.383, level=1) =
    let qts = pinwheel_rule(pts, ratio1)
      level == 1 ?
      qts :
      [qts...,
       pinwheel_recursive_rule(qts[1], ratio1, level-1)...,
       pinwheel_recursive_rule(qts[2], ratio1, level-1)...]
     end

# ╔═╡ 6776e911-1aee-4fee-a6bd-e20d396bee8a
pinwheel_tiling(pts; ratio1=0.383, level=1) =
        map(pts -> panel(pts, family=yellow_panel_fam), pinwheel_recursive_rule(pts, ratio1, level))

# ╔═╡ 792071b1-a92c-49d6-9af6-9a1022c7a675
pinwhell_broad(pts1, pts2, rec_level) =
    pinwheel_tiling.(pattern.(shape_grid_polygon_vertices, itera_2triangs([pts1,pts2])), level=rec_level)

# ╔═╡ b54a16ec-02cc-426b-9cf8-936f14b30970
top_roof_ptss(p, n_x, n_y, truss)=
    let dist_y = pav_length-d_length
        t_diff = truss ? 0.2 : 0
        damped_sin_roof_pts(p, pav_height-t_diff,
                            amp_x, amp_y_min_top, amp_y_max_top,
                            fi, decay, om_x, om_y,
                            pav_width, dist_y, n_x, n_y)
    end

# ╔═╡ 2c565dce-fdec-4be7-959d-95165fb10fa6
bottom_roof_pts(p, n_x, n_y, truss)=
    let dist_y = pav_length-d_length
         t_diff = truss ? 0.2 : 0
        damped_sin_roof_pts(p+vxy(d_width,d_length*1), pav_height-d_height+t_diff,
                            amp_x, amp_y_min_top, amp_y_max_top,
                            fi, decay, om_x, om_y_bottom,
                            pav_width - d_width*2, pav_length-2*d_length,  n_x, n_y)
    end

# ╔═╡ 9bf44bc5-2420-469d-9909-608a94c2826b
roof_surf(p, n_x, n_y)=
    let lev = pinwheel_rec_level
        top_roof = top_roof_ptss(p, n_x, n_y, false)
        bottom_roof = bottom_roof_pts(p, n_x, n_y, false)
        # top and bottom aluminum roof tiles
        map(ps->panel(ps, family=roof_panel_fam), itera_2triangs(top_roof))
        map(ps->panel(ps, family=roof_panel_fam), itera_2triangs(bottom_roof))
        # side yellow copper roof tiles
        pinwhell_broad(top_roof[1], bottom_roof[1], lev)
        pinwhell_broad(top_roof[end], bottom_roof[end], lev)
        pinwhell_broad(transpose_array(top_roof)[end], transpose_array(bottom_roof)[end], lev)
    end

# ╔═╡ cf431676-1347-47fe-b15f-069c5376f05d
roof_truss(p, n_x, n_y)=
    let top_roof = top_roof_ptss(p, n_x, n_y, true)
        bottom_roof = bottom_roof_pts(p, n_x, n_y, true)
        truss(vierendeel, top_ptss=top_roof, bottom_ptss=bottom_roof)
    end

# ╔═╡ df4566e7-c6b8-4b8d-af0c-a1184bd6ee87
function splines4surf(mtx)
    [spline(pts) for pts in mtx]
    [spline(pts) for pts in transpose_array(mtx)]
end

# ╔═╡ 2c07133e-ef5c-4cb9-be0f-9352b8fe5f9e
damped_sin_glass_wall(p, a_y, fi, decay, om_y, dist_y, dist_z, n_y, n_z) =
    map_division((y, z) ->
                    y <= d_i ?
                    p + vyz(-sin(y/d_i*(1*pi)), z) :
                    p + vyz(y,
                            z + (z/dist_z)*damped_sin_wave(a_y, decay, om_y, y)),
             0, dist_y, n_y,
             0, dist_z, n_z)

# ╔═╡ f7e90070-11cc-42da-a6a1-ae003c8d3ae4
framed_panel(pts)=
    begin
        panel(pts, family=default_panel_family())
        for (p,q) in zip(pts, [pts[2:end]...,pts[1]])
            free_column(p,q, family=frame_fam)
        end
    end

# ╔═╡ a20e269d-d733-4d40-9213-ec8fe3425f1b
vertical_panel_line(pts, v)=
    let pav_panel(p, q) = framed_panel([p, p+v, q+v, q])
        [pav_panel(p, q) for (p, q) in zip(pts[1:end-1], pts[2:end])]
    end

# ╔═╡ 33e5860e-ff12-4d94-a49e-9cc18b8c8da7
vertical_panel_lines(mtx)=
    let v = mtx[2][1]-mtx[1][1]
        [vertical_panel_line(pts, v) for pts in mtx]
    end

# ╔═╡ dc591d21-e4d4-4955-9097-f16967c3aa84
is_above_z_limit(z, z_lim)= z > z_lim

# ╔═╡ d9985ce3-9a73-45db-9c0f-301f7220a4ad
vert_pts(p, panel_height, z_lim) = is_above_z_limit(p.z, z_lim) ? [p] : [p, vert_pts(p+vz(panel_height), panel_height, z_lim)...]

# ╔═╡ 83a05964-51b1-4edc-b7a8-0772df140217
vert_pts_odd(p, panel_height, z_lim) = [p, vert_pts(p+vz(panel_height/2), panel_height, z_lim)...]

# ╔═╡ 652c785f-be16-42af-b2b4-76899880785d
f_weave(f1, f2, count) = isodd(count) ? f1 : f2

# ╔═╡ d8165919-c7de-41f1-a69f-6b6574860971
damped_sin_glass_pts(p, a_y, fi, decay, om_y, dist_y, dist_z, n_y, n_z, panel_height) =
    let pts = map_division(y -> p+vy(y), 0, dist_y, n_y)
        zs = map_division(y -> dist_z+damped_sin_wave(a_y, decay, om_y, y), 0, dist_y, n_y)
        ns = 1:length(zs)
     [f_weave(vert_pts_odd(p, panel_height, z_lim),vert_pts(p, panel_height, z_lim), count) for (p, z_lim, count) in zip(pts, zs, ns)]
    end

# ╔═╡ 89836662-1f0a-4b31-ac35-87d195a9d329
vertical_panel_line_centred(pts, v)=
    let pav_panel(p, q) = framed_panel([p, p+v, q+v, q])
        [pav_panel(p-v/2, q-v/2) for (p, q) in zip(pts[1:end-1], pts[2:end])]
    end

# ╔═╡ aebddf43-e719-4dc0-8edd-c94f4fe201bb
centred_vertical_panel_lines(mtx)=
    let v = mtx[2][1]-mtx[1][1]
        [vertical_panel_line_centred(pts, v) for pts in mtx]
    end

# ╔═╡ b4b29a4f-8e0d-4ae4-adec-eacc1a59d4fe
damped_sin_front_wall(p, a_x, fi, decay, om_x, dist_x, dist_z, n_x, n_z, panel_height) =
    let pts = map_division(x -> p+vx(x), 0, dist_x, n_x)
        zs = map_division(x -> dist_z+sin(x/dist_x*pi)*sinusoidal(a_x, om_x, fi-pi, x), 0, dist_x, n_x)
        ns = 1:length(zs)
     [f_weave(vert_pts_odd(p, panel_height, z_lim),vert_pts(p, panel_height, z_lim), count) for (p, z_lim, count) in zip(pts, zs, ns)]
    end

# ╔═╡ d9fa0a96-c207-42ce-895e-5b508981917c
pav_walls(p, n_x, n_y, n_z)=
    let dist_y = pav_length-2*d_length
        dist_z = pav_height-d_height
        dist_x = pav_width-d_width*2
        west_glass_wall = damped_sin_glass_wall(p+vxy(d_width, d_length),
                                            amp_y_max_top,
                                            fi, decay, om_y_bottom,
                                            dist_y, dist_z, n_y, n_z, glass_panel_height)
        east_glass_wall = damped_sin_glass_wall(p+vxy(pav_width-d_width, d_length),
                                            amp_y_min_bottom,
                                            fi, decay, om_y_bottom,
                                            dist_y, dist_z, n_y, n_z, glass_panel_height)
        panel_w = norm(west_glass_wall[2][1]-west_glass_wall[1][1])
        north_glass_wall = damped_sin_front_wall(p+vxy(d_width, dist_y+panel_w/2),
                                            amp_x, fi, decay, om_x,
                                            dist_x, dist_z, n_x, n_z, glass_panel_height)
    centred_vertical_panel_lines(west_glass_wall[1:end-1])
    centred_vertical_panel_lines(east_glass_wall[1:end-1])
    vertical_panel_lines(north_glass_wall[1:end-1])
end

# ╔═╡ 35b651e7-a210-4c2b-bb53-ad0e65ef6863
pav_slabs(p, length, height, width, n_floors)=
    for i in division(0, height-2, n_floors, false)
        slab(rectangular_path(p, width, length), level=i, family=pav_slab_fam)
    end

# ╔═╡ 81eaeaa2-4ce9-41d7-bfcb-e16ee53ce5fb
pav_slabs_walls(p, length, height, width, n_floors, n_x, n_y)=
    let level_to_level_height = (height-2)/n_floors
        for i in division(0, height-2, n_floors, false)
            slab(rectangular_path(p, width, length), level=i, family=pav_slab_fam)
        end
        for i in division(0, height-2-level_to_level_height, n_floors-1, false)
            walls_x = [wall([p+vx(x), p+vxy(x, length)], bottom_level=i, top_level=level_to_level_height+i)
                for x in division(width/n_x-1, width, n_x, false)]
            walls_y = [wall([p+vy(y), p+vxy(width, y)], bottom_level=i, top_level=level_to_level_height+i)
                for y in division(length/n_y-1, length, n_y, false)]
        end
    end

# ╔═╡ e7e0ca42-ab35-4b2c-af42-392497e358fc
function floors(p)
    let panel_w = (pav_length-2*d_length)/n_panels_y
        dist_x = pav_width-d_width*2
        dist_y_1 = (pav_length-d_length*2)/3
        dist_y_2 = (pav_length-d_length*2)*2/3
        dist_z = pav_height-d_height

    # structural walls
    wall([p+vxy(d_width, dist_y_1), p+vxy(pav_width-d_width, dist_y_1)],
            top_level = level(dist_z), family=pav_wall_struct_fam)
    wall([p+vxy(d_width, dist_y_2), p+vxy(pav_width-d_width, dist_y_2)],
            top_level = level(dist_z), family=pav_wall_struct_fam)

    # floor plans
    pav_slabs_walls(p+vxy(d_width, dist_y_1), dist_y_2+panel_w/2, dist_z,
        dist_x, n_floors, n_wall_in_width, n_wall_in_length)
    slab(rectangular_path(p+vx(d_width), dist_x, dist_y_1), level=0, family=pav_slab_fam)

    end
end

# ╔═╡ a64f12f4-755b-43a4-b3c1-fc39d0390309
ground() =
    let x = 1000
        y = 1000
        z = -0.01
      slab(closed_polygonal_path([xyz(-x,y,z), xyz(x,y,z), xyz(x,-y,z), xyz(-x,-y,z)]), level(-0.05), ground_fam)
    end

# ╔═╡ dbd69447-3f2a-445b-b161-63f84f2b6813
leaf(p, r, mat) =
    if current_backend() == unity
        with(current_material, get_material(mat)) do
            sphere(p, r)
        end
    else
        sphere(p, r)
    end

# ╔═╡ ba0a314b-cc95-425e-a5ea-e4e39d511ca8
branch(pb, rb, pt, rt, mat)=
    if current_backend() == unity
        with(current_material, get_material(mat)) do
            cone_frustum(pb, rb, pt, rt)
        end
    else
        cone_frustum(pb, rb, pt, rt)
    end

# ╔═╡ 99890b91-f990-4925-98cf-323fe0d8baa6
tree(p_base, r_base, w_branch, fi, psi, min_f_w, max_f_w, max_fi, min_psi, max_psi) =
  let psi = psi > pi/2 ? psi - pi/2 : psi < -pi/2 ? psi + pi/2 : psi
      p_top = p_base + vsph(w_branch, fi, psi)
      r_top = r_base/2
      leaf_mat = "Default/Materials/Grass"
      branch_mat = "materials/wood/ExteriorWood9"
      branch(p_base, r_base, p_top, r_top, branch_mat)
      if w_branch < 0.01 || r_top < 0.001
          leaf(p_top, 0.05, leaf_mat)
      else
          tree(p_top, r_top, w_branch*random_range(min_f_w, max_f_w),
            fi + random(max_fi), psi + random_range(min_psi, max_psi),
            min_f_w, max_f_w, max_fi, min_psi, max_psi)
          tree(p_top, r_top, w_branch*random_range(min_f_w, max_f_w),
            fi - random(max_fi), psi - random_range(min_psi, max_psi),
            min_f_w, max_f_w, max_fi, min_psi, max_psi)
      end
  end

# ╔═╡ 42ee64b5-95b9-421b-913f-a55387ab6861
random_tree(p)=
  let r_base = random_range(0.05, 0.3)
      w_branch = random_range(2, 5)
      fi = 0
      psi = 0
      min_f_w = 0.6 # branch width max factor
      max_f_w = 0.9 # branch width min factor
      max_fi = 2pi
      min_psi = pi/16
      max_psi = pi/2
      tree(p, r_base, w_branch, fi, psi, min_f_w, max_f_w, max_fi, min_psi, max_psi)

end

# ╔═╡ 44dd45ac-1a64-439b-abb1-6df9dc6e668b
function GymPav(p)
    roof_surf(p, n_panels_x, n_panels_y)
#     roof_truss(p, 30, 70)
    pav_walls(p, n_panels_x, n_panels_y, n_glass_verts)
    floors(p)
    map(n -> random_tree(p+vxy(-5, n)), 0:2:pav_length) # tree line in the west façade
end

# ╔═╡ Cell order:
# ╠═f378f527-f63c-4171-9bbf-5f17ddd7ffa5
# ╟─51d49281-fc4b-41cd-929f-334cfaf92eed
# ╟─7655d08a-c183-4017-a225-760a96742a05
# ╟─c8c6c062-4bbe-455b-a9ef-23925b727d8d
# ╟─1ff9afd3-40c3-49e5-be62-d5cf858a29c2
# ╠═7def8c5f-866a-4d21-9fba-c4e9ed9a65da
# ╠═4fc3a5ba-2b07-40c0-886a-4ae0275bc319
# ╟─73b03050-d337-11ea-1c22-0735b7bc0330
# ╠═7eebb5c3-9a95-4b9a-b85d-5d4d9194c427
# ╟─898e7ade-3826-40ae-bb1f-41e104cc6bdf
# ╠═d5274e10-3735-4bf3-b302-dbc050acb691
# ╟─b1d0493d-b0b8-47c7-815a-d0f6ddce7ffb
# ╟─054bc271-ce76-46f2-82d6-9675a9e70305
# ╟─e5d64603-397a-4849-982a-4b92d901ae62
# ╠═0ef0cdb2-0c8f-4d3d-9a9d-d2d5eb88530c
# ╠═5c56efd4-1b50-4de2-8552-5f0bacb3c5c9
# ╠═d0b32c8c-5b61-4567-9d78-63137aefc00a
# ╟─49711be8-b085-4f3a-9c48-231dbdae68ad
# ╟─1e7ac839-1905-4f76-a64f-f880eb276536
# ╠═0c4a32a1-5d19-474e-86f0-d6c05dacd3a8
# ╠═6bd36159-2045-412b-a8cb-9ddf7baae185
# ╠═439411ae-4cdf-4fda-8aeb-2367f2c9cc7a
# ╟─90e1778a-e982-4d2b-9265-fcfe2fb341a0
# ╠═da7aaf1e-8d38-4beb-b218-bcc91978ecf6
# ╟─0a42b25b-29be-4be1-a40d-f718bf668949
# ╠═4d2a8740-d33d-11ea-08a2-f1f9889a54fa
# ╠═a4a3d0e7-f558-42f6-a612-d012b612c466
# ╟─526bf79f-60a9-4308-bd2b-13e23200fc84
# ╟─f0259c55-7378-4062-900e-87e7595cced5
# ╟─6eca365d-c522-490f-9bbd-036fe3d3394d
# ╟─9f0aef62-df88-4df3-9405-8377ffb7801a
# ╠═a95aa234-3281-49e3-9262-aaf1256ee568
# ╟─1422e273-8f70-4051-a2e1-acde290216db
# ╟─83681e9e-eaa6-451b-aa40-a5bc312b4c94
# ╠═62069f44-5e93-42d4-869c-d5bf09c0a994
# ╠═84e6f5c3-92f7-448e-a13e-03fc00823b98
# ╟─6ad8d561-7d18-49ab-adaa-b569f657d215
# ╠═d83851a3-9c51-4b3d-bba5-5938f1990614
# ╠═d7f6f9e9-b78e-4898-ae18-cd1c2d39dcb1
# ╟─6c170e71-4cc3-4ce4-8c3e-8a6b18049be5
# ╠═2b3c5bda-b296-41dc-922e-2922c3995765
# ╠═3e362ee2-95e0-400c-b256-def28b308967
# ╟─2e6ad563-4ed5-405a-b892-4cc7513d4dc5
# ╠═7c1f9ade-1fc3-48c9-8799-5d8f2091f7e5
# ╠═8af60a44-c65d-439f-9618-dc09c2d514e5
# ╟─bfee02b3-b586-4f45-a51b-a8882dcf15c9
# ╠═70437bd8-9cc5-4a84-b4f3-f8b8a71b06ac
# ╟─1f1e8697-d3bb-42c3-b469-548d2137f932
# ╠═7f21df8a-ad8b-405f-9dc0-d3989617bf7b
# ╟─57d128de-1e71-428b-aaad-907003628c6e
# ╟─de0f86da-6dd4-4c10-b366-f1f4826b804b
# ╟─1583d804-01b8-4694-b1bb-fc9b38e089ed
# ╟─8eabc182-b0ee-426f-b908-7b687466c9dc
# ╠═db127285-e004-4a96-8e05-b9fcafc1099b
# ╠═9a5b0085-ec84-49c6-a158-277b6f7e453f
# ╠═0ae86b2c-2cee-4e25-9fca-06405e507170
# ╟─51202767-d698-4bb8-90a6-eff24f43c54e
# ╟─70a153c0-89b6-4118-95f9-047bc303be1c
# ╠═b40a9e94-da12-4d69-8cc0-c4b2be24a4a8
# ╟─739f9eca-a0d2-46ac-8882-91017dd15842
# ╠═9280baba-dd00-4107-a8eb-506c81370320
# ╟─a9895115-4058-4531-9611-2780b1371c9c
# ╟─06f753ab-7f16-4c96-a369-89cb31a8463c
# ╠═a2f35eeb-e6e7-4f64-a8ac-0dae4f17f252
# ╠═8f833d30-d33d-11ea-3511-e3adb8e3d939
# ╠═d7b5abc2-c52e-47ac-bc7e-c1fcdc4cb272
# ╟─a3c1bdd8-1702-49c3-8d36-7dd11d0ce701
# ╠═c73d4096-3987-432b-836e-6f67194c9a0c
# ╟─9ecb436e-80af-4096-8d50-b88699c3583b
# ╟─a5fa27cc-2f49-4cf7-ae3a-00a3fe6633c9
# ╟─bb253fd6-91ec-4d8d-8054-65d289c49612
# ╟─9ffde841-2ff8-474c-846d-3930b3183b34
# ╠═56cc6e57-e4aa-4372-a2e6-af0a27ca62aa
# ╟─46a379ea-d0ed-442e-bff3-aee5cecacf7a
# ╠═a7638ad9-bc03-4d56-8e35-d793a77e45c3
# ╠═690c7747-5338-46a8-a03d-f893815ba16c
# ╟─cbcc0d84-017a-4fc0-bc72-b9ac87d28424
# ╠═dba23384-1c2e-460d-841b-72d23014034a
# ╟─fa496147-a7b7-4fb4-9ecb-1a15d01ca0ac
# ╠═c2e0b9ee-9786-4952-9af8-50b7d8fcea5a
# ╟─c8a3ad58-b248-41d4-8f0f-f8b1fea80eef
# ╟─3c05357d-2e87-440f-8bf7-72a6c1432b2a
# ╟─e14b5229-dbcc-4af1-8869-464d00a40f4d
# ╠═2ac92e46-3bda-4875-b260-af88fb5e1d94
# ╟─47baa8d1-ae3b-4c87-ab1f-6547d471d8e7
# ╟─7fa03271-c972-47ad-a117-da8090d5ea7d
# ╠═631946d3-7b03-48a8-8ded-0879d2a7cb2e
# ╠═a90b4f14-33b8-433a-b52b-90ed8f37d33b
# ╟─de3718bb-d1a0-4cb4-a644-a6a376efcc15
# ╟─a242521a-93c6-4401-98c0-f92319ea99c6
# ╠═f92d7869-227e-46d8-8c4c-99c94e941fbe
# ╟─07a74677-ba61-43f9-bcbb-51f8539bbdb8
# ╟─1744efbe-c2ac-4201-bf3a-1f3e765377bb
# ╟─a1a24a6f-02e9-44cc-87f3-11eb22e7ac1e
# ╠═174e924b-94a0-47ec-a9c4-5000c7f4ea2c
# ╟─619ecdcc-8685-49c0-ae55-50f62a61ee28
# ╟─b52caa50-d327-11ea-3901-cbec8cfb2e96
# ╠═efb0bc2b-1faa-48d2-bfd2-98705b478fb2
# ╟─739ef686-dc80-478a-884f-eb82fa98bf77
# ╠═1e7dcb3a-7fdc-4cf8-84f8-d9d9552f723a
# ╟─94f4b5c4-b0b3-48ec-9b50-d3a543ef269a
# ╠═6776e911-1aee-4fee-a6bd-e20d396bee8a
# ╠═b70e4b72-e36e-4d56-87cb-9ef96f54950f
# ╟─5997e782-92a6-4767-a77e-c9fa1c59f282
# ╠═ad01ae89-a11c-471b-bca5-819b8eb8ed61
# ╠═4d500ceb-fcf5-4e48-b09d-af58b9336d98
# ╟─1dbed21e-7790-4135-bc1c-8a0838e17657
# ╟─0bc14ae6-810d-44e4-93b2-b5440d5d91a4
# ╟─1c520b8f-270b-4ecf-ac11-ec4b56d325fc
# ╠═792071b1-a92c-49d6-9af6-9a1022c7a675
# ╟─547b82ca-9d20-4096-8f40-7c3c8d38800b
# ╠═b54a16ec-02cc-426b-9cf8-936f14b30970
# ╠═2c565dce-fdec-4be7-959d-95165fb10fa6
# ╟─0b0816cd-a5ff-4f1b-811f-bcd676029a26
# ╠═9bf44bc5-2420-469d-9909-608a94c2826b
# ╠═35bc1c3f-4ea3-488c-803f-6e4e2d7cf55f
# ╠═dee7d758-6a8b-4cf0-b22b-ff04ea0ef04e
# ╟─b022c5e9-d746-40ec-a3e6-fd3e2da55a99
# ╟─6575ea0e-7f81-48db-abc8-68d4ef4b9188
# ╠═cf431676-1347-47fe-b15f-069c5376f05d
# ╠═00135f66-6496-4e9e-b503-583d72faf131
# ╠═4a91dc26-1b28-4ced-87f1-3a7580275e11
# ╟─59435d7e-5f2e-40f7-88a5-7d8ba4720d89
# ╟─106eae09-e12f-4d06-b570-0fe3794ce5d1
# ╟─8e82e47f-2def-4c29-b890-5f19952a3770
# ╠═df4566e7-c6b8-4b8d-af0c-a1184bd6ee87
# ╟─6cbef7c8-1c11-4cc1-bbd2-f6e832b85ea1
# ╟─033ac5f2-dc19-4016-954e-d564d3b3e926
# ╠═2c07133e-ef5c-4cb9-be0f-9352b8fe5f9e
# ╠═e4ec7d98-9072-4e54-928d-68e2ea1326bd
# ╟─fecaa5d6-5be8-453a-975c-2814ef1f83c1
# ╠═5e0a279e-e52b-4e6b-8dfe-0be6492c4e21
# ╟─35a6dd7a-9d16-45e4-8a40-a68a2cb3b327
# ╟─8c6fb191-dca5-4142-8d68-adfdca175b27
# ╟─c5161804-a0dd-409e-91fe-dd1031c81d88
# ╠═f7e90070-11cc-42da-a6a1-ae003c8d3ae4
# ╠═39415f00-d33e-11ea-3aea-a1e627b555aa
# ╠═0849a2fb-289d-4b5f-a4cc-f1e75d62c96c
# ╟─798c24c1-d345-48ad-9bb2-b4794a85c2f3
# ╟─0961a8da-1eea-46a3-86dd-2c4a0173d7a2
# ╠═a20e269d-d733-4d40-9213-ec8fe3425f1b
# ╠═7755a541-7676-4bca-9188-90a4516c1872
# ╟─7e0f45f2-9bb7-4417-b83d-973a56e1442b
# ╟─84f52121-1fc0-4aaa-8347-6bd098cd7ee8
# ╠═33e5860e-ff12-4d94-a49e-9cc18b8c8da7
# ╟─ada4b291-59bc-4df0-9a73-7147ec86b0d0
# ╠═dc591d21-e4d4-4955-9097-f16967c3aa84
# ╟─36922c03-28a8-4ce1-badf-adb8178ada1a
# ╠═d9985ce3-9a73-45db-9c0f-301f7220a4ad
# ╟─3869315d-6cc5-481b-ac27-b690ac9f1bd1
# ╠═83a05964-51b1-4edc-b7a8-0772df140217
# ╟─df639722-5970-4ebf-be21-19026b9e3ad1
# ╠═652c785f-be16-42af-b2b4-76899880785d
# ╟─4d6d9a6d-5bbc-47c5-ac39-58ce3afb2656
# ╠═d8165919-c7de-41f1-a69f-6b6574860971
# ╟─336226ca-a905-4809-b1a1-f41ef83e8d22
# ╠═ba6353ed-cdcd-4894-a42f-390e08609da2
# ╟─bb01c0f5-8115-4a6b-bdcd-1b1cb4c5b246
# ╟─87465fd5-8a6a-4f38-bfd0-d3e878231d35
# ╠═89836662-1f0a-4b31-ac35-87d195a9d329
# ╠═aebddf43-e719-4dc0-8edd-c94f4fe201bb
# ╠═6585e6fe-5b45-4b67-80a1-91031230511f
# ╟─05d8fef6-4929-4a06-a05f-a9ce46d71be6
# ╠═445d7af7-0064-4570-b684-37b791fb94e6
# ╠═4d449a8b-b951-484b-8082-1bbab7797298
# ╟─e53a1dea-32be-4386-85b2-7bed44eb87c7
# ╟─7c35987f-ce8b-48e8-98ba-6eefb561baa2
# ╠═b4b29a4f-8e0d-4ae4-adec-eacc1a59d4fe
# ╟─e6b1e6f3-428e-44d9-b645-4280ed707c5c
# ╠═d9fa0a96-c207-42ce-895e-5b508981917c
# ╠═17bf4009-67d1-432c-9992-b993885ef6b4
# ╟─40d64945-3f6c-4f6e-ade4-0ae46953d9c9
# ╟─7105c6b2-535b-4a71-a6b8-738ea6c96a07
# ╟─27368c04-ffe9-4d22-97fa-29e26c2a4399
# ╠═35b651e7-a210-4c2b-bb53-ad0e65ef6863
# ╠═6303ce15-3182-4e9e-af9d-2af906833d37
# ╟─e609e119-b5b4-469e-8a63-cbc404b960d0
# ╟─721274aa-f6af-4120-9cbe-7ed96801b610
# ╠═81eaeaa2-4ce9-41d7-bfcb-e16ee53ce5fb
# ╟─d050c321-30fd-4ccf-b947-06b1a74e5342
# ╠═e7e0ca42-ab35-4b2c-af42-392497e358fc
# ╠═c3d63191-9d74-4711-9654-1a2ef3162e3b
# ╟─45a7535c-9357-41ce-b62f-9d99768edb44
# ╠═fc2abf83-2f48-4feb-b77f-1db801f7c428
# ╟─ea530fd7-e0d5-4410-87ff-2676862c877d
# ╟─59c35ebe-ef7f-4465-ab9f-fe7e37956bd2
# ╟─15cfda6e-aa17-43b1-b13a-39fe1626b939
# ╠═a64f12f4-755b-43a4-b3c1-fc39d0390309
# ╟─1396a123-a339-4a84-9cd3-2afb9cfc1dfe
# ╠═dbd69447-3f2a-445b-b161-63f84f2b6813
# ╠═ba0a314b-cc95-425e-a5ea-e4e39d511ca8
# ╠═99890b91-f990-4925-98cf-323fe0d8baa6
# ╠═42ee64b5-95b9-421b-913f-a55387ab6861
# ╠═48867045-c40c-4640-9c7e-3c8038d15b0e
# ╟─90fd9fd3-b7bd-490c-a4c4-4ae41393b05f
# ╟─462ddb6a-916a-44c1-8230-e4c2fda33bd7
# ╟─36bcc19d-5dbc-4ec6-a118-8406018e5cc9
# ╠═44dd45ac-1a64-439b-abb1-6df9dc6e668b
# ╠═34138a1e-b68d-4749-af36-f2832091337f
# ╟─abca05cc-e6d4-424c-b1b6-89634b2b3913
# ╠═5e5e6f44-cf2b-400d-9289-e99ac35bf061
# ╟─8b6f1a25-4734-4be2-915f-c91a455f8e72
# ╟─3f3c0207-0dfb-48db-96da-2b35710cdb06
