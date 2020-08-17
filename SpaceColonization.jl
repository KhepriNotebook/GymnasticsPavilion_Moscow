# using Khepri
# backend(unity)
# delete_all_shapes()
#new_backend()

tree_size = 15
segment_length = 0.5
attraction = segment_length * tree_size * 0.01
max_dist = 6
min_dist = 1
max_attractors = 1000

random_vector(length=1.0) =
  vsph(length, random(2pi), random(pi))

attractor_random_position(p=u0()) =
  p + vz(tree_size/1.5) + random_vector(tree_size/2*random(1.0))

Base.@kwdef mutable struct Attractor
  pos = attractor_random_position()
  reached = false
end

reached!(attractor::Attractor) = attractor.reached = true

Base.@kwdef mutable struct Branch
  parent=nothing
  pos=u0()
  dir=vz()
  len=segment_length
  child_count=0
  count=0
  total_dir=dir
  weight=1
  childs=[]
end

reset_branch!(b::Branch) =
  (b.count = 0; b.total_dir = b.dir)

next_branch(self::Branch) =
  let b = Branch(parent=branch, pos=self.dir*self.len + self.pos, total_dir = self.total_dir)
    push!(b.childs, self)
    b
  end

branch_length(self::Branch) =
  isnothing(self.parent) ? 1 : 1 + branch_length(self.parent)

branch_width(self::Branch) =
  1.1*mapreduce(branch_width, max, self.childs, init=0.005)

#According to

Base.@kwdef mutable struct Tree
  root = Branch()
  branches = [root]
  attractors = [Attractor() for i in 1:max_attractors]
  #leaves_pos = [l.pos for l in leaves]
end

create_tree(self::Tree) =
  let current = self.root,
      n = 0
    while (! closeEnough(self, current))
      trank = next_branch(current)
      push!(self.branches, trank)
      current = trank
      n += 1
      if n > 100
        break
      end
    end
  end

closeEnough(self, b) =
  any(l -> distance(b.pos, l.pos) < max_dist, self.attractors)

grow(self) =
  begin
    for l in self.attractors
      lShifted = l
      closest = nothing
      record = -1
      found_b = nothing
      for b in self.branches
        found_b = b
        b.weight = max(0, b.weight - 0.001)
        d = norm(l.pos - b.pos - (b.dir * b.len))
        if d < min_dist
          l.reached = true
          closest = nothing
          break
        elseif d > max_dist

        elseif closest == nothing || d <= record
          closest = b
          record = d
          lS = (lShifted.pos - b.pos) * (norm(lShifted.pos - b.pos))^-2
          lShifted.pos -= lS * attraction
        end
      end
      if closest != nothing
        closest.total_dir += unitized(l.pos - found_b.pos)
        closest.count += 1
      end
      l = lShifted
    end
    newBranches = []
    for b in Iterators.reverse(self.branches)
      #b = self.branches[i]
      if b.count > 0
        newDir = unitized(b.total_dir/b.count + random_vector(0.3))
        let new_b = Branch(parent=b, pos=b.pos + b.dir*b.len, dir=newDir)
          push!(b.childs, new_b)
          push!(newBranches, new_b)
        end
        reset_branch!(b)
      end
    end
    append!(self.branches, newBranches)
    self.attractors = [attractor for attractor in self.attractors if !attractor.reached]
  end

#=
grow(self) =
  let current = self.branches[end]
    if ! closeEnough(current, self.attractors)
      push!(self.branches, next_branch(current))
    end
    for attractor in self.attractors
      let closest_branch = nothing,
          record = max_dist
        for b in self.branches
          d = distance(attractor.pos, branch.pos)
          if d < min_dist
            attractor.reached = true
            closest_branch = nothing
            break
          elseif d < record
            closest_branch = b
            record = d
          end
        end
      end
      if closest != nothing
        closest.total_dir += unitized(l.pos - closest_branch.pos)
        closest.count += 1
      end
      l = lShifted
    end
    newBranches = []
    for i in length(self.branches):-1:1
      b = self.branches[i]
      if b.count > 0
        newDir = unitized(b.total_dir/b.count + random_vector() * 0.3)
        push!(newBranches, Branch(parent=b, pos=b.pos + b.dir*b.len, dir=newDir))
        reset_branch!(b)
      end
    end
    append!(self.branches, newBranches)
    self.attractors = [attractor for attractor in self.attractors if !attractor.reached]
  end
=#

leaf_mat = get_material("Default/Materials/Grass")
branch_mat = get_material("materials/wood/ExteriorWood9")

draw_tree(self) =
  with(current_material, branch_mat) do
    for b in self.branches
      let l = 1,#branch_length(b),
          r = 0.1,
          r0 = branch_width(b), #(1-b.weight)*r, #(maxlength-l+1)*r,
          r1 = r0*0.9, # (maxlength-l)*r,
          p0 = b.pos,
          p1 = b.pos + b.dir*b.len
        #println(b.weight)
        #cylinder(b.pos, , b.pos + b.dir * b.len)
        cone_frustum(b.pos, r0, p1, r1)
        isempty(b.childs) ?
          leaves(b) :
          sphere(p1, r1)
      end
    end
  end

leaves(b::Branch) =
  with(current_material, leaf_mat) do
    let p0 = loc_from_o_vz(b.pos, b.dir),
        p1 = add_z(p0, b.len),
        l = 0.2,
        n = 4
      for r in division(b.len/2, b.len, n)
        let p = loc_from_o_phi(add_z(p0, r), random_range(0, 2pi))
          leaf(
            p,
            add_xz(p, l/2, l/2),
            add_x(p, l),
            add_xz(p, l/2, -l/2))
        end
      end
      leaf(
        p1,
        add_sph(p1, l/2, 0, random_range(0, pi/2)),
        add_z(p1, l),
        add_sph(p1, l/2, 0, random_range(-pi/2, 0)))
    end
  end

leaf(p1,p2,p3,p4) =
  #surface_polygon([p1,p2,p3,p4])
  surface_grid([
    [p2, p3],
    [p1, p4]
  ])

new_tree(p=u0(), attractor_function=attractor_random_position) =
  let tree = Tree(root=Branch(pos=p),
                  attractors=[Attractor(pos=attractor_function(p)) for i in 1:max_attractors]),
      n = 0
    while n < 2000 && ! isempty(tree.attractors)
      grow(tree)
      n += 1
      # println(length(tree.attractors))
    end
    # println("n ", n)
    tree
  end

#=
res = new_tree()

delete_all_shapes()
draw_tree(res)

tree_size = 15
segment_length = 0.5
attraction = segment_length * tree_size * 0.001
max_dist = 6
min_dist = 0.5
max_attractors = 1000
=#
# delete_all_shapes()
# for d in division(0, 100, 5)
#   draw_tree(new_tree(x(d)))
# end

#=
attractor_random_position(p=u0()) =
  p + vz(tree_size/1.5) + random_vector()*tree_size/2*random(1.0)

# Cylindrical tree
attractor_random_position(p=u0()) =
  p + vz(tree_size/1.5) +vcyl(random_range(0, tree_size/5), random_range(0, 2pi), random_range(-tree_size/2, tree_size/2))

# Semi-spherical surface tree
max_dist = 20
attractor_random_position(p=u0()) =
  p + vz(tree_size/1.5) + vsph(1, random(2pi), random(pi/2))*tree_size/2
=#
