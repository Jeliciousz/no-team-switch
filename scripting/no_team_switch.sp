#include <sourcemod>

public Plugin:myinfo =
{
	name = "No Team Switch",
	author = "Jeliciousz",
	description = "Stops players from switching teams",
	version = "1",
	url = "none"
}

static ConVar g_cvNoTeamSwitchEnabled;

ConVar cvJoinTeam;

public OnPluginStart()
{
    g_cvNoTeamSwitchEnabled = CreateConVar("jz_noteamswitch_enabled", "true");
    cvJoinTeam = FindConVar("jointeam");
    AddCommandListener(BlockJoinTeam, "jointeam");

    PrintToServer("No Team Switch loaded!")
}

Action BlockJoinTeam(int client, const char[] command, int argc)
{
    bool enabled = GetConVarBool(g_cvNoTeamSwitchEnabled);

    if (enabled)
    {
        return Plugin_Handled;
    }

    SendConVarValue(client, cvJoinTeam, "");

    return Plugin_Handled;
}
