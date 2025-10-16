<cfscript>  
param name="url.action" default="game_api";

switch (url.action) {

    case "adventure":
        include "adventure.cfm";
        break;
    case "state":
        include "api/state.cfm";
        break;
    case "game_api":
        include "game_api.cfm";
        break;
    default:
        writeOutput("Page not found.");
}
</cfscript>

