workspace "Skrptfltr"
    architecture "x64"
    startproject "Skrptfltr"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Skrptfltr"
    location "Skrptfltr"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "pch.h"
    pchsource "Skrptfltr/src/pch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src"
    }

    filter "system:windows"
        systemversion "latest"
        
        defines
        {
            "KTN_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "KTN_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "KTN_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "KTN_DIST"
        runtime "Release"
        optimize "on"