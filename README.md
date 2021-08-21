# Beyond-All-Reason

![Discord](https://img.shields.io/discord/225695362004811776)

Open source RTS game built on top of the Spring RTS Engine

## How To Play

https://www.beyondallreason.info/download

## Development Quick Start

Beyond All Reason (BYAR), consists of 2 primary components, the lobby (Chobby - https://github.com/beyond-all-reason/BYAR-Chobby) and the game code itself (this repository).

The game runs on top of the Spring engine https://github.com/spring/spring.

In order to develop the game (this repository) you first need a working install of the lobby/launcher. There are 2 ways to do this:

1. Follow [the guide in the Chobby README](https://github.com/beyond-all-reason/BYAR-Chobby#developing-the-lobby). First download a [release of Chobby](https://github.com/beyond-all-reason/BYAR-Chobby/releases) and then launch Chobby, this will automatically download and install the engine and other dependencies.

2. [Download the full BAR application](https://www.beyondallreason.info/download#How-To-Install) from the website and run it. This is probably what you will have done if you have previously installed and played the game.

Once you have a working install of BAR you need a local development copy of the game code to work with. This code will live in the BYAR install directory.

1. To find the BYAR install directory simply open the launcher (not full game) and click the "Open install directory" button. This is one of the 3 buttons (`Toggle log` and `Upload log` are the other 2). For Windows installs this might be your user's `AppData/Local/Programs/Beyond-All-Reason/data` directory.

2. In the BYAR install directory create the empty file `devmode.txt`.

3. In the BYAR install directory in the `games` sub-directory (create if it doesn't exist) clone the code for this repository into a directory with a name ending in `.sdd`. For example:

```
git clone https://github.com/beyond-all-reason/Beyond-All-Reason.git BAR.sdd
```

4. Now you have the game code launch the full game from the launcher as normal. Then go to `Settings > Developer > Singleplayer` and select `Beyond All Reason Dev`.

5. Now you can launch a match normally through the game UI. This match will use the dev copy of the LUA code which is in `BYAR-install-directory/games/BAR.sdd`.

6. If developing Chobby also clone the code into the `games` directory. Follow the guide in the [Chobby README](https://github.com/beyond-all-reason/BYAR-Chobby#developing-the-lobby).

More on the `.sdd` directory to run raw LUA and the structure expected by Spring Engine is [documented here](https://springrts.com/wiki/Gamedev:Structure).

## Flatpak

Building the Flatpak requires the following Flatpak extensions:

```
flatpak install org.freedesktop.Sdk.Extension.openjdk11
```

Then run this command in the terminal:

```
flatpak-builder build-dir info.beyondallreason.bar.yml --force-clean
```
