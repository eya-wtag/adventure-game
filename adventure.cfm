<cfset myGame = createObject("component", "components.game").init()> 
<cfparam name="url.scene" default="start">
<cfset currentScene = myGame.getScene(url.scene)>
<cfoutput>
<h2>#currentScene.title#</h2>
<p>#currentScene.storyText#</p>

<h3>Choices:</h3>
<ul>
<cfloop array="#currentScene.choices#" index="choice">
    <li>
        <a href="adventure.cfm?scene=#choice.destination#">
            #choice.text#
        </a>
    </li>
</cfloop>
</ul>

<cfif arrayLen(currentScene.choices) EQ 0>
    <p>The End.</p>
</cfif>
</cfoutput>

