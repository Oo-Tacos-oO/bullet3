-- BulletDynamics lib --

project "BulletDynamics"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"
	systemversion "latest"

	targetdir (binariesDir .. "/%{prj.name}")
	objdir (binariesIntermediateDir .. "/%{prj.name}")

	files {
		"**.h",
		"**.hpp",
		"**.cpp",
	}
	removefiles {
		"**.vs*/**"
	}

	includedirs {
		".."
	}

	floatingpoint "Fast"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines {
			"_DEBUG=1",
		}

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		vectorextensions "SSE2"

	filter "configurations:Distribution"
		runtime "Release"
		optimize "on"
		symbols "off"
		vectorextensions "SSE2"