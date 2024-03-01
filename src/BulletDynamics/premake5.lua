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
		"**.cpp"
	}
	removefiles {
		"**.vs*/**"
	}

	includedirs {
		".."
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Distribution"
		runtime "Release"
		optimize "on"
		symbols "off"