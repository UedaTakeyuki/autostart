# autostart
The Simplest way to make your application as servce by addapting ``versatile systemctl unit file`` and providing ``useful command`` for system starting/stoping/status-checking.

## For what application?
This is for application:

- just start with calling single command file.
- The name of the folder that contains the command is the same as the command file name

For example:

```
├───foo
│    foo

```

## how does this works
Recognize command to start from folder name, and make systemctl unit file.


## install
Install this as ``submodule`` into your project as follow:

```
cd your-project-dir
git submodule add git@github.com:UedaTakeyuki/autostart.git
```

## setup
Call ``setup.sh`` to make symbolic links to your project as follow:

```
cd autostart
./setup.sh
```

The following links must be created on your project

- autostart.sh

## how to use
```
./autostart.sh -h
Usage: ./autostart.sh [--on]/[--off]
  [--on]:               Set autostart as ON. 
  [--off]:              Set autostart as OFF. 
  [--status]:           Show current status. 
```

## history
- v1.0.0: 2021.06.04 extracted this feature from my other project
- v1.1.0: 2021.07.03 first practical version, confirmed adaptation.
