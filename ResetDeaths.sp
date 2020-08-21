#include <sourcemod>
#include <sdktools>
#include <cstrike>

public Plugin myinfo =
{
        name = "ResetDeaths",
        author = "AZzeL",
        description = "A simple plugin that only resets deaths.",
        version = "1.0",
        url = "http://fireon.ro"
};

public void OnPluginStart()
{  
	RegConsoleCmd("resetdeath", ResetDeaths);
	RegConsoleCmd("rd", ResetDeaths);
}

public Action ResetDeaths(int client,  int args)
{                        							
	if(GetClientDeaths(client) == 0)
	{
		PrintToChat(client, " \x03%N\x01, your deaths is already \x040\x01!", client);
		return Plugin_Handled;
	}

	SetEntProp(client, Prop_Data, "m_iDeaths", 0);

	PrintToChat(client, " \x03%N\x01, you reset your deaths!", client);

	return Plugin_Handled;
}

