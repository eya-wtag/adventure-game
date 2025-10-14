# adventure-game
ColdFusion Coding Challenge
This challenge will introduce you to Object-Oriented Programming (OOP) with Components, handling external data files (JSON), and building a basic REST API to manage game state.
Core Concepts You'll Learn
Components (CFCs): Encapsulating your game's logic into a reusable, object-oriented component.
File I/O: Reading and parsing external data from a JSON file.
REST API Basics: Creating a simple API endpoint to handle Create, Read, and Delete operations for game state.
Application Structure: Organizing your code into a logical, multi-file structure.
Session Management: Storing user-specific data like saved games.
Project Structure
Instead of a single file, you will create a small application with the following structure:

/adventure-game/
	|-- adventure.cfm         # The main view file 
|-- story.json            
	|-- /components/
		|-- Game.cfc          
|-- /api/
    		|-- state.cfm
(These will be additional to application.cfc and index.cfm)



The Task: Step-by-Step
Part 1: Externalize the Story with JSON
Your first step is to move the story data out of your ColdFusion code.
Create story.json: Create a new file named story.json.
Move the Data: Copy the story struct from your original .cfm file and paste it into story.json. You will need to convert it to valid JSON syntax (e.g., use double quotes for all keys and string values).
Example story.json:

{
    "start": {
        "title": "The Crossroads",
        "storyText": "You are at a crossroads. A dark forest looms to the left, and a mysterious cave entrance is to your right.",
        "choices": [
            { "text": "Enter the forest", "destination": "forest" },
            { "text": "Explore the cave", "destination": "cave" }
        ]
    },
    "forest": {
        "title": "The Whispering Woods",
        "storyText": "You are lost in the forest. You hear a strange noise and decide to run!",
        "choices": []
    },
    "cave": {
        "title": "The Glimmering Cave",
        "storyText": "The cave is filled with treasure! You win!",
        "choices": []
    }
}


Part 2: Build the OOP Game Engine
Now, let's create a ColdFusion Component (CFC) to act as our game engine.
Create components/Game.cfc: This file will contain all the logic for your game.
Define the Component: Start the file by defining it as a ColdFusion Component.
Create the init Method: The init method (our constructor) should run when the object is created. Inside this method:
Read the story.json file from the disk.
Convert the JSON data into a native ColdFusion struct.
Store this struct in a private scope within the component.
Ensure the init method properly returns the component instance.
Create a getScene Method: Create a public function called getScene that accepts one argument, sceneName. This function will look up the requested scene in your story data and return it.

Part 3: Update the Main View
Your adventure.cfm file will now be much simpler. Its only job is to display the data it gets from the Game.cfc.
Instantiate the Component: At the top of adventure.cfm, create an instance of your game engine.
Get the Scene: Use your component's method to get the current scene data based on a URL parameter.
The rest of the file will work just like before, displaying the title, story text, and choices for the current scene.
Part 4: Implement the REST API for State
Let's create a way to "save" and "load" the player's position using the session scope.
Create api/state.cfm: This file will handle requests to manage the game state.
Check the HTTP Verb: A REST API behaves differently based on the HTTP request method. Your code will need to determine whether the incoming request is a GET, POST, or DELETE.
Implement CRUD Logic:
Create/Update (POST): When a POST request is received, it should save the player's current scene to their session.
Read (GET): When a GET request is received, it should check for a saved game in the session. If one exists, it should redirect the user to that scene. Otherwise, it should send them to the start.
Delete (DELETE): When a DELETE request is received, it should clear any saved game data from the user's session.
Connect the UI: In adventure.cfm, add "Save Game", "Load Game", and "New Game" buttons. These buttons should trigger the correct POST, GET, and DELETE requests to your api/state.cfm endpoint.
Bonus Challenge
Expand the State: Modify the API to save a player's inventory (an array of items) in the session alongside their current scene. Add items to find in certain scenes.


