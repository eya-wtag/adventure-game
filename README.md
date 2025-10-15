
# 🏰 ColdFusion Coding Challenge: OOP Adventure Game
---
### CF Challenge Description 

This project is a small, functional command-line style adventure game built in ColdFusion (CFML) designed to demonstrate key Object-Oriented Programming (OOP) and API development concepts.

---
### Prerequisites
Ensure you have the following installed:
- [Docker](https://www.docker.com/get-started)
- [Git](https://git-scm.com/)
---

### ✨Core Concepts Demonstrated

This application serves as an example of modern CFML development by implementing:

- Components (CFCs): Encapsulating game logic within a reusable Game.cfc.

- File I/O and JSON Parsing: Externalizing game data (the story) into a story.json file for easy configuration.

- REST API Basics: Creating a simple API endpoint (api/state.cfm) to manage game state using HTTP verbs (GET, POST, DELETE).

- Session Management: Utilizing the ColdFusion session scope for persisting user-specific data (saved games).
---
### ✨Start Up the Docker Containers

Once inside the project root directory, start up the Docker containers:

```bash
docker-compose up --build
```
---

### ✨Running the Project

Enter the following address in your browser:

``http://127.0.0.1:8888/``
---
