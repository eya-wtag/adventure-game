<cfset myGame = createObject("component", "components.game").init()>

<cfif StructKeyExists(URL, "scene")>
    <cfset Session.currentScene = URL.scene>
</cfif>

<cfparam name="Session.currentScene" default="start">
<cfset currentScene = myGame.getScene(Session.currentScene)>

<cfoutput>
    <h2>#currentScene.title#</h2>
    <p>#currentScene.storyText#</p>
    <h2>Player's inventory</h2>
    <cfif StructKeyExists(currentScene, "itemsToFind") AND ArrayLen(currentScene.itemsToFind) GT 0>
    <cfscript>
        // Convert the array of items to a comma-separated string for display
    itemsList = ArrayToList(currentScene.itemsToFind);
    </cfscript>
            <h3>Available Items Here:</h3>
            <p>
                You spot: 
                <cfoutput>#itemsList#</cfoutput>
            </p>
        </div>
    <cfelse>  <h3>No Available Items Here</h3>
    </cfif>
     
    <h3>Choices:</h3>
    <ul>
        <cfloop array="#currentScene.choices#" index="choice">
            <li>
                <a href="game_api.cfm?scene=#choice.destination#">
                    #choice.text#
                </a>
            </li>
        </cfloop>
    </ul>

    <cfif arrayLen(currentScene.choices) EQ 0>
        <p>The End.</p>
    </cfif>
</cfoutput>

<hr>

<h2>Game State Management</h2>

<button onclick="saveGame()">Save Game</button>
<span id="save-status"></span>

<button onclick="loadGame()">Load Game</button>
<span id="load-status"></span>

<button onclick="newGame()">New Game</button>
<span id="new-game-status"></span>

<script>
  
    const currentScene = '<cfoutput>#Session.currentScene#</cfoutput>';

    const apiEndpoint = 'api/state.cfm';


    function saveGame() {
        const statusEl = document.getElementById('save-status');
        
        const formData = new FormData();
        formData.append('scene', currentScene);

        fetch(apiEndpoint, {
            method: 'POST',
            body: formData,
        })
        .then(response => response.json())
        .then(data => {
            statusEl.innerText = data.message;
            statusEl.style.color = 'green';
        })
        .catch(error => {
            statusEl.innerText = 'Error saving game.';
            statusEl.style.color = 'red';
            console.error('Error:', error);
        });
    }

  
    function loadGame() {
        const statusEl = document.getElementById('load-status');
        
        fetch(apiEndpoint)
        .then(response => response.json())
        .then(data => {
            if (data.message.includes("No saved game")) {
                statusEl.innerText = data.message;
                statusEl.style.color = 'orange';
            } else {
               
                window.location.href = `game_api.cfm?scene=${data.scene}`;
            }
        })
        .catch(error => {
            statusEl.innerText = 'Error loading game.';
            statusEl.style.color = 'red';
            console.error('Error:', error);
        });
    }

  
    function newGame() {
        const statusEl = document.getElementById('new-game-status');
        
        fetch(apiEndpoint, {
            method: 'DELETE',
        })
        .then(response => {
            if (response.ok) {
                
                window.location.href = 'game_api.cfm?scene=start';
            } else {
                statusEl.innerText = 'Error starting new game.';
                statusEl.style.color = 'red';
            }
        })
        .catch(error => {
            statusEl.innerText = 'Error starting new game.';
            statusEl.style.color = 'red';
            console.error('Error:', error);
        });
    }
</script>
