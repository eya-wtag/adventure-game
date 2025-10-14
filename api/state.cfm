<cfcontent type="application/json">

<cfif CGI.REQUEST_METHOD EQ "POST">
    <cfif StructKeyExists(FORM, "scene")>
        <cfset Session.savedScene = FORM.scene>
        <cfoutput>
            {"message": "Game state saved successfully."}
        </cfoutput>
    <cfelse>
        <cfoutput>
            {"message": "Error: 'scene' parameter missing from request."}
        </cfoutput>
    </cfif>

<cfelseif CGI.REQUEST_METHOD EQ "GET">
    <cfif StructKeyExists(Session, "savedScene")>
        <cfoutput>
            {
                "message": "Game state loaded successfully.",
                "scene": "#Session.savedScene#"
            }
        </cfoutput>
    <cfelse>
        <cfoutput>
            {"message": "No saved game found."}
        </cfoutput>
    </cfif>

<cfelseif CGI.REQUEST_METHOD EQ "DELETE">
    <cfif StructKeyExists(Session, "savedScene")>
        <cfset StructDelete(Session, "savedScene")>
        <cfoutput>
            {"message": "Game state reset successfully."}
        </cfoutput>
    <cfelse>
        <cfoutput>
            {"message": "No saved game to reset."}
        </cfoutput>
    </cfif>
    
<cfelse>
    <cfoutput>
        {"message": "Unsupported HTTP method received."}
    </cfoutput>
</cfif>