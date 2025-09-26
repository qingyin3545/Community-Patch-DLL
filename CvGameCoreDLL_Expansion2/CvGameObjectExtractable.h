#pragma once
#include <LargeArgContainer.pb.h>
//Inherit this class to extract game object to BasicArguments to pass through network.
struct lua_State;
class CvGameObjectExtractable {
public:
	virtual void ExtractToArg(BasicArguments* arg) = 0;
	static void HandleMissingInstance(lua_State*) {};
};