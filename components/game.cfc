<cfcomponent>

    <cffunction name="init" access="public" returntype="any">
        <cftry>
            <cffile action="read" file="#expandPath('/story.json')#" variable="jsonText">
            <cfset this.storyStruct = deserializeJSON(jsonText)>
        <cfcatch type="any">
            <cfoutput>Error reading JSON: #cfcatch.message#</cfoutput>
        </cfcatch>
        </cftry>
        <cfreturn this>
    </cffunction>

    <cffunction name="getScene" access="public" returntype="struct" hint="Returns the requested scene by name">
        <cfargument name="sceneName" type="string" required="true">
        <cfset var scene = {}>
        <cfif structKeyExists(this.storyStruct, arguments.sceneName)>
            <cfset scene = this.storyStruct[arguments.sceneName]>
        <cfelse>
            <cfset scene = { error="Scene not found: #arguments.sceneName#" }>
        </cfif>
        <cfreturn scene>
    </cffunction>

    <cffunction name="getSceneList" access="public" returntype="array" hint="Returns a list of all available scene keys">
        <cfreturn structKeyArray(this.storyStruct)>
    </cffunction>

</cfcomponent>

