#include <multicolors>
#include <sourcemod>

#pragma newdecls required
#pragma semicolon 1

public Plugin myinfo =
{
	name        = "Discord Reklam",
	author      = "ReyZ19",
	description = "",
	version     = "1.0",
	url         = "https://github.com/OverHealCSS/discord-reklam"
};

ConVar link;
bool   again[MAXPLAYERS + 1] = { false, ... };

public void OnPluginStart()
{
	link = CreateConVar("discord_link", "");
	RegConsoleCmd("discord", CMD_discord);
	RegConsoleCmd("dc", CMD_discord);
	LoadTranslations("discord.phrases.txt");
	AutoExecConfig(true);
}

public Action CMD_discord(int client, int args)
{
	again[client] = !again[client];
	char link_s[32];
	GetConVarString(link, link_s, sizeof(link_s));
	CPrintToChatAll("{#7289da}%s", link_s);
	if (again[client]) ShowMOTDPanel(client, "Discord Invite Link", link_s, MOTDPANEL_TYPE_TEXT);
	CReplyToCommand(client, "{gray}%t", "Again");
	return Plugin_Handled;
}
