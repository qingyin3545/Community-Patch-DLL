# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the Community-Patch-DLL repository for the Civilization V SDK + Vox Populi Mod. It contains:

- **Community Patch (CP)**: Base mod with gamecore DLL, bugfixes, performance improvements, and AI enhancements
- **Vox Populi**: Expands core game mechanics for an entirely new Civilization V experience
- **EUI Compatibility**: Enhanced User Interface support files
- **Additional Mods**: Various supplementary mods like Squads for VP and 43 Civs Community Patch

## Build System and Development Commands

### Visual Studio Build (Primary)
- **Solution Files**: 
  - `VoxPopuli_vs2013.sln` (primary)
  - `MPDLL.vs2022.sln` (VS2022 compatible)
  - `CvGameCoreDLL.vs2010.sln` (legacy)
- **Project Files**: Located in `CvGameCoreDLL_Expansion2/` directory
- **Build Requirements**: Visual C++ 2008 SP1 (VC9) toolset for linking
- **Build Configurations**: Debug and Release

### Clang Build (Alternative)
- **Primary Script**: `build_vp_clang.py`
- **SDK Script**: `build_vp_clang_sdk.py`
- **Usage**: `python build_vp_clang.py --config [debug|release]`
- **Output**: Generated DLLs in `clang-output/` directory

### Build Process
1. **Update Commit ID**: `update_commit_id.bat` - updates version information
2. **Compile**: Build the gamecore DLL from C++ sources
3. **Link**: Link against required libraries and generate final DLL
4. **Output**: `CvGameCore_Expansion2.dll` in appropriate output directory

### 43 Civ Version Build
To build the 43 Civ version:
1. Open `CvGameCoreDLLUtil/include/CustomModsGlobal.h`
2. Uncomment: `#define MOD_GLOBAL_MAX_MAJOR_CIVS (43)`
3. Rebuild the project

## Code Architecture

### Core Components

#### Game Core (`CvGameCoreDLL_Expansion2/`)
- **Game Logic**: Turn-based game processing with player slices
- **AI Systems**: Multiple specialized AI components for different game aspects
- **Pathfinding**: A* algorithm implementation for unit movement
- **Database Integration**: Configuration loading from game database
- **Lua Interface**: Hooks for UI interaction and modding

#### AI Architecture
- **Grand Strategy AI**: Victory condition pursuit
- **Military AI**: City attack/defense decisions
- **Diplomacy AI**: Player interaction and relationship management
- **Religion AI**: Belief selection and missionary targeting
- **Deal AI**: Trade offer evaluation and acceptance
- **Specialized AIs**: Trade, Espionage, Policy, Tech, League, MinorCiv

#### Unit Movement AI
- **Homeland AI**: Civilian and peacetime unit management
- **Operational AI**: Army formation and management
- **Army AI**: Multi-turn unit movement coordination
- **Tactical AI**: Turn-based combat behavior via `ProcessDominanceZones()`

#### Map and Pathfinding
- **Hex Grid**: Uses hex plot coordinate system
- **Landmasses**: Contiguous land/water groupings (including oceans)
- **Areas**: Connected regions within landmasses
- **Multiple Pathfinders**: Separate instances for gamecore and UI to prevent desyncs

### Key Classes and Files
- **CvGame**: Main game singleton, handles turn logic
- **CvPlayer/CvPlayerAI**: Player and AI player management
- **CvCity/CvCityAI**: City management and AI
- **CvUnit**: Unit management and behavior
- **CvMap/CvPlot**: Map and tile management
- **CvDiplomacyAI**: Diplomatic relationship handling
- **CvTacticalAI**: Combat behavior implementation

## Development Guidelines

### Debugging and Logging
- **Enable Logging**: Modify `My Games\Sid Meier's Civilization V\config.ini`
- **Log Location**: `My Games\Sid Meier's Civilization V\Logs`
- **Debug Build**: Use DEBUG configuration in Visual Studio
- **Attach Debugger**: Attach to `Civilization5.exe` process
- **FireTuner**: Use for AI autoplay debugging

### Critical Considerations
- **Multiplayer Sync**: Avoid non-deterministic operations (e.g., std::map iteration with pointer keys)
- **Lua Hooks**: UI-called hooks must not modify gamecore state
- **Memory Layout**: Binary serialization requires consistent memory layout
- **Performance**: Pathfinding and combat simulation are primary bottlenecks

### File Organization
- **Core DLL**: `CvGameCoreDLL_Expansion2/` - Main game logic
- **Utilities**: `CvGameCoreDLLUtil/` - Shared utilities and headers
- **Database**: `CvGameDatabase/` - Database interaction
- **Localization**: `CvLocalization/` - Text and localization
- **Mods**: Individual mod directories with separate structure
- **UI**: `UI_bc1/`, `VPUI/` - User interface components
- **Lua**: `LuaCATS/` - Lua type definitions and documentation

### Testing and Validation
- **No Standard Test Framework**: Tests are primarily through gameplay
- **Logging**: Enable comprehensive logging for debugging
- **FireTuner**: Use for automated AI testing
- **Multiplayer Testing**: Critical for sync validation

## Modding Structure

### Mod Components
- **Database Changes**: SQL files for game configuration
- **Lua Scripts**: UI and gameplay logic
- **Assets**: Graphics, sounds, and other media files
- **XML Files**: Configuration and text definitions

### Common Directories
- **Core Files/**: Essential mod files
- **Database Changes/**: SQL modifications
- **LUA/**: Lua script modifications
- **Assets/**: Graphics and media files
- **Mapscripts/**: Custom map generation scripts