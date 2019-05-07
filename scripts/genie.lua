-- tgfx library

solution "tgfx"
    configurations {
        "Debug",
        "Release",
    }

    platforms {
        "x32",
        "x64"
    }

    language "C++"


PROJECT_DIR = path.getabsolute("..")
BUILD_DIR = path.join(path.getabsolute(".."), "build")

dofile "toolchain.lua"

-- reflection is needed for gltf loader
--NO_REFL = true

dofile(path.join(TWO_DIR, "scripts/two.lua"))

local all = { two.infra, two.jobs, two.type, two.tree, two.pool, two.refl, two.srlz, two.ecs, two.math, two.geom,
              two.ctx, two.ctxbackend, two.bgfx, two.gfx, two.gfx.pbr, two.gfx.obj, two.gltf, two.gfx.gltf };
              
libs(all, "StaticLib");

--dofile(path.join(TWO_DIR, "scripts/two_example.lua"))

function add_example_data(name)
    configuration { "asmjs" }
        linkoptions {
            "--preload-file ../../../data/examples/" .. name .. "@data/",
        }
    
    configuration {}
end

function two_example(name, deps, exdeps, ismodule)

    local uses_example = function()
        add_example_data(name)
    end

    _G[name] = module(nil, "_" .. name, path.join(TWO_DIR, "example"), name, nil, uses_example, false, deps, not ismodule)
    
    two_binary(name, table.union({ _G[name] }, exdeps), deps)
end

group "bin"
two_example("xx_three", all, {})

